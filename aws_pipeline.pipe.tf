resource "aws_codepipeline" "pipe" {
  artifact_store {
    location = var.artifact_store["location"]
    type     = var.artifact_store["type"]
  }

  name     = var.name
  role_arn = local.role_arn

  dynamic "stage" {
    for_each = [for s in var.stages : {
      name   = s.name
      action = s.action
    }]

    content {
      name = stage.value.name
      action {
        name             = stage.value.action["name"]
        owner            = stage.value.action["owner"]
        version          = stage.value.action["version"]
        category         = stage.value.action["category"]
        provider         = stage.value.action["provider"]
        input_artifacts  = stage.value.action["input_artifacts"]
        output_artifacts = stage.value.action["output_artifacts"]
        configuration    = stage.value.action["configuration"]
      }
    }
  }


  tags = var.common_tags
}

locals {
  role_arn = "${var.role_arn == "" ? aws_iam_role.pipeline.0.arn : var.role_arn}"
}
