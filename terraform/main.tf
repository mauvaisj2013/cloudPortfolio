provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}
resource "aws_instance" "forMyPortfolio" {
  ami           = "ami-0aeb7c931a5a61206"
  instance_type = "t2.micro"

  tags = {
    Name = "forMyPortfolio"
  }
}
resource "aws_vpc" "Mauvais_VPC" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Mauvais_VPC"
    Environment = "Test"
  }
  }
  resource "aws_subnet" "public_subnet-1" {
  vpc_id     = aws_vpc.Mauvais_VPC.id
  cidr_block = "10.1.1.0/24"
  
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
  
  tags = {
    Name = "private_subnet-4"
    Owner = "Joe Mauvais"
    Layer = "Database Layer"    
    Environment = "Test"
  }
}


resource "aws_vpc" "Bon_VPC" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Bon_VPC"
    Environment = "Production"
  }
  }
  resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.Bon_VPC.id
  cidr_block = "10.2.1.0/24"
  
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
  
  tags = {
    Name = "private_subnet4"
    Owner = "Joe Mauvais"
    Layer = "Database Layer"    
    Environment = "Production"
  }
}
