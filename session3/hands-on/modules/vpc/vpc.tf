resource "aws_vpc" "demo_vpc" {
  cidr_block = var.demo_vpc_cidr
}