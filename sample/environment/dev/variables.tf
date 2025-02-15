variable "region" {
  description = "The AWS region to deploy the resources"
  type        = string
}

variable "vpc_id" {
  description = "The AWS region to deploy the resources"
  type        = string
}

variable "eks_subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "eks_route_table_ids" {
  description = "EKS Subnets Route Table Ids"
  type        = list(string)
}

variable "ecr_aws_account_id" {
  description = "AWS account id in which ECR repositories are created"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "Version of the EKS Cluster"
  type        = string
}

variable "fargate_profile" {
  description = "Map of Fargate Profile configurations."
  type = map(object({
    namespace = string
  }))
}

variable "aurora_postgresql_transact" {
  description = "Configuration for Aurora PostgreSQL cluster for transact db"
  type = object({
    cluster_identifier      = string
    subnet_ids              = list(string)
    engine_version          = string
    database_name           = string
    master_username         = string
    master_password         = string
    backup_retention_period = number
    preferred_backup_window = string
    storage_encrypted       = bool
    deletion_protection     = bool
    instance_class          = string
    instance_count          = number
  })
}

variable "aurora_postgresql_tdh" {
  description = "Configuration for Aurora PostgreSQL cluster for TDH db"
  type = object({
    cluster_identifier      = string
    subnet_ids              = list(string)
    engine_version          = string
    database_name           = string
    master_username         = string
    master_password         = string
    backup_retention_period = number
    preferred_backup_window = string
    storage_encrypted       = bool
    deletion_protection     = bool
    instance_class          = string
    instance_count          = number
  })
}

variable "aurora_postgresql_des" {
  description = "Configuration for Aurora PostgreSQL cluster for DES db"
  type = object({
    cluster_identifier      = string
    subnet_ids              = list(string)
    engine_version          = string
    database_name           = string
    master_username         = string
    master_password         = string
    backup_retention_period = number
    preferred_backup_window = string
    storage_encrypted       = bool
    deletion_protection     = bool
    instance_class          = string
    instance_count          = number
  })
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "vpc_cni_role_name" {
  description = "VPC CNI Role Name"
  type        = string
}

variable "vpc_cni_version" {
  description = "VPC CNI addon version"
  type        = string
}

variable "coredns_version" {
  description = "Coredns addon version"
  type        = string
}

variable "kube_proxy_version" {
  description = "kube proxy addon version"
  type        = string
}

variable "create_s3_ep" {
  description = "Flag to enable creation of S3 VPC endpoint"
  type        = bool
}

variable "create_aws_lb_controller" {
  description = "Flag to enable creation of AWS Load Balancer controller"
  type        = bool
}

variable "aws_load_balancer_controller_role_name" {
  description = "AWS Load Balancer controller Role Name"
  type        = string
}

variable "aws_lb_helm_chart_version" {
  description = "AWS Load Balancer controller Helm Chart version"
  type        = string
}

variable "efs_storage_name" {
  description = "Name of the EFS filesystem"
  type        = string
}

variable "aws_kinesis_des_role_name" {
  description = "AWS Kinesis Role Name for DES"
  type        = string
}

variable "des_kinesis_stream_names" {
  description = "List of Kinesis stream names"
  type        = list(string)
}

variable "temenos_s3_buckets" {
  description = "List of AWS S3 buckets"
  type        = list(string)
}

variable "aws_tde_role_name" {
  description = "AWS IAM Role Name for TDE"
  type        = string
  default     = ""
}