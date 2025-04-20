variable "vpc_cidr" {}

variable "prv_sub_cidr" {}

variable "instance_configurations" {
    type = map(object({
    instance_type = string
    availability_zone = string
  }))
}