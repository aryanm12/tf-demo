resource "aws_subnet" "private_subnet_01" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.demo_prv_sub_cidr_01
  tags = {
    Name = var.prv_sub_name_01
  }
}

resource "aws_subnet" "private_subnet_02" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.demo_prv_sub_cidr_02
  tags = {
    Name = var.prv_sub_name_02
  }
}

resource "aws_route_table" "prv_rt" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "prv_rt"
  }
}

resource "aws_route_table_association" "prv01" {
  subnet_id      = aws_subnet.private_subnet_01.id
  route_table_id = aws_route_table.prv_rt.id
}

resource "aws_route_table_association" "prv02" {
  subnet_id      = aws_subnet.private_subnet_02.id
  route_table_id = aws_route_table.prv_rt.id
}