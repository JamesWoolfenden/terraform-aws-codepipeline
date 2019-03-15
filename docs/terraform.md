## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| artifact_store | Describes an object where stage artifacts are stored, most likely S3 | list | - | yes |
| bucketname | - | string | - | yes |
| build_timeout | Timeout set for the build to run | string | - | yes |
| common_tags | Implements the common tags scheme | map | - | yes |
| description | Description of build project | string | - | yes |
| env | - | string | - | yes |
| environment | - | list | - | yes |
| force_artifact_destroy | - | string | - | yes |
| name | - | string | - | yes |
| projectroot | The root path element for SSM variables | string | - | yes |
| role_arn | Optionally supply an existing role | string | `` | no |
| sourcecode | - | list | - | yes |
| stage | This list describes each stage of the build, so it really should be stages. | list | - | yes |
| type | - | string | - | yes |

