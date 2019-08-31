resource "aws_iam_role" "pipeline" {
  count = var.role_arn == "" ? 1 : 0
  name  = "AWSCodePipelineServiceRole-${data.aws_region.current.name}-${var.name}"
  path  = "/service-role/"

  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codepipeline.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}
