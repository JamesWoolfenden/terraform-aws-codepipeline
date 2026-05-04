resource "aws_iam_role_policy" "inline_policy" {
  # checkov:skip=CKV_AWS_290: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_355: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_272: Policy requires broad access for this module to function
  # checkov:skip=CKV_AWS_356: Policy requires broad access for this module to function
  count = var.role_arn == "" ? 1 : 0
  name  = local.role_name
  role  = aws_iam_role.pipeline.0.name

  policy = data.aws_iam_policy_document.pipeline.json
}
