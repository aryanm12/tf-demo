variable "region" {
  description = "The AWS region to deploy the resources"
  type        = string
}

variable "account_ids" {
  description = "The list of AWS account ids which requires ECR repo access"
  type        = list(string)
}

variable "repository_count" {
  description = "The number of ECR repositories to create"
  type        = number
}

variable "repository_names" {
  description = "The list of ECR repository names"
  type        = list(string)
}

variable "image_tag_mutability" {
  description = "The image tag mutability setting for the repositories"
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}
