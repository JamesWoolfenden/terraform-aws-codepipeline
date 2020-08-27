terraform {
  required_providers {
    aws = {
      version = "3.2.0"
      source  = "hashicorp/aws"
    }

    local = {
      version = "1.3"
    }

    template = {
      version = "2.1"
    }

  }
}
