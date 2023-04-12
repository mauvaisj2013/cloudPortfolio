provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}

####################################################################################################################
##########  SECURITY GROUP FOR THE ALB IN VPC NAMED MAUVAIS  #######################################################
####################################################################################################################
resource "aws_security_group" "forMauvaisALB" {
  name        = "forMauvaisALB"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Mauvais_VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
#  ingress {
#    description      = "HTTPS from VPC"
#    from_port        = 443
#    to_port          = 443
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "forMauvaisALB"
    Environment = "Test"
  }
}

####################################################################################################################
##########  SECURITY GROUP FOR THE INSTANCES IN VPC NAMED MAUVAIS  #################################################
####################################################################################################################
resource "aws_security_group" "forMauvaisInstances" {
  name        = "forMauvaisInstances"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Mauvais_VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
#  ingress {
#    description      = "HTTPS from VPC"
#    from_port        = 443
#    to_port          = 443
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "forMauvaisInstances"
    Environment = "Test"
  }
}

####################################################################################################################
##########  SECURITY GROUP FOR ALB IN VPC NAMED BON  ###############################################################
####################################################################################################################
resource "aws_security_group" "forBonALB" {
  name        = "forBonALB"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Bon_VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
#  ingress {
#    description      = "HTTPS from VPC"
#    from_port        = 443
#    to_port          = 443
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "forBonALB"
    Environment = "Production"
  }
}

####################################################################################################################
##########  SECURITY GROUP FOR INSTANCES IN VPC NAMED BON  #########################################################
####################################################################################################################
resource "aws_security_group" "forBonInstances" {
  name        = "forBonInstances"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Bon_VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
#  ingress {
#    description      = "HTTPS from VPC"
#    from_port        = 443
#    to_port          = 443
#    protocol         = "tcp"
#    cidr_blocks      = ["0.0.0.0/0"]
#  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "forBonInstances"
    Environment = "Production"
  }
}

####################################################################################################################
##########  TARGET GROUP FOR INSTANCES IN VPC NAMED BON  ###########################################################
####################################################################################################################
resource "aws_lb_target_group" "testTargetGroup1" {
  name        = "testTargetGroup1"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.Bon_VPC.id
}


####################################################################################################################
##########  TARGET GROUP FOR INSTANCES IN VPC NAMED MAUVAIS  #######################################################
####################################################################################################################
resource "aws_lb_target_group" "testTargetGroup2" {
  name        = "testTargetGroup2"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.Mauvais_VPC.id
}

####################################################################################################################
##########  LISTENER FOR INSTANCES IN VPC NAMED MAUVAIS  ###########################################################
####################################################################################################################
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

####################################################################################################################
##########  LISTENER FOR INSTANCES IN VPC NAMED BON  ###############################################################
####################################################################################################################
resource "aws_lb_listener" "front_end1" {
  load_balancer_arn = aws_lb.prodALB.arn
  port              = "80"
  protocol          = "HTTP"
#  ssl_policy        = "ELBSecurityPolicy-2016-08"
#  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.testTargetGroup1.arn
  }
}

