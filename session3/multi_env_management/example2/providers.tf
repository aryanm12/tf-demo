
terraform {
  backend "s3" {
    bucket         = "hvd-terraform-state"
    key            = "envs/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
  profile = "hvd"
}