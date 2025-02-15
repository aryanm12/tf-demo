variable "req_s3_buckets" {
  description = "List of AWS S3 buckets"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}