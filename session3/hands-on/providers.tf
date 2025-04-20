terraform {
  backend "s3" {
    bucket         = "demo01-terraform-state-bucket"
    key            = "terraform/terraform.tfstate"
    region         = "ap-southeast-1"
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
  region  = "ap-southeast-1"
  profile = "hvd"
}