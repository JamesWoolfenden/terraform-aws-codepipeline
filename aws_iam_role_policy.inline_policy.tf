resource "aws_iam_role_policy" "inline_policy" {
  count = var.role_arn == "" ? 1 : 0
  name  = local.role_name
  role  = aws_iam_role.pipeline.0.name

  policy = data.aws_iam_policy_document.pipeline.json
}
