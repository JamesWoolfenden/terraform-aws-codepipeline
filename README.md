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
The module also creates the build itself and and the example sets a deployment up for a Fargate project. The module has been fully updated to work with Terraform 0.12 and Terraform Cloud.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "codepipeline" {
  source         = "JamesWoolfenden/codepipeline/aws"
  version        = "0.3.12"
  artifact_store = var.artifact_store
  common_tags    = var.common_tags
  description    = var.description
  name           = var.name
  stages         = var.stages
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| artifact\_store | Map to populate the artifact block | `map` | n/a | yes |
| common\_tags | Implements the common tags scheme | `map` | n/a | yes |
| description | Description of build project | `string` | n/a | yes |
| name | n/a | `string` | n/a | yes |
| policypath | n/a | `string` | `""` | no |
| role\_arn | Optionally supply an existing role | `string` | `""` | no |
| stages | This list describes each stage of the build | `list` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| pipelinr | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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

Copyright © 2019-2021 James Woolfenden

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
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-codepipeline&url=https://github.com/jameswoolfenden/terraform-aws-codepipeline
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-codepipeline&url=https://github.com/jameswoolfenden/terraform-aws-codepipeline
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-codepipeline
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-codepipeline
[share_email]: mailto:?subject=terraform-aws-codepipeline&body=https://github.com/jameswoolfenden/terraform-aws-codepipeline
