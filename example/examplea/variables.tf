variable "name" {
  type = string
}

variable "role_arn" {
  type        = string
  description = "Optionally supply an existing role"
  default     = ""
}

variable "stages" {
  type        = list(any)
  description = "This list describes each stage of the build, so it really should be stages."
}

variable "description" {
  type        = string
  description = "Description of build project"
}

variable "common_tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}

variable "manual_approval" {
  type        = bool
  description = "Whether deployment requires manual approval or not"
  default     = false
}
