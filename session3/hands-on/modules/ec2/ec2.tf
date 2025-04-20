resource "aws_instance" "generic-ec2" {
  for_each          = var.instance
  ami               = var.ami_id
  instance_type     = each.value.instance_type
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.key
  }
}