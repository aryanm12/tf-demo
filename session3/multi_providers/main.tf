resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = "my-test-instance-ap-southeast-1"
  }
}

resource "aws_instance" "web1" {
  ami           = "ami-0198a868663199764"
  instance_type = "t3.micro"
  provider = aws.us-west
  tags = {
    Name = "my-test-instance-us-west-1"
  }
}
