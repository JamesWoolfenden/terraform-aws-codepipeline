
resource "aws_s3_bucket" "codepipeline" {
  # tfsec:ignore:AWS077
  # tfsec:ignore:AWS002
  # checkov:skip=CKV_AWS_21: "Ensure all data stored in the S3 bucket have versioning enabled"
  # checkov:skip=CKV_AWS_52: "Ensure S3 bucket has MFA delete enabled"
  # checkov:skip=CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
  # checkov:skip=CKV2_AWS_37: not required
  # checkov:skip=CKV2_AWS_41: not_required
  # checkov:skip=CKV_AWS_145: v4 legacy
  # checkov:skip=CKV_AWS_144: v4 legacy
  # checkov:skip=CKV_AWS_19: v4 legacy
  bucket = local.artifact_store.location
  tags   = var.common_tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "codepipeline" {
  bucket = aws_s3_bucket.codepipeline.bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.example.id
      sse_algorithm     = "aws:kms"
    }
  }
}


resource "aws_s3_bucket_acl" "codepipeline" {
  bucket = aws_s3_bucket.codepipeline.bucket
  acl    = "private"
}
resource "aws_s3_bucket_public_access_block" "pipeline" {
  bucket                  = aws_s3_bucket.codepipeline.id
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
}
