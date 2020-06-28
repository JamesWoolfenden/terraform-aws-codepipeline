# Examplea

This example include a connection to the Terraform Cloud in **terraform.tf**

``` terraform
terraform {
required_version="~> 0.12.0"
backend "remote" {
    organization = "wolf"

    workspaces {
      name = "terraform-aws-codepipeline"
    }
  }
}
```

This is included as a reference, you will need to edit or replace this with your own backend details.

The Terraform version has also been fixed to be greater than 0.12.

This example is compatible with Terraform Cloud and CLI.
