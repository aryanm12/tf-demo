resource "aws_vpc_endpoint" "eks" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.eks"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids
  security_group_ids = [aws_security_group.vpc_endpoints_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids
  security_group_ids = [aws_security_group.vpc_endpoints_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id             = var.vpc_id
  service_name       = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids
  security_group_ids = [aws_security_group.vpc_endpoints_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "s3" {
  count           = var.create_s3_ep ? 1 : 0
  vpc_id          = var.vpc_id
  service_name    = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = var.route_table_ids
}

resource "aws_vpc_endpoint" "elb" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.elasticloadbalancing"
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.subnet_ids
  security_group_ids = [aws_security_group.vpc_endpoints_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "cloudwatch_logs" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.subnet_ids
  security_group_ids = [aws_security_group.vpc_endpoints_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "cloudwatch" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.monitoring"
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.subnet_ids
  security_group_ids = [aws_security_group.vpc_endpoints_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.ec2"
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.subnet_ids
  security_group_ids = [aws_security_group.vpc_endpoints_sg.id]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "sts" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.sts"
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.subnet_ids
  security_group_ids = [aws_security_group.vpc_endpoints_sg.id]
  private_dns_enabled = true
}