variable "region" {
  description = "The AWS region to deploy the resources"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The version of the EKS cluster."
  type        = string
  default     = "1.30"
}

variable "vpc_id" {
  description = "The AWS region to deploy the resources"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "route_table_ids" {
  description = "EKS Subnets Route Table Ids"
  type        = list(string)
}

variable "fargate_profile" {
  description = "Map of Fargate Profile configurations."
  type = map(object({
    namespace = string
  }))
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

variable "aws_load_balancer_controller_role_name" {
  description = "AWS Load Balancer controller Role Name"
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

variable "helm_chart_version" {
  description = "AWS Load Balancer controller Helm Chart version"
  type        = string
}

variable "ecr_aws_account_id" {
  description = "AWS account id in which ECR repositories are created"
  type        = string
}