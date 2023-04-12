provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}

resource "aws_codecommit_repository" "catPipeline-CodeCommit2" {
  repository_name = "catPipeline-CodeCommit2"
  description     = "This time, we're doing it with Terraform!"
}