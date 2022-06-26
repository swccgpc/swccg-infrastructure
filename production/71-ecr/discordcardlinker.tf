
module "discordcardlinker" {
  source   = "../../modules/aws-ecr"
  ecr_name = "discordcardlinker"
} ## module

output "discordcardlinker_arn" {
  value = module.discordcardlinker.ecr_arn
}

output "discordcardlinker_registry_id" {
  value = module.discordcardlinker.ecr_registry_id
}

output "discordcardlinker_repository_url" {
  value = module.discordcardlinker.ecr_repository_url
}

output "discordcardlinker_image_with_tag" {
  value = "${module.discordcardlinker.ecr_repository_url}:latest"
}