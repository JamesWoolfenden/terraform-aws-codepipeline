# terraform-aws-codepipeline

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-codepipeline/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-codepipeline)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-codepipeline.svg)](https://github.com/JamesWoolfenden/terraform-aws-codepipeline/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-codepipeline.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-codepipeline/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-codepipeline/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-codepipeline&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-codepipeline/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-codepipeline&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module to provision an AWS [`codepipeline`](https://aws.amazon.com/codepipeline/) CI/CD system.
The module also creates the build itself and the example sets a deployment up for a Fargate project. The module has been fully updated to work with Terraform 0.12 and Terraform Cloud.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "codepipeline" {
  source         = "JamesWoolfenden/codepipeline/aws"
  version        = "0.4.21"
  artifact_store = var.artifact_store
  common_tags    = var.common_tags
  description    = var.description
  name           = var.name
  stages         = var.stages
}
```

## Costs

From infracost: make cost Makefile target in _example/examplea_

```md
✔ Calculating monthly cost estimate

Project: .

Name Monthly Qty Unit Monthly Cost

aws_s3_bucket.codepipeline
├─ Glacier deep archive
│ ├─ Storage 0 GB-months $0.00
│ ├─ PUT, COPY, POST, LIST requests 0 1k requests $0.00
│ ├─ GET, SELECT, and all other requests 0 1k requests $0.00
│ ├─ Lifecycle transition 0 1k requests $0.00
│ ├─ Retrieval requests (standard) 0 1k requests $0.00
│ ├─ Retrievals (standard) 0 GB-months $0.00
│ ├─ Retrieval requests (bulk) 0 1k requests $0.00
│ ├─ Retrievals (bulk) 0 GB-months $0.00
│ └─ Early delete (within 180 days) 0 GB-months $0.00
├─ Standard
│ ├─ Storage 0 GB-months $0.00
│ ├─ PUT, COPY, POST, LIST requests 0 1k requests $0.00
│ ├─ GET, SELECT, and all other requests 0 1k requests $0.00
│ ├─ Select data scanned 0 GB-months $0.00
│ └─ Select data returned 0 GB-months $0.00
├─ Intelligent tiering
│ ├─ Storage (frequent access) 0 GB-months $0.00
│ ├─ Storage (infrequent access) 0 GB-months $0.00
│ ├─ Monitoring and automation 0 1k objects $0.00
│ ├─ PUT, COPY, POST, LIST requests 0 1k requests $0.00
│ ├─ GET, SELECT, and all other requests 0 1k requests $0.00
│ ├─ Lifecycle transition 0 1k requests $0.00
│ ├─ Select data scanned 0 GB-months $0.00
│ ├─ Select data returned 0 GB-months $0.00
│ └─ Early delete (within 30 days) 0 GB-months $0.00
├─ Standard - infrequent access
│ ├─ Storage 0 GB-months $0.00
│ ├─ PUT, COPY, POST, LIST requests 0 1k requests $0.00
│ ├─ GET, SELECT, and all other requests 0 1k requests $0.00
│ ├─ Lifecycle transition 0 1k requests $0.00
│ ├─ Retrievals 0 GB-months $0.00
│ ├─ Select data scanned 0 GB-months $0.00
│ └─ Select data returned 0 GB-months $0.00
├─ One zone - infrequent access
│ ├─ Storage 0 GB-months $0.00
│ ├─ PUT, COPY, POST, LIST requests 0 1k requests $0.00
│ ├─ GET, SELECT, and all other requests 0 1k requests $0.00
│ ├─ Lifecycle transition 0 1k requests $0.00
│ ├─ Retrievals 0 GB-months $0.00
│ ├─ Select data scanned 0 GB-months $0.00
│ └─ Select data returned 0 GB-months $0.00
└─ Glacier
├─ Storage 0 GB-months $0.00
├─ PUT, COPY, POST, LIST requests 0 1k requests $0.00
├─ GET, SELECT, and all other requests 0 1k requests $0.00
├─ Lifecycle transition 0 1k requests $0.00
├─ Retrieval requests (standard) 0 1k requests $0.00
├─ Retrievals (standard) 0 GB-months $0.00
├─ Select data scanned (standard) 0 GB-months $0.00
├─ Select data returned (standard) 0 GB-months $0.00
├─ Retrieval requests (expedited) 0 1k requests $0.00
├─ Retrievals (expedited) 0 GB-months $0.00
├─ Select data scanned (expedited) 0 GB-months $0.00
├─ Select data returned (expedited) 0 GB-months $0.00
├─ Retrieval requests (bulk) 0 1k requests $0.00
├─ Retrievals (bulk) 0 GB-months $0.00
├─ Select data scanned (bulk) 0 GB-months $0.00
├─ Select data returned (bulk) 0 GB-months $0.00
└─ Early delete (within 90 days) 0 GB-months $0.00

PROJECT TOTAL $0.00
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codepipeline.pipe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_iam_role.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_artifact_store"></a> [artifact\_store](#input\_artifact\_store) | Map to populate the artifact block | `map(any)` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Implements the common tags scheme | `map(any)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of build project | `string` | n/a | yes |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_policypath"></a> [policypath](#input\_policypath) | n/a | `string` | `""` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | Optionally supply an existing role | `string` | `""` | no |
| <a name="input_stages"></a> [stages](#input\_stages) | This list describes each stage of the build | `list(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pipeline"></a> [pipeline](#output\_pipeline) | The output of the aws\_codepipeline resource |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN of the pipeline role |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | Name of the pipeline role created if var.role\_arn is not supplied |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "codepipeline:CreatePipeline",
                "codepipeline:DeletePipeline",
                "codepipeline:GetPipeline",
                "codepipeline:ListTagsForResource",
                "codepipeline:TagResource",
                "codepipeline:UntagResource"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "iam:CreateRole",
                "iam:DeleteRole",
                "iam:DeleteRolePolicy",
                "iam:GetRole",
                "iam:GetRolePolicy",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListRolePolicies",
                "iam:PassRole",
                "iam:PutRolePolicy"
            ],
            "Resource": "*"
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->
'stages' is a list of maps, whose format is :

| Name    | Description                          | Type     | Default | Required |
| ------- | ------------------------------------ | -------- | ------- | :------: |
| name    | Stage name                           | `string` | n/a     |   yes    |
| enabled | If false, this stage will be ignored | `bool`   | true    |    no    |
| action  | A map described below                | `map`    | n/a     |   yes    |

'action' is a map whose format is described below. For more information on
possible values, please refer to the [AWS documentation](https://docs.aws.amazon.com/codepipeline/latest/userguide/actions.html):

| Name             | Description                                                       | Type           | Default        | Required |
| ---------------- | ----------------------------------------------------------------- | -------------- | -------------- | :------: |
| name             | Name                                                              | `string`       | n/a            |   yes    |
| owner            | Owner                                                             | `string`       | n/a            |   yes    |
| version          | Version                                                           | `string`       | n/a            |   yes    |
| category         | Category                                                          | `string`       | n/a            |   yes    |
| provider         | Provider                                                          | `string`       | n/a            |   yes    |
| input_artifacts  | A list of artifacts declared as output artifacts by other actions | `list(string)` | `[]`           |    no    |
| output_artifacts | A list of artifacts to be declared as inputs in other actions     | `list(string)` | `[]`           |    no    |
| configuration    | A map whose content depends on the 5 first fields                 | `map`          | `{}`           |    no    |
| role_arn         | If set, ovverrides the global role ARN for this action only       | `string`       | global value   |    no    |
| run_order        | Run order                                                         | `number`       | null           |    no    |
| region           | If set, overrides the default region for this action only         | `string`       | current region |    no    |

## Related Projects

Check out these related projects.

- [terraform-aws-codebuild](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Making a Build pipeline

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-codepipeline/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-codepipeline/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
