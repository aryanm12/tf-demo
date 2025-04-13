resource "aws_instance" "tf_demo" {
  count         = 2
  ami           = var.ami_id_demo
  instance_type = var.instance_type_demo
  subnet_id     = var.subnet_id_demo
  tags          = var.tags_demo
}