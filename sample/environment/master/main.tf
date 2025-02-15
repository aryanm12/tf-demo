module "eks" {
  source = "../../modules/eks"

  cluster_name                           = var.eks_cluster_name
  cluster_version                        = var.eks_cluster_version
  vpc_id                                 = var.vpc_id
  subnet_ids                             = var.eks_subnet_ids
  route_table_ids                        = var.eks_route_table_ids
  fargate_profile                        = var.fargate_profile
  vpc_cni_role_name                      = var.vpc_cni_role_name
  vpc_cni_version                        = var.vpc_cni_version
  coredns_version                        = var.coredns_version
  kube_proxy_version                     = var.kube_proxy_version
  ecr_aws_account_id                     = var.ecr_aws_account_id
  create_s3_ep                           = var.create_s3_ep
  create_aws_lb_controller               = var.create_aws_lb_controller
  aws_load_balancer_controller_role_name = var.aws_load_balancer_controller_role_name
  helm_chart_version                     = var.aws_lb_helm_chart_version
  tags                                   = var.tags
  region                                 = var.region
}

module "aurora_postgresql_1" {
  source = "../../modules/aurora_postgresql"

  cluster_identifier      = var.aurora_postgresql_1.cluster_identifier
  req_for                 = "xxx"
  subnet_ids              = var.aurora_postgresql_1.subnet_ids
  engine_version          = var.aurora_postgresql_1.engine_version
  database_name           = var.aurora_postgresql_1.database_name
  master_username         = var.aurora_postgresql_1.master_username
  master_password         = var.aurora_postgresql_1.master_password
  backup_retention_period = var.aurora_postgresql_1.backup_retention_period
  preferred_backup_window = var.aurora_postgresql_1.preferred_backup_window
  storage_encrypted       = var.aurora_postgresql_1.storage_encrypted
  deletion_protection     = var.aurora_postgresql_1.deletion_protection
  instance_class          = var.aurora_postgresql_1.instance_class
  instance_count          = var.aurora_postgresql_1.instance_count
  vpc_id                  = var.vpc_id
  eks_security_group_id   = [module.eks.eks_security_group_id]
  dev_snapshot_arn        = var.aurora_postgresql_1.dev_snapshot_arn
  tags                    = var.tags
}