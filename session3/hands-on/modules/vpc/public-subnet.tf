resource "aws_subnet" "public_subnet_01" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.demo_pub_sub_cidr_01
  tags = {
    Name = var.pub_sub_name_01
  }
}

resource "aws_subnet" "public_subnet_02" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.demo_pub_sub_cidr_02
  tags = {
    Name = var.pub_sub_name_02
  }
}


resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "pub_rt"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "demo-igw"
  }
}


resource "aws_route_table_association" "pub01" {
  subnet_id      = aws_subnet.public_subnet_01.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub02" {
  subnet_id      = aws_subnet.public_subnet_02.id
  route_table_id = aws_route_table.pub_rt.id
}