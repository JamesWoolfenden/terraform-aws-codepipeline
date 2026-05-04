resource "aws_kms_key" "example" {
  # checkov:skip=CKV2_AWS_64: For example only, key policy managed via IAM
  enable_key_rotation = true
  policy              = <<POLICY
{
  "Sid": "Enable IAM User Permissions",
  "Effect": "Allow",
  "Principal": {
    "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
   },
  "Action": "kms:*",
  "Resource": "*"
}
POLICY
}
