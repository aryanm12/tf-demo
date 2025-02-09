variable "environments" {
  default = {
    dev     = "dev-terraform-xxx-bucket"
    staging = "staging-terraform-xxx-bucket"
    prod    = "prod-terraform-xxx-bucket"
  }
}