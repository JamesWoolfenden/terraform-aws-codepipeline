output "pipeline" {
  description = "The output of the aws_codepipeline resource"
  value       = aws_codepipeline.pipe
}

output "role_arn" {
  description = "ARN of the pipeline role"
  value       = local.role_arn
}
