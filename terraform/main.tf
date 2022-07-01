provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA7RZ6C6ARWVFR7HPF"
  secret_key = "Q03G35/ZhpyvTR0AmhLhn+AxeGcQ-tXm7o6pvWf7"
}

// User data file inside of S3 bucket
data "aws_s3_bucket_object" "bootstrap_script" {
  bucket = "state_file/blue-state"
  key    = "key_name"
}

// EC2 instance creation while calling user data file
resource "aws_instance" "Demo" {
  ami           = "ABC"
  instance_type = "t3a.medium"
  user_data     = data.aws_s3_bucket_object.bootstrap_script.body

  variable "ec2_sg" {}
  data "aws_security_group" "selected" {
  id = var.ec2_sg
}

  tags = {
    Name = "Demo"
  }
}

// Defining variabole for tagert group assumed to be already created
variable "lb_tg_arn" {
  type    = string
  default = ""
}

variable "aws-tg" {
  type    = string
  default = ""
}

data "aws_lb_target_group" "test" {
  arn  = var.lb_tg_arn
  name = var.aws-tg
}

// Target group attachment
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = var.lb_tg_arn
  target_id        = aws_instance.Demo.id
  port             = 8443
}