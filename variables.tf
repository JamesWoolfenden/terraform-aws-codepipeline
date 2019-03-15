variable "name" {}

variable "role_arn" {
  type        = "string"
  description = "Optionally supply an existing role"
  default     = ""
}

variable "force_artifact_destroy" {
  type        = "string"
  description = ""
}

variable "stage" {
  type        = "list"
  description = "This list describes each stage of the build, so it really should be stages."
}

variable "description" {
  type        = "string"
  description = "Description of build project"
}

variable "artifact_store" {
  type        = "list"
  description = "Describes an object where stage artifacts are stored, most likely S3"
}

variable "common_tags" {
  type        = "map"
  description = "Implements the common tags scheme"
}

variable "build_timeout" {
  type        = "string"
  description = "Timeout set for the build to run"
}

variable "projectroot" {
  type        = "string"
  description = "The root path element for SSM variables"
}

variable "environment" {
  type        = "list"
  description = ""
}

variable "sourcecode" {
  type        = "list"
  description = ""
}

variable "env" {
  description = ""
  type        = ""
}

variable "type" {
  type = "string"
}

variable "bucketname" {}
