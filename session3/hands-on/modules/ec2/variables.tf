variable "ami_id" {
    type = string
}

variable "instance" {
  type = map(object({
    instance_type = string
    availability_zone = string
  }))
}