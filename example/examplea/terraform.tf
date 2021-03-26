terraform {
  required_providers {
    aws = {
      version = "3.34.0"
      source  = "hashicorp/aws"
    }

    local = {
      version = "2.1.0"
    }

    template = {
      version = "2.2.0"
    }
  }
  required_version = ">=0.14.8"
}
