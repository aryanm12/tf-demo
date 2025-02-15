resource "aws_rds_cluster" "aurora" {
  cluster_identifier        = var.cluster_identifier
  engine                    = "aurora-postgresql"
  engine_version            = var.engine_version
  database_name             = var.database_name
  master_username           = var.master_username
  master_password           = var.master_password
  backup_retention_period   = var.backup_retention_period
  preferred_backup_window   = var.preferred_backup_window
  db_subnet_group_name      = aws_db_subnet_group.main.name
  vpc_security_group_ids    = [aws_security_group.aurora_pgsql_sg.id]
  storage_encrypted         = var.storage_encrypted
  deletion_protection       = var.deletion_protection
  skip_final_snapshot       = false

  tags = var.tags

  depends_on = [aws_iam_role_policy_attachment.AmazonRDSFullAccess]
  
  lifecycle {
    ignore_changes = [snapshot_identifier]
  }
}

resource "aws_rds_cluster_instance" "aurora_instances" {
  count = var.instance_count

  identifier           = "${var.cluster_identifier}-instance-${count.index + 1}"
  cluster_identifier   = aws_rds_cluster.aurora.id
  instance_class       = var.instance_class
  engine               = aws_rds_cluster.aurora.engine
  engine_version       = aws_rds_cluster.aurora.engine_version
  db_subnet_group_name = aws_db_subnet_group.main.name
  tags                 = var.tags
}

resource "aws_db_subnet_group" "main" {
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.cluster_identifier}-subnet-group"
  }
}