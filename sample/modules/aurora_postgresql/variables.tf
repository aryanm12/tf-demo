variable "vpc_id" {
  description = "The AWS region to deploy the resources"
  type        = string
}

variable "cluster_identifier" {
  description = "The cluster identifier"
  type        = string
}

variable "engine_version" {
  description = "The database engine version"
  type        = string
  default     = "11.9"
}

variable "database_name" {
  description = "The name of the database"
  type        = string
}

variable "master_username" {
  description = "The master username for the database"
  type        = string
}

variable "master_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "backup_retention_period" {
  description = "The backup retention period in days"
  type        = number
  default     = 7
}

variable "preferred_backup_window" {
  description = "The preferred backup window"
  type        = string
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Specifies whether to enable deletion protection"
  type        = bool
  default     = true
}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
}

variable "instance_count" {
  description = "The number of DB instances to create"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB instances"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "eks_security_group_id" {
  description = "EKS Security group ID created from the EKS module"
  type        = list(string)
}