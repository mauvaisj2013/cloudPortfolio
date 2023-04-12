provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_security_group" "forECS" {
  name        = "forECS"
  description = "Allow HTTP inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    #security_groups  = ["${aws_security_group.forMauvaisALB.id}"]
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_task_execution_role"
 
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ecs-tasks.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}
 
resource "aws_iam_role_policy_attachment" "ecs-task-execution-role-policy-attachment" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

#resource "aws_route" "internet_access" {
#  route_table_id         = data.aws_vpc.default_vpc.main_route_table_id
#  destination_cidr_block = "0.0.0.0/0"
#  gateway_id             = aws_internet_gateway.igw.id
#}

resource "aws_route_table" "route" {
    vpc_id = "${data.aws_vpc.default_vpc.id}"
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${data.aws_internet_gateway.default.id}"
    }
}

resource "aws_route_table_association" "rt1" {
    subnet_id = "${aws_default_subnet.default_az1.id}"
    route_table_id = "${aws_route_table.route.id}"
}

resource "aws_route_table_association" "rt2" {
    subnet_id = "${aws_default_subnet.default_az2.id}"
    route_table_id = "${aws_route_table.route.id}"
}

resource "aws_route_table_association" "rt3" {
    subnet_id = "${aws_default_subnet.default_az3.id}"
    route_table_id = "${aws_route_table.route.id}"
}

#data "aws_iam_role" "example" {
#  name = "an_example_role_name"
#}

resource "aws_ecs_cluster" "catCluster" {
  name = "catCluster"
}

resource "aws_ecs_task_definition" "service" {
  family                   = "linux"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = 512
  memory                   = 1024
  container_definitions    = jsonencode([
    {
      name      = "catpipeline"
      image     = "519284387875.dkr.ecr.us-east-2.amazonaws.com/catpipeline:latest"
      #vcpu       = 0.5
      #memory    = 1
      essential = true
      task_container_assign_public_ip = true
      health_check = {
        port = "traffic-port"
        path = "/"
      }
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "TCP"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "service" {
  name                              = "service"
  cluster                           = aws_ecs_cluster.catCluster.name
  task_definition                   = aws_ecs_task_definition.service.arn
  desired_count                     = 2
  launch_type                       = "FARGATE"
  health_check_grace_period_seconds = 30
  #force_new_deployment              = true

  network_configuration {
    security_groups = [aws_security_group.forECS.id]
    subnets         = ["${aws_default_subnet.default_az1.id}", "${aws_default_subnet.default_az2.id}", "${aws_default_subnet.default_az3.id}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.testTargetGroup2.arn
    container_name   = "catpipeline"
    container_port   = 80
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb" "testALB" {
  name               = "testALB"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.forMauvaisALB.id]
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets            = ["${aws_default_subnet.default_az1.id}", "${aws_default_subnet.default_az2.id}", "${aws_default_subnet.default_az3.id}"]

  enable_deletion_protection = false
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
}
resource "aws_default_subnet" "default_az2" {
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true
}
resource "aws_default_subnet" "default_az3" {
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = true
}

data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_security_group" "forMauvaisALB" {
  name        = "forMauvaisALB"
  description = "Allow HTTP inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_lb_listener" "front_end2" {
  load_balancer_arn = aws_lb.testALB.arn
  port              = "80"
  protocol          = "HTTP"
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.testTargetGroup2.arn
  }
}

resource "aws_lb_target_group" "testTargetGroup2" {
  name        = "testTargetGroup2"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.default_vpc.id

  health_check {
    matcher = "200,301,302"
    path    = "/"
    interval = 120
    timeout = 30
  }
}