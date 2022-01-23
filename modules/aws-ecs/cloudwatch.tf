
resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/aws/ecs"
  retention_in_days = 1
}