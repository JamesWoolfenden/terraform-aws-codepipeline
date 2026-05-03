terraform {
  required_providers {


    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.8.0"
    }
  }
  required_version = ">= 1.3.5"
}
