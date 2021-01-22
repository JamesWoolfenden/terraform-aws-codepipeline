
locals {
  role_arn = var.role_arn == "" ? aws_iam_role.pipeline.0.arn : var.role_arn
}
