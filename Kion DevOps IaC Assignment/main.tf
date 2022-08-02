provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}

####################################################################################################################
##########  VPC FOR TEST ENVIRONMENT  ##############################################################################
####################################################################################################################
resource "aws_vpc" "Kion_VPC" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = "Kion_VPC"
    Environment = "Development"
  }
}

#####################################################################################################################
##########  SUBNETS FOR VPC  ########################################################################################
#####################################################################################################################
  resource "aws_subnet" "public_subnet-1" {
  vpc_id            = aws_vpc.Kion_VPC.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-2a"
  
  tags = {
    Name        = "public_subnet-1"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer"    
    Environment = "Development"
  }
}

  resource "aws_subnet" "private_subnet-1" {
  vpc_id            = aws_vpc.Kion_VPC.id
  cidr_block        = "10.1.4.0/24"
  availability_zone = "us-east-2b"
  
  tags = {
    Name        = "private_subnet-1"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer" 
    Environment = "Development"
  }
}

####################################################################################################################
##########  INTERNET GATEWAY FOR VPC  ##############################################################################
####################################################################################################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Kion_VPC.id

  tags = {
    Name        = "igw"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer" 
    Environment = "Development"
  }
}

####################################################################################################################
##########  ROUTE TABLE FOR VPC  ###################################################################################
####################################################################################################################
resource "aws_route_table" "Route" {
    vpc_id = "${aws_vpc.Kion_VPC.id}"
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }
    
    tags = {
        Name        = "Route"
        Owner       = "Joe Mauvais"
        Layer       = "Web Layer" 
        Environment = "Development"
    }
}

####################################################################################################################
##########  ROUTE TABLE ASSOCIATION TO PUBLIC SUBNETS IN VPC  ######################################################
####################################################################################################################
resource "aws_route_table_association" "rt1" {
    subnet_id = "${aws_subnet.public_subnet-1.id}"
    route_table_id = "${aws_route_table.Route.id}"
}

####################################################################################################################
##########  SECURITY GROUP FOR THE ALB  ############################################################################
####################################################################################################################
resource "aws_security_group" "ALB-SG" {
  name        = "ALB-SG"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Kion_VPC.id

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

  tags = {
    Name        = "ALB-SG"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer" 
    Environment = "Development"
  }
}

####################################################################################################################
##########  SECURITY GROUP FOR THE INSTANCES IN VPC NAMED MAUVAIS  #################################################
####################################################################################################################
resource "aws_security_group" "Instance-SG" {
  name        = "Instance-SG"
  description = "Allow HTTP and SSH inbound traffic only from ALB"
  vpc_id      = aws_vpc.Kion_VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.ALB-SG.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Instance-SG"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer" 
    Environment = "Development"
  }
}

####################################################################################################################
##########  EC2 INSTANCE FOR VPC  ##################################################################################
####################################################################################################################
resource "aws_instance" "instanceForKionVPC" {
  ami           = "ami-0a720b4f09ed40260"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.Instance-SG.id}"]
  subnet_id = "${aws_subnet.private_subnet-1.id}"
  user_data = "${file("init2.sh")}"

  tags = {
    Name        = "instanceForKionVPC"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer" 
    Environment = "Development"
  }
}

####################################################################################################################
##########  ALB FOR VPC INSTANCE  ##################################################################################
####################################################################################################################
resource "aws_lb" "ALB" {
  name               = "ALB"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ALB-SG.id]
  subnets            = ["${aws_subnet.public_subnet-1.id}","${aws_subnet.private_subnet-1.id}"]

  enable_deletion_protection = false

  tags = {
    Name        = "instanceForKionVPC"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer" 
    Environment = "Development"
  }
}

resource "aws_lb_target_group" "testTargetGroup" {
  name        = "testTargetGroup2"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.Kion_VPC.id

  health_check {
    matcher = "200,301,302"
    path    = "/"
    interval = 120
    timeout = 30
  }
}

resource "aws_lb_target_group_attachment" "firstAttachment" {
  target_group_arn = aws_lb_target_group.testTargetGroup.arn
  target_id        = aws_instance.instanceForKionVPC.id
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.testTargetGroup.arn
  }
}