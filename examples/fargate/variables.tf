variable "name" {}

variable "stage" {
  type        = "list"
  description = "This list describes each stage of the build, so it really should be stages."
}

variable "artifact_store" {
  type        = "list"
  description = "Describes an object where stage artifacts are stored, most likely S3"
}
