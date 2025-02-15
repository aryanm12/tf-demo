variable "ami_id" {
    type = string
    default = "ami-0198a868663199764"
}

variable "instance_name" {
    type = list(string)
    default = ["web-server", "data-server"]
}

variable "instance_type" {
    type = list(string)
    default = ["t3.micro", "t2.micro"]
}