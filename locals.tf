
locals {
  role_arn  = var.role_arn == "" ? aws_iam_role.pipeline.0.arn : var.role_arn
  role_name = var.role_arn == "" ? "AWSCodePipelineServiceRole-${data.aws_region.current.name}-${var.name}" : ""
}
