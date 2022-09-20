terraform {
  required_providers {
    aws = {
      version = "4.31.0"
      source  = "hashicorp/aws"
    }

    local = {
      version = "2.1.0"
      source  = "hashicorp/local"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
  required_version = ">=0.14.8"
}
