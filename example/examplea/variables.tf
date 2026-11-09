variable "name" {
  description = "Name of the pipeline"
  type        = string
}
variable "stages" {
  type        = list(any)
  description = "This list describes each stage of the build, so it really should be stages."
}
variable "common_tags" {
  type        = map(any)
  description = "Implements the common tags scheme"
}
