# cloudPortfolio

Hello World. This is where you'll find my IaC Assignment submission for the DevOps Engineer position here at Kion.

This infrastructure consists of an EC2 instance hosting an Apache web server in a custom private subnet that's part of a 
custom VPC.

It sits behind and Application Load Balancer (ALB) and has a Security Group that accepts HTTP communication only 
from the ALB's Security Group.

This architecture, while a bit overkill for one instance, does take some security and best practices in mind considering
the instance is not exposed to the public internet and custom networking resources are used for the company rather than
the default VPC and subnets.

While I have set up Apache web servers before, this AWS documention was used to assure successful set up of the LAMP stack:
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-lamp-amazon-linux-2.html#setting-file-permissions-2

The EC2 instance use a user data script split into 2 parts. The first part of the script, the init.sh file, performs software
updates and installs LAMP Maria DB and PHP software packages. An initial instance, in the Just Instance folder, is created via
Terraform to run the first part of the script. A custom AMI is then manually created from that instance to be used to create the
instace in this architecture. This is preferred because it speeds up bootstrap of the second instance since all it has left to do is run the secon part of the user data script, the init2.sh file, that creates an index.html file that returns the Hello World message. To load the web page, simply type into your address bar http://<DNS name of the load balancer>/index.html. Typing /index.html is optional.

Within this directory, you will find the main.tf and terraform.exe files (needed to run the terraform scripts), the initial IaC 
Assignment PDF, the init.sh file, this README file, and a screenshot containing the Hellow World output. The sub folder contains
the Terraform script containing the initial instance, the init.sh file, and the terraform.exe file.

Instructions:
1.) In the subfolder, perform the CLI commands in this order: terraform init, terraform plan, terraform apply.
2.) Manually create a custom AMI from the resulting instance. Copy that AMI id. Perform the CLI command terraform destroy.
3.) Paste that AMI id into the instance resource block of this folder's main.tf file.
4.) From this folder, perform the CLI commands in this order: terraform init, terraform plan, terraform apply.
5.) After all resources are created, type into your browser's address bar the URL http://<DNS name of the load balancer>/index.html.