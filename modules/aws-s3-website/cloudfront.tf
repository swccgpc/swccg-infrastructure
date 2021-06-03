
resource "aws_cloudfront_distribution" "this" {

  origin {
    ## The DNS domain name of either the S3 bucket, 
    ## or web site of your custom origin.
    ## Something like: swccg.hubner.dev.s3-website-us-east-1.amazonaws.com
    domain_name = aws_s3_bucket.this.bucket_regional_domain_name
    ## A unique identifier for the origin.
    ## Something like S3-swccg.hubner.dev
    origin_id   = local.s3_origin_id
  } ## origin

  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.s3_bucket_name
  default_root_object = var.default_root_object

  #logging_config {
  #  include_cookies = false
  #  bucket          = "mylogs.s3.amazonaws.com"
  #  prefix          = "myprefix"
  #}

  aliases = var.domain_names

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      ##
      ## Indicates whether you want CloudFront to forward query strings 
      ## to the origin that is associated with this cache behavior.
      ##
      query_string = false

      ##
      ## Origin header is required to pull the
      ## CORS settings from the S3 bucket.
      ##
      headers      = ["Access-Control-Allow-Origin", "Access-Control-Request-Headers", "Access-Control-Request-Method", "Origin"]

      cookies {
        ##
        ## Specifies whether you want CloudFront to forward cookies 
        ## to the origin that is associated with this cache behavior.
        ## You can specify: all, none, or whitelist.
        ## If whitelist, you must include the subsequent whitelisted_names
        forward = "none"
      } ## cookies
    } ## forwarded_values

    ##
    ## One of allow-all, https-only, or redirect-to-https
    ##
    #viewer_protocol_policy = "redirect-to-https"
    viewer_protocol_policy = var.viewer_protocol_policy
    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl

  } ## default_cache_behavior

  restrictions {
    geo_restriction {
      restriction_type = "none"
    } ## geo_restriction
  } ## restrictions


  ##
  ## PriceClass_All = all locations
  ## PriceClass_200 = us, ca, europe, middle-east, africa
  ## PriceClass_100 = us, ca, europe
  ##
  price_class = "PriceClass_100"

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.env_name
    Purpose     = "Static Website Hosting"
    Owner       = "Created by Terraform"
    AwsRegion   = var.aws_region
    Application = local.application
  } ## tags

  viewer_certificate {
    cloudfront_default_certificate = false
    ##
    ## The ACM certificate must be in US-EAST-1.
    ##
    acm_certificate_arn            = var.acm_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2018"
  } ## viewer_certificate

} ## resource aws_cloudfront_distribution this
