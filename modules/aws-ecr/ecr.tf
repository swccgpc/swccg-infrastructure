
resource "aws_ecr_repository" "discordcardlinker" {
  name                 = "discordcardlinker"
  ##
  ## If an image tag is IMMUTABLE then it can NOT be overwritten.
  ##
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  } ## image_scanning_configuration
} ## resource aws_ecr_repository discordcardlinker


output "discordcardlinker_arn" {
  value = aws_ecr_repository.discordcardlinker.arn
}

output "discordcardlinker_registry_id" {
  value = aws_ecr_repository.discordcardlinker.registry_id
}

output "discordcardlinker_repository_url" {
  value = aws_ecr_repository.discordcardlinker.repository_url
}

