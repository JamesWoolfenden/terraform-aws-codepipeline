module "codepipeline" {
  source         = "../../"
  artifact_store = local.artifact_store
  name           = var.name
  stages         = var.stages
  kms_key_arn    = aws_kms_key.example.arn
}
