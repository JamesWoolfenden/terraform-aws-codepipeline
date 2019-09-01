terraform {
required_version="~> 0.12"

backend "remote" {
    workspaces {
        name="terraform-aws-codepipeline-exampleA"
    }
    hostname = "app.terraform.io" 
    organization = "wolf"
  }

}