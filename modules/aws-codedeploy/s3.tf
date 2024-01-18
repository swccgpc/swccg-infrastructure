

resource "aws_s3_bucket" "codedeploy" {
  bucket = "swccg-codedeploy"

  tags = {
    Name        = "codedeploy"
    Purpose     = "CodeDeploy"
    Owner       = "Created by Terraform"
  } ## tags

} ## resource aws_s3_bucket

resource "aws_s3_bucket_public_access_block" "codedeploy" {
  bucket = aws_s3_bucket.codedeploy.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
} ## resource aws_s3_bucket_public_access_block


resource "aws_s3_bucket_ownership_controls" "codedeploy" {
  bucket = aws_s3_bucket.codedeploy.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "codedeploy" {
  depends_on = [
    aws_s3_bucket_ownership_controls.codedeploy,
    aws_s3_bucket_public_access_block.codedeploy,
  ]

  bucket = aws_s3_bucket.codedeploy.id
  acl    = "private"
}
