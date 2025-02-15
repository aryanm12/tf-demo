variable "ami_id" {
    type = string
    default = "ami-0198a868663199764"
}

variable "environment" {
    type = string
    default = "dev"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}