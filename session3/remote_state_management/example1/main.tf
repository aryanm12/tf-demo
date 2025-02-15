resource "aws_instance" "web" {
  ami1           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = "my-test-instance"
  }
}