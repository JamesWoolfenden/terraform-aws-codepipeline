# ExampleA

This example include a connection to the Terraform Cloud in **terraform.tf**

``` terraform
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
```

This is included as a reference, you will need to edit or replace this with your own backend details.

The Terraform version has also been fixed to be greater than 0.12.

This example is also compatible with Terraform Cloud.