####################################################################################################################
##########  TARGET GROUP ATTACHMENT FOR INSTANCES IN VPC NAMED BON  ################################################
####################################################################################################################
resource "aws_lb_target_group_attachment" "firstAttachment" {
#  count            = length(aws_instance.instancesForBonVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup1.arn
  target_id        = aws_instance.instance1ForBonVPC.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "secondAttachment" {
#  count            = length(aws_instance.instancesForBonVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup1.arn
  target_id        = aws_instance.instance2ForBonVPC.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "thirdAttachment" {
#  count            = length(aws_instance.instancesForBonVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup1.arn
  target_id        = aws_instance.instance3ForBonVPC.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "fourthAttachment" {
#  count            = length(aws_instance.instancesForBonVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup1.arn
  target_id        = aws_instance.instance4ForBonVPC.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "fifthAttachment" {
#  count            = length(aws_instance.instancesForBonVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup1.arn
  target_id        = aws_instance.instance5ForBonVPC.id
  port             = 80
}

####################################################################################################################
##########  TARGET GROUP ATTACHMENT FOR INSTANCES IN VPC NAMED MAUVAIS  ############################################
####################################################################################################################
resource "aws_lb_target_group_attachment" "first_Attachment" {
#  count            = length(aws_instance.instancesForMauvaisVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup2.arn
  target_id        = aws_instance.instance1ForMauvaisVPC.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "second_Attachment" {
#  count            = length(aws_instance.instancesForMauvaisVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup2.arn
  target_id        = aws_instance.instance2ForMauvaisVPC.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "third_Attachment" {
#  count            = length(aws_instance.instancesForMauvaisVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup2.arn
  target_id        = aws_instance.instance3ForMauvaisVPC.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "fourth_Attachment" {
#  count            = length(aws_instance.instancesForMauvaisVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup2.arn
  target_id        = aws_instance.instance4ForMauvaisVPC.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "fifth_Attachment" {
#  count            = length(aws_instance.instancesForMauvaisVPC)
  target_group_arn = aws_lb_target_group.testTargetGroup2.arn
  target_id        = aws_instance.instance5ForMauvaisVPC.id
  port             = 80
}

####################################################################################################################
##########  EC2 INSTANCES FOR VPC NAMED BON  #######################################################################
####################################################################################################################
resource "aws_instance" "instance1ForBonVPC" {
  ami                    = "ami-0aeb7c931a5a61206"
  instance_type          = "t2.micro"
#  count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
  subnet_id              = "${aws_subnet.private_subnet1.id}"

  tags = {
    Name = "instance1ForBonVPC"
    Environment = "Production"
  }
}

resource "aws_instance" "instance2ForBonVPC" {
  ami                    = "ami-0aeb7c931a5a61206"
  instance_type          = "t2.micro"
#  count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
  subnet_id              = "${aws_subnet.private_subnet1.id}"

  tags = {
    Name = "instance2ForBonVPC"
    Environment = "Production"
  }
}

resource "aws_instance" "instance3ForBonVPC" {
  ami                    = "ami-0aeb7c931a5a61206"
  instance_type          = "t2.micro"
#  count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
  subnet_id              = "${aws_subnet.private_subnet1.id}"

  tags = {
    Name = "instance3ForBonVPC"
    Environment = "Production"
  }
}

resource "aws_instance" "instance4ForBonVPC" {
  ami                    = "ami-0aeb7c931a5a61206"
  instance_type          = "t2.micro"
#  count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
  subnet_id              = "${aws_subnet.private_subnet1.id}"

  tags = {
    Name = "instance4ForBonVPC"
    Environment = "Production"
  }
}

resource "aws_instance" "instance5ForBonVPC" {
  ami                    = "ami-0aeb7c931a5a61206"
  instance_type          = "t2.micro"
#  count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forBonInstances.id}"]
  subnet_id              = "${aws_subnet.private_subnet1.id}"

  tags = {
    Name = "instance5ForBonVPC"
    Environment = "Production"
  }
}

####################################################################################################################
##########  EC2 INSTANCES FOR VPC NAMED MAUVAIS  ###################################################################
####################################################################################################################
resource "aws_instance" "instance1ForMauvaisVPC" {
  ami           = "ami-0aeb7c931a5a61206"
  instance_type = "t2.micro"
  #count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forMauvaisInstances.id}"]
  subnet_id = "${aws_subnet.private_subnet-1.id}"

  tags = {
    Name        = "instance1ForMauvaisVPC"
    Environment = "Test"
  }
}

resource "aws_instance" "instance2ForMauvaisVPC" {
  ami           = "ami-0aeb7c931a5a61206"
  instance_type = "t2.micro"
  #count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forMauvaisInstances.id}"]
  subnet_id = "${aws_subnet.private_subnet-1.id}"

  tags = {
    Name        = "instance2ForMauvaisVPC"
    Environment = "Test"
  }
}

resource "aws_instance" "instance3ForMauvaisVPC" {
  ami           = "ami-0aeb7c931a5a61206"
  instance_type = "t2.micro"
  #count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forMauvaisInstances.id}"]
  subnet_id = "${aws_subnet.private_subnet-1.id}"

  tags = {
    Name        = "instance3ForMauvaisVPC"
    Environment = "Test"
  }
}

resource "aws_instance" "instance4ForMauvaisVPC" {
  ami           = "ami-0aeb7c931a5a61206"
  instance_type = "t2.micro"
  #count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forMauvaisInstances.id}"]
  subnet_id = "${aws_subnet.private_subnet-1.id}"

  tags = {
    Name        = "instance4ForMauvaisVPC"
    Environment = "Test"
  }
}

resource "aws_instance" "instance5ForMauvaisVPC" {
  ami           = "ami-0aeb7c931a5a61206"
  instance_type = "t2.micro"
  #count                  = 5
  vpc_security_group_ids = ["${aws_security_group.forMauvaisInstances.id}"]
  subnet_id = "${aws_subnet.private_subnet-1.id}"

  tags = {
    Name        = "instance5ForMauvaisVPC"
    Environment = "Test"
  }
}

####################################################################################################################
##########  ALB FOR VPC NAMED MAUVAIS  #############################################################################
####################################################################################################################
resource "aws_lb" "testALB" {
  name               = "testALB"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.forMauvaisALB.id]
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets            = ["${aws_subnet.public_subnet-1.id}", "${aws_subnet.public_subnet-2.id}", "${aws_subnet.public_subnet-3.id}"]

  enable_deletion_protection = false


  tags = {
    Name        = "testALB"
    Environment = "Test"
  }
}

####################################################################################################################
##########  ALB FOR VPC NAMED BON  #################################################################################
####################################################################################################################
resource "aws_lb" "prodALB" {
  name               = "prodALB"
  internal           = false
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.forBonALB.id]
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets             = ["${aws_subnet.public_subnet1.id}", "${aws_subnet.public_subnet2.id}", "${aws_subnet.public_subnet3.id}"]

  enable_deletion_protection = false


  tags = {
    Name        = "prodALB"
    Environment = "Production"
  }
}

####################################################################################################################
##########  VPC FOR TEST ENVIRONMENT NAMED MAUVAIS  ################################################################
####################################################################################################################
resource "aws_vpc" "Mauvais_VPC" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]

  tags = {
    Name = "Mauvais_VPC"
    Environment = "Test"
  }
  }

####################################################################################################################
##########  VPC FOR PRODUCTION ENVIRONMENT NAMED BON  ##############################################################
####################################################################################################################
  resource "aws_vpc" "Bon_VPC" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]

  tags = {
    Name = "Bon_VPC"
    Environment = "Production"
  }
  }

####################################################################################################################
##########  SUBNETS FOR VPC NAMED MAUVAIS  #########################################################################
####################################################################################################################
  resource "aws_subnet" "public_subnet-1" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "us-east-2a"
  
  tags = {
    Name = "public_subnet-1"
    Owner = "Joe Mauvais"
    Layer = "Web Layer"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "public_subnet-2" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.2.0/24"
  availability_zone = "us-east-2b"
  
  tags = {
    Name = "public_subnet-2"
    Owner = "Joe Mauvais"
    Layer = "Web Layer"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "public_subnet-3" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.3.0/24"
  availability_zone = "us-east-2c"
  
  tags = {
    Name = "public_subnet-3"
    Owner = "Joe Mauvais"
    Layer = "Web Layer"  
    Environment = "Test"  
  }
}
  resource "aws_subnet" "private_subnet-1" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.4.0/24"
  availability_zone = "us-east-2a"
  
  tags = {
    Name = "private_subnet-1"
    Owner = "Joe Mauvais"
    Layer = "Application Layer"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "private_subnet-2" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.5.0/24"
  availability_zone = "us-east-2b"
  
  tags = {
    Name = "private_subnet-2"
    Owner = "Joe Mauvais"
    Layer = "Application Layer"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "private_subnet-3" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.6.0/24"
  availability_zone = "us-east-2c"
  
  tags = {
    Name = "private_subnet-3"
    Owner = "Joe Mauvais"
    Layer = "Application Layer"    
    Environment = "Test"
  }
}
  resource "aws_subnet" "private_subnet-4" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.7.0/24"
  availability_zone = "us-east-2a"
  
  tags = {
    Name = "private_subnet-4"
    Owner = "Joe Mauvais"
    Layer = "Database Layer"    
    Environment = "Test"
  }
}

####################################################################################################################
##########  SUBNETS FOR VPC NAMED BON  #############################################################################
####################################################################################################################
  resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.1.0/24"
  availability_zone = "us-east-2a"
  
  tags = {
    Name = "public_subnet1"
    Owner = "Joe Mauvais"
    Layer = "Web Layer"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.2.0/24"
  availability_zone = "us-east-2b"
  
  tags = {
    Name = "public_subnet2"
    Owner = "Joe Mauvais"
    Layer = "Web Layer"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "public_subnet3" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.3.0/24"
  availability_zone = "us-east-2c"
  
  tags = {
    Name = "public_subnet3"
    Owner = "Joe Mauvais"
    Layer = "Web Layer"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.4.0/24"
  availability_zone = "us-east-2a"
  
  tags = {
    Name = "private_subnet1"
    Owner = "Joe Mauvais"
    Layer = "Application Layer"   
    Environment = "Production" 
  }
}
  resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.5.0/24"
  availability_zone = "us-east-2b"
  
  tags = {
    Name = "private_subnet2"
    Owner = "Joe Mauvais"
    Layer = "Application Layer"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "private_subnet3" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.6.0/24"
  availability_zone = "us-east-2c"
  
  tags = {
    Name = "private_subnet3"
    Owner = "Joe Mauvais"
    Layer = "Application Layer"    
    Environment = "Production"
  }
}
  resource "aws_subnet" "private_subnet4" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.7.0/24"
  availability_zone = "us-east-2a"
  
  tags = {
    Name = "private_subnet4"
    Owner = "Joe Mauvais"
    Layer = "Database Layer"    
    Environment = "Production"
  }
}

####################################################################################################################
##########  INTERNET GATEWAY FOR VPC NAMED BON  ####################################################################
####################################################################################################################
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.Bon_VPC.id

}

####################################################################################################################
##########  INTERNET GATEWAY FOR VPC NAMED MAUVAIS  ################################################################
####################################################################################################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Mauvais_VPC.id

}