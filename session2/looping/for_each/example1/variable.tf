variable "ami_id" {
    type = string
    default = "ami-0198a868663199764"
}

variable "instance" {
  default = {
    "web-server" = "t3.micro"
    "data-server" = "t2.micro"
  }
  type = map(string)
}