locals {
  artifact_store = {
    location = "codepipeline-${data.aws_region.current.name}-${data.aws_caller_identity.current.account_id}"
  type = "S3" }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
