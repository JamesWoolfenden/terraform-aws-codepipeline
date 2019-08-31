resource "aws_iam_role_policy" "inline_policy" {
  count = var.role_arn == "" ? 1 : 0
  name  = "AWSCodePipeline-${data.aws_region.current.name}-${var.name}"
  role  = aws_iam_role.pipeline.0.name

  policy = data.aws_iam_policy_document.pipeline.json
}
