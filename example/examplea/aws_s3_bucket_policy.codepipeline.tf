resource "aws_s3_bucket_policy" "codepipeline" {
  bucket = aws_s3_bucket.codepipeline.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "DenyInsecureTransport"
      Effect    = "Deny"
      Principal = "*"
      Action    = "s3:*"
      Resource  = [aws_s3_bucket.codepipeline.arn, "${aws_s3_bucket.codepipeline.arn}/*"]
      Condition = { Bool = { "aws:SecureTransport" = "false" } }
    }]
  })
}
