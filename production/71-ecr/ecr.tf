
module "ecr" {
  source            = "../../modules/aws-ecr"
} ## module

output "discordcardlinker_arn" {
  value = module.ecr.discordcardlinker_arn
}

output "discordcardlinker_registry_id" {
  value = module.ecr.discordcardlinker_registry_id
}

output "discordcardlinker_repository_url" {
  value = module.ecr.discordcardlinker_repository_url
}

output "discordcardlinker_image_with_tag" {
  value = "${module.ecr.discordcardlinker_repository_url}:latest"
}