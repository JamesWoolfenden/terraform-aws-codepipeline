output "pipeline" {
  value = aws_codepipeline.pipe
}

output "role_arn" {
  value = local.role_arn
}
