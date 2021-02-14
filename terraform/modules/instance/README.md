## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_desired\_capacity | Desired number of instances up | `number` | n/a | yes |
| custom\_tags | Dictionnary of tags associated to ressource | `map(string)` | n/a | yes |
| http\_target\_group\_arn | ARN of http target group in LB | `string` | n/a | yes |
| image\_id | ami id | `string` | n/a | yes |
| instance\_name | Instance's name | `string` | n/a | yes |
| instance\_type | Instance type | `string` | n/a | yes |
| loab\_balancer\_sg\_id | Load balancer security group's id | `string` | n/a | yes |
| max\_autoscaling\_group\_size | Max number of instances up | `number` | n/a | yes |
| min\_autoscaling\_group\_size | Min number of instances up | `number` | n/a | yes |
| private\_subnet\_ids | Private subnet ids list | `list(string)` | n/a | yes |
| profile | AWS profile use | `string` | n/a | yes |
| region | region in which resources are created | `string` | n/a | yes |
| vpc\_id | VPC's id | `string` | n/a | yes |

## Outputs

No output.

