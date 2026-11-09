variable "name" {
  description = "Name of the pipeline"
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The name must not be empty or consist only of whitespace."
  }
}

variable "stages" {
  type        = list(any)
  description = "This list describes each stage of the build, so it really should be stages."

  validation {
    condition     = length(var.stages) > 0
    error_message = "The stages list must contain at least one stage."
  }
}

