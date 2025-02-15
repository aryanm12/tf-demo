tags = {
  Environment = "dev"
  CostCenter  = "Tobeupdated"
  Department  = "Tobeupdated"
}
region                                 = "ap-southeast-1"
vpc_id                                 = "vpc-xx"
eks_subnet_ids                         = ["subnet-xx", "subnet-xx"]
eks_route_table_ids                    = ["rtb-xx", "rtb-xx"]
ecr_aws_account_id                     = "xxxx"
eks_cluster_name                       = "xx-eks-dev"
vpc_cni_role_name                      = "AmazonEKSVPCCNIRole-xx-eks-dev"
vpc_cni_version                        = "v1.18.2-eksbuild.1"
coredns_version                        = "v1.11.1-eksbuild.9"
kube_proxy_version                     = "v1.30.0-eksbuild.3"
create_s3_ep                           = true
create_aws_lb_controller               = true
aws_load_balancer_controller_role_name = "aws-load-balancer-controller-xx-eks-dev"
eks_cluster_version                    = "1.30"
aws_lb_helm_chart_version              = "1.8.1"
req_s3_buckets                         = ["landing-dev"]
fargate_profile = {
  "fp1" = {
    namespace = "fp1"
  },
  "fp2" = {
    namespace = "xx"
  },
  "fp3" = {
    namespace = "xx"
  },
}
aurora_postgresql_1 = {
  cluster_identifier      = "xx-aurora-dev"
  subnet_ids              = ["subnet-xx", "subnet-xx"]
  engine_version          = "15.4"
  database_name           = "xx"
  master_username         = "xx"
  master_password         = "xxx"
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  storage_encrypted       = true
  deletion_protection     = true
  instance_class          = "db.r6g.xlarge"
  instance_count          = 1
}
aurora_postgresql_2 = {
  cluster_identifier      = "xx-aurora-dev"
  subnet_ids              = ["subnet-xx", "subnet-xx"]
  engine_version          = "15.4"
  database_name           = "xx"
  master_username         = "xx"
  master_password         = "xxx"
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  storage_encrypted       = true
  deletion_protection     = true
  instance_class          = "db.r6g.xlarge"
  instance_count          = 1
}