
terraform {
  backend "s3" {
    bucket         = "hvd-terraform-state"
    key            = "terraform/terraform.tfstate"
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

# Configure the AWS Provider for a different region using alias
provider "aws" {
  region = "us-west-1"
  alias = "us-west"
}
