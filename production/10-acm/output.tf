
output "www_starwarsccg_org_acm_certificate_arn" {
  description = "ACM Certificate ARN"
  value       = module.www_starwarsccg_org.acm_certificate_arn
}

output "store_starwarsccg_org_acm_certificate_arn" {
  description = "ACM Certificate ARN"
  value       = module.store_starwarsccg_org.acm_certificate_arn
}

output "forum_starwarsccg_org_acm_certificate_arn" {
  description = "ACM Certificate ARN"
  value       = module.forum_starwarsccg_org.acm_certificate_arn
}



output "www_starwarsccg_org_domain_validation_options" {
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined."
  value       = module.www_starwarsccg_org.domain_validation_options
} ## output

output "store_starwarsccg_org_domain_validation_options" {
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined."
  value       = module.store_starwarsccg_org.domain_validation_options
} ## output

output "forum_starwarsccg_org_domain_validation_options" {
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined."
  value       = module.forum_starwarsccg_org.domain_validation_options
} ## output


