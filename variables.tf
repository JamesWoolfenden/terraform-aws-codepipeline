variable "artifact_store" {
  description = "Map to populate the artifact block"
  type        = map(any)

  validation {
    condition     = contains(keys(var.artifact_store), "location") && contains(keys(var.artifact_store), "type")
    error_message = "artifact_store must contain the keys \"location\" and \"type\"."
  }
}

variable "name" {
  description = "Name of the pipeline, also used in the name of the service role"
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z0-9.@_-]{1,100}$", var.name))
    error_message = "The pipeline name must be 1-100 characters of letters, numbers, and . @ _ -."
  }
}

variable "role_arn" {
  type        = string
  description = "Optionally supply an existing role"
  default     = ""

  validation {
    condition     = var.role_arn == "" || can(regex("^arn:aws[a-z-]*:iam::[0-9]{12}:role/.+$", var.role_arn))
    error_message = "role_arn must be empty or a valid IAM role ARN."
  }
}

variable "stages" {
  type        = list(any)
  description = "This list describes each stage of the build"

  validation {
    condition     = length(var.stages) > 0 && alltrue([for s in var.stages : can(s.name) && can(s.action)])
    error_message = "stages must contain at least one stage, and every stage needs a name and an action list."
  }
}


variable "kms_key_arn" {
  description = "ARN of the KMS key used to encrypt the pipeline artifact store"
  type        = string

  validation {
    condition     = can(regex("^arn:aws[a-z-]*:kms:[a-z0-9-]+:[0-9]{12}:key/.+$", var.kms_key_arn))
    error_message = "kms_key_arn must be a valid KMS key ARN."
  }
}
