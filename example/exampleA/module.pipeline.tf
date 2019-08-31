module "codepipeline" {
  source         = "../../"
  artifact_store = var.artifact_store
  build_timeout  = var.build_timeout
  common_tags    = var.common_tags
  description    = var.description
  env            = var.env
  environment    = var.environment
  name           = var.name
  projectroot    = var.projectroot
  stages         = var.stages
}
