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
    } if (lookup(s, "enabled", true)) ]

    content {
      name = stage.value.name
      action {
        name             = stage.value.action["name"]
        owner            = stage.value.action["owner"]
        version          = stage.value.action["version"]
        category         = stage.value.action["category"]
        provider         = stage.value.action["provider"]
        input_artifacts  = lookup(stage.value.action, "input_artifacts", [])
        output_artifacts = lookup(stage.value.action, "output_artifacts", [])
        configuration    = lookup(stage.value.action, "configuration", {})
        role_arn         = lookup(stage.value.action, "role_arn", null)
        run_order        = lookup(stage.value.action, "run_order", null)
        region           = lookup(stage.value.action, "region", data.aws_region.current.name)
      }
    }
  }

  tags = var.common_tags
}
