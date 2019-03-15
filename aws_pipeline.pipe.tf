resource "aws_codepipeline" "pipe" {
  artifact_store = "${var.artifact_store}"
  name           = "${var.name}"
  role_arn       = "${var.role_arn == "" ? aws_iam_role.pipeline.arn : var.role_arn }"
  stage          = "${var.stage}"
}
