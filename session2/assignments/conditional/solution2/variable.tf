variable "performance" {
  description = "Performance level for the EC2 instance (high, medium, or low)"
  type        = string
  default     = "low"
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instances"
  type        = string
  default     = "ami-0198a868663199764" # Replace with a valid AMI ID in your region
}