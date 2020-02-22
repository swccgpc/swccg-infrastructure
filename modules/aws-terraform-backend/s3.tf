

resource "aws_s3_bucket" "tfstate" {
  bucket = local.s3_bucket_name
  acl    = "private"

  versioning {
    enabled = true
  } ## versioning

  lifecycle {
    prevent_destroy = true
  } ## lifecycle

  tags = {
    Name        = local.s3_bucket_name
    Purpose     = "Terraform State"
    Environment = var.env_name
    Owner       = "Created by Terraform"
  } ## tags

} ## resource aws_s3_bucket

