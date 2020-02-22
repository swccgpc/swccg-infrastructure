
resource "aws_s3_bucket" "this" {
  bucket        = var.s3_bucket_name
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "error.html"
  } ### website

  policy = <<POLICY
{
  "Version": "2008-10-17",
  "Statement": [{
    "Sid":       "PublicReadForGetBucketObjects",
    "Effect":    "Allow",
    "Principal": {"AWS": "*"},
    "Action":    "s3:GetObject",
    "Resource":  "arn:aws:s3:::${var.s3_bucket_name}/*"
  }]
}
POLICY

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.env_name
    Purpose     = "Static Website Hosting"
    Owner       = "Created by Terraform"
    AwsRegion   = var.aws_region
  } ## tags

} ## resource aws_s3_bucket



