## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| custom\_tags | Dictionnary of additional tags | `map(string)` | n/a | yes |
| private\_subnet\_ids | Private subnet's ids | `list(string)` | n/a | yes |
| profile | AWS profile use | `string` | n/a | yes |
| public\_subnet\_ids | Public subnet's id | `list(string)` | n/a | yes |
| region | Region in which resources are created | `string` | n/a | yes |
| vpc\_id | Main VPC's id | `string` | n/a | yes |

## Outputs

No output.

