## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| custom\_tags | Dictionnary of tags associated to ressource | `map(string)` | n/a | yes |
| profile | AWS profile use | `string` | n/a | yes |
| region | Region in which resources are created | `string` | n/a | yes |
| subnets\_cidr\_block | List of cidr blocks for each subnet,<br>    if 2 subnets to create -> 2 elements in list<br>    ex: ["10.0.1.0/24", "10.0.2.0/24"] | `list(string)` | n/a | yes |
| vpc\_id | Main VPC's id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnets\_ids | List of subnets ids |

