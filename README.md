# Usage

<!--- BEGIN_TF_DOCS --->
# Application Load Balancer - Terraform Module

## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.46.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.46.0 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) |
| [aws_lb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) |
| [aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) |
| [aws_security_group_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acm\_certificate\_arn | Certificate ARN for HTTPS | `string` | `null` | no |
| environment | Environment (development, qa, live, etc.) | `string` | `"development"` | no |
| https\_only | Define force HTTP to HTTPS redirect | `bool` | `true` | no |
| name | Load Balancer Name | `string` | n/a | yes |
| public | Define Load Balancer external (Internet) access | `string` | `true` | no |
| subnet\_ids | List of Subnets Load Balancer should be attached to | `list(string)` | n/a | yes |
| vpc\_id | VPC ID Load Balancer should be attached to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| dns\_name | n/a |
| http\_listener | n/a |
| https\_listener | n/a |
| zone\_id | n/a |

<!--- END_TF_DOCS --->

