
resource "aws_s3_bucket" "this" {
  bucket        = var.s3_bucket_name
  force_destroy = true

  website {
    redirect_all_requests_to = var.redirect_target
  } ### website

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.env_name
    Purpose     = "Static Website Redirect"
    Owner       = "Created by Terraform"
    AwsRegion   = var.aws_region
  } ## tags

} ## resource aws_s3_bucket



