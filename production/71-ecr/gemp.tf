
module "gemp" {
  source   = "../../modules/aws-ecr"
  ecr_name = "gemp"
} ## module

output "gemp_arn" {
  value = module.gemp.ecr_arn
}

output "gemp_registry_id" {
  value = module.gemp.ecr_registry_id
}

output "gemp_repository_url" {
  value = module.gemp.ecr_repository_url
}

output "gemp_image_with_tag" {
  value = "${module.gemp.ecr_repository_url}:latest"
}