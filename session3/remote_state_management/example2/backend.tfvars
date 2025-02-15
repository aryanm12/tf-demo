    bucket         = "hvd-terraform-state"
    key            = "terraform/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-lock"