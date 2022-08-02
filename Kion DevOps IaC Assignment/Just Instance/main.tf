provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}

####################################################################################################################
##########  VPC FOR TEST ENVIRONMENT  ################################################################
####################################################################################################################
resource "aws_vpc" "Kion_VPC" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name        = "Kion_VPC"
    Environment = "Development"
  }
}

  ####################################################################################################################
##########  SUBNETS FOR VPC  #########################################################################
####################################################################################################################
  resource "aws_subnet" "public_subnet-1" {
  vpc_id            = aws_vpc.Kion_VPC.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true
  
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
##########  INTERNET GATEWAY FOR VPC  ################################################################
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
##########  ROUTE TABLE FOR VPC  ####################################################################
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
##########  ROUTE TABLE ASSOCIATION TO PUBLIC SUBNETS IN VPC  ##############################################
####################################################################################################################
resource "aws_route_table_association" "rt1" {
    subnet_id = "${aws_subnet.public_subnet-1.id}"
    route_table_id = "${aws_route_table.Route.id}"
}


####################################################################################################################
##########  SECURITY GROUP FOR THE INSTANCE IN VPC NAMED MAUVAIS  #################################################
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
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
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
    Name        = "Instance-SG"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer" 
    Environment = "Development"
  }
}

####################################################################################################################
##########  EC2 INSTANCE FOR VPC  ###################################################################
####################################################################################################################
resource "aws_instance" "instanceForKionVPC" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t2.micro"
  key_name      = "JoeAWS"
  vpc_security_group_ids = ["${aws_security_group.Instance-SG.id}"]
  user_data = "${file("init.sh")}"
  subnet_id = "${aws_subnet.public_subnet-1.id}"
  associate_public_ip_address = true

  tags = {
    Name        = "instanceForKionVPC"
    Owner       = "Joe Mauvais"
    Layer       = "Web Layer" 
    Environment = "Development"
  }
}