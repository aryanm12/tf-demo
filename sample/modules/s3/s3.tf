resource "aws_s3_bucket" "s3" {
  for_each = toset(var.req_s3_buckets)
  
  bucket = each.value
  tags   = var.tags
}