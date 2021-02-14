## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr\_block | CIDR block for the VPC | `string` | n/a | yes |
| custom\_tags | Dictionnary of tags associated to ressource | `map(string)` | n/a | yes |
| profile | AWS profile use | `string` | n/a | yes |
| region | Region in which resources are created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_id | VPC's id |

