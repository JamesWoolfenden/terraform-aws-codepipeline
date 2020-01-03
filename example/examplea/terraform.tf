terraform {
required_version=">= 0.12.0"
backend "remote" {
    organization = "wolf"

    workspaces {
      name = "terraform-aws-codepipeline"
    }
  }
}
