

output "aws_cloudfront_distribution_this_id" {
  value = aws_cloudfront_distribution.this.id
}
output "aws_cloudfront_distribution_this_arn" {
  value = aws_cloudfront_distribution.this.arn
}
output "aws_cloudfront_distribution_this_hosted_zone_id" {
  value = aws_cloudfront_distribution.this.hosted_zone_id
}
output "aws_cloudfront_distribution_this_domain_name" {
  value = aws_cloudfront_distribution.this.domain_name
}



output "aws_route53_record_this_name" {
  value = aws_route53_record.this.*.name
}
output "aws_route53_record_this_zone_id" {
  value = aws_route53_record.this.*.zone_id
}



output "aws_s3_bucket_this_id" {
  value = aws_s3_bucket.this.id
}
output "aws_s3_bucket_this_arn" {
  value = aws_s3_bucket.this.arn
}
output "aws_s3_bucket_this_bucket_domain_name" {
  value = aws_s3_bucket.this.bucket_domain_name
}
output "aws_s3_bucket_this_bucket_regional_domain_name" {
  value = aws_s3_bucket.this.bucket_regional_domain_name
}
output "aws_s3_bucket_this_hosted_zone_id" {
  value = aws_s3_bucket.this.hosted_zone_id
}
output "aws_s3_bucket_this_region" {
  value = aws_s3_bucket.this.region
}
output "aws_s3_bucket_this_website_endpoint" {
  value = aws_s3_bucket.this.website_endpoint
}
output "aws_s3_bucket_this_website_domain" {
  value = aws_s3_bucket.this.website_domain
}



