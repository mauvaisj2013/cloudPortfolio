provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}

resource "aws_ecr_repository" "catpipeline" {
  name                 = "catpipeline"
  #image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_iam_role" "codebuild-catpipeline-build-service-role2" {
  name = "codebuild-catpipeline-build-service-role2"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "test-attachment" {
  name       = "test-attachment"
  roles      = [aws_iam_role.codebuild-catpipeline-build-service-role2.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_codebuild_project" "catpipeline-build" {
    name            = "catpipeline-build"
    service_role    = aws_iam_role.codebuild-catpipeline-build-service-role2.arn

    artifacts {
        type = "NO_ARTIFACTS"
    }

    environment {
        type                        = "LINUX_CONTAINER"
        compute_type                = "BUILD_GENERAL1_SMALL"
        image                       = "aws/codebuild/standard:3.0"
        image_pull_credentials_type = "CODEBUILD"
        privileged_mode             = true

        environment_variable {
          name  = "AWS_DEFAULT_REGION"
          value = "us-east-2"
        }
        
        environment_variable {
          name = "AWS_ACCOUNT_ID"
          value = "519284387875"
        }
      
        environment_variable {
          name = "IMAGE_TAG"
          value = "latest"
        }

        environment_variable {
          name = "IMAGE_REPO_NAME"
          value = "catpipeline"
        }
    }

    logs_config {
      cloudwatch_logs {
        group_name  = "a4l-codebuild"
        stream_name = "catpipeline"
        }
    }

    source { 
        type            = "CODECOMMIT"
        buildspec       = "buildspec.yml"
        location        = "https://git-codecommit.us-east-2.amazonaws.com/v1/repos/catPipeline-CodeCommit2" #MUST BE THE HTTPS URL!!
        git_clone_depth = 0
    }   
}

data "aws_s3_bucket" "codepipeline-us-east-2-653257747517" {
  bucket = "codepipeline-us-east-2-653257747517"
}