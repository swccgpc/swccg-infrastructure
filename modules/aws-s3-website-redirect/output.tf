
output "website_domain" {
  description = "S3 Bucket website_domain"
  value       = aws_s3_bucket.this.website_domain
}

output "hosted_zone_id" {
  description = "S3 Bucket hosted_zone_id"
  value       = aws_s3_bucket.this.hosted_zone_id
}
