variable "ami_id" {
    type = string
    default = "ami-0198a868663199764"
}

variable "instance" {
  default = {
    "web-server" = {
        instance_type = "t3.micro"
        availability_zone = "ap-southeast-1a"
    },
    "data-server" = {
        instance_type = "t2.micro"
        availability_zone = "ap-southeast-1b"
    }
  }
  type = map(object({
    instance_type = string
    availability_zone = string
  }))
}