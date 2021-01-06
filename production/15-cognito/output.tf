
output "aws_cognito_user_pool_this_endpoint" {
  description = "Cognito Pool Endpoint"
  value       = module.starwarsccg.aws_cognito_user_pool_this_endpoint
} ## output

output "aws_cognito_user_pool_this_arn" {
  description = "Cognito Pool ARN"
  value       = module.starwarsccg.aws_cognito_user_pool_this_arn
} ## output

output "aws_cognito_user_pool_id" {
  description = "Cognito Pool ID"
  value       = module.starwarsccg.aws_cognito_user_pool_id
} ## output

