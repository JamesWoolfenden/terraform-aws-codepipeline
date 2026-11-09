# holden:ignore:HLD_TF_004: test data
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
  required_version = ">= 1.7.0"
}
