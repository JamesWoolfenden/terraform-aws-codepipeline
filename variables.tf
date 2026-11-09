variable "artifact_store" {
  description = "Map to populate the artifact block"
  type        = map(any)
}

variable "name" {
  description = "Name of the pipeline, also used in the name of the service role"
  type        = string
}

variable "role_arn" {
  type        = string
  description = "Optionally supply an existing role"
  default     = ""
}

variable "stages" {
  type        = list(any)
  description = "This list describes each stage of the build"
}

variable "common_tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}

variable "kms_key_arn" {
  description = "ARN of the KMS key used to encrypt the pipeline artifact store"
  type        = string
}
