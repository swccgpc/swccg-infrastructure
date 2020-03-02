
##
## us-east-1 :: used for Cloudfront
##
output "www_starwarsccg_org_use1_acm_certificate_arn" {
  description = "ACM Certificate ARN"
  value       = module.www_starwarsccg_org_use1.acm_certificate_arn
}

output "www_starwarsccg_org_use1_domain_validation_options" {
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined."
  value       = module.www_starwarsccg_org_use1.domain_validation_options
} ## output

##
## us-east-2 :: used for *everything* that is deployed to Ohio
##
output "www_starwarsccg_org_use2_acm_certificate_arn" {
  description = "ACM Certificate ARN"
  value       = module.www_starwarsccg_org_use2.acm_certificate_arn
}

output "www_starwarsccg_org_use2_domain_validation_options" {
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined."
  value       = module.www_starwarsccg_org_use2.domain_validation_options
} ## output

