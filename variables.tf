variable "artifact_store" {
  type        = map
  description = "The Artifact store "
}

variable "name" {
  type = string
}

variable "role_arn" {
  type        = string
  description = "Optionally supply an existing role"
  default     = ""
}

variable "stages" {
  type        = list
  description = "This list describes each stage of the build"
}

variable "description" {
  type        = string
  description = "Description of build project"
}

variable "common_tags" {
  type        = map
  description = "Implements the common tags scheme"
}

variable "policypath" {
  default     = ""
  type        = string
  description = ""
}
