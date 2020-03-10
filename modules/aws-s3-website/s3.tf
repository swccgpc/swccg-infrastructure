
resource "aws_s3_bucket" "this" {
  bucket        = var.s3_bucket_name
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "error.html"
  } ### website


  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["https://www.starwarsccg.org", "https://vkit.starwarsccg.org", "https://forum.starwarsccg.org", "https://store.starwarsccg.org", "https://res.starwarsccg.org"]
    expose_headers  = ["Authorization", "Access-Control-Allow-Origin"]
    #max_age_seconds = 3000
  }

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



