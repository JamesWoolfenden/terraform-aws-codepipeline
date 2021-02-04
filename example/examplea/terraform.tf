terraform {
  required_providers {
    aws = {
      version = "3.24.1"
      source  = "hashicorp/aws"
    }

    local = {
      version = "2.0.0"
    }

    template = {
      version = "2.2.0"
    }

  }
  required_version = ">= 0.14"
}
