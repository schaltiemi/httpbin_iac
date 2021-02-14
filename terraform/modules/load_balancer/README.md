## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_name | Application's name | `string` | n/a | yes |
| custom\_tags | Dictionnary of tags associated to ressource | `map(string)` | n/a | yes |
| profile | AWS profile use | `string` | n/a | yes |
| public\_subnet\_ids | Private subnet ids list | `list(string)` | n/a | yes |
| region | Region in which resources are created | `string` | n/a | yes |
| vpc\_id | VPC's id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| http\_target\_group\_arn | Http target group ARN |
| lb\_dns\_name | Load balancer's DNS name |
| load\_balancer\_sg\_id | Load balancer security group's id |

