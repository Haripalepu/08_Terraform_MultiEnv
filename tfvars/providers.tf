
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }

  backend "s3" { #To store statefile in S3. we need to add te below details
    #  bucket = "aws-devops-terrafrombucket"
    #  key    = "TestingStateFile"
    #  region = "us-east-1"
    #  dynamodb_table = "aws-devops-terrafrombucket" #Commented because the actual configaration is in backend.tf files.
  }
}

provider "aws" {
  region = "us-east-1"
}