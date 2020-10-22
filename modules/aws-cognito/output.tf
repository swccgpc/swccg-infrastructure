
output "aws_cognito_user_pool_this_endpoint" {
  description = "Cognito Pool Endpoint"
  value       = aws_cognito_user_pool.this.endpoint
} ## output

output "aws_cognito_user_pool_this_arn" {
  description = "Cognito Pool ARN"
  value       = aws_cognito_user_pool.this.arn
} ## output

output "aws_cognito_user_pool_id" {
  description = "Cognito Pool ID"
  value       = aws_cognito_user_pool.this.id
} ## output

