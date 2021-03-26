output "pipeline" {
  description = "The output of the aws_codepipeline resource"
  value       = aws_codepipeline.pipe
}

output "role_arn" {
  description = "ARN of the pipeline role"
  value       = local.role_arn
}

output "role_name" {
  description = "Name of the pipeline role created if var.role_arn is not supplied"
  value       = local.role_name
}
