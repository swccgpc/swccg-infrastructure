
resource "aws_ecr_repository" "this" {
  name                 = var.ecr_name
  ##
  ## If an image tag is IMMUTABLE then it can NOT be overwritten.
  ##
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  } ## image_scanning_configuration
} ## resource aws_ecr_repository this


output "ecr_arn" {
  value = aws_ecr_repository.this.arn
}

output "ecr_registry_id" {
  value = aws_ecr_repository.this.registry_id
}

output "ecr_repository_url" {
  value = aws_ecr_repository.this.repository_url
}

