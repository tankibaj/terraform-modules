## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |
| <a name="provider_aws.accepter"></a> [aws.accepter](#provider\_aws.accepter) | >= 3.63 |
| <a name="provider_aws.requester"></a> [aws.requester](#provider\_aws.requester) | >= 3.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.requester](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection_accepter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [aws_vpc_peering_connection_options.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [aws_vpc_peering_connection_options.requester](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_options) | resource |
| [aws_route_table.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table) | data source |
| [aws_route_table.requester](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table) | data source |
| [aws_subnets.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.requester](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [aws_vpc.requester](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accepter_assume_role_arn"></a> [accepter\_assume\_role\_arn](#input\_accepter\_assume\_role\_arn) | Accepter assume role arn | `string` | n/a | yes |
| <a name="input_accepter_region"></a> [accepter\_region](#input\_accepter\_region) | Accepter aws region | `string` | `"eu-central-1"` | no |
| <a name="input_accepter_vpc_id"></a> [accepter\_vpc\_id](#input\_accepter\_vpc\_id) | The id of the accepter vpc | `string` | n/a | yes |
| <a name="input_allow_remote_vpc_dns_resolution"></a> [allow\_remote\_vpc\_dns\_resolution](#input\_allow\_remote\_vpc\_dns\_resolution) | Allow accepter vpc to resolve public dns hostnames to private ip addresses when queried from instances in the requester vpc | `bool` | `true` | no |
| <a name="input_auto_accept"></a> [auto\_accept](#input\_auto\_accept) | Whether or not to accept the peering request | `bool` | `true` | no |
| <a name="input_enable_accepter_route"></a> [enable\_accepter\_route](#input\_enable\_accepter\_route) | Enable accepter routes to requester vpc | `bool` | `true` | no |
| <a name="input_enable_requester_route"></a> [enable\_requester\_route](#input\_enable\_requester\_route) | Enable requester routes to accepter vpc | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of vpc peer | `string` | n/a | yes |
| <a name="input_requester_assume_role_arn"></a> [requester\_assume\_role\_arn](#input\_requester\_assume\_role\_arn) | Requester assume role arn | `string` | n/a | yes |
| <a name="input_requester_region"></a> [requester\_region](#input\_requester\_region) | Requester aws region | `string` | `"eu-central-1"` | no |
| <a name="input_requester_vpc_id"></a> [requester\_vpc\_id](#input\_requester\_vpc\_id) | The id of the requester vpc | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_peering_accept_status"></a> [vpc\_peering\_accept\_status](#output\_vpc\_peering\_accept\_status) | The status of the vpc peering connection request |
| <a name="output_vpc_peering_id"></a> [vpc\_peering\_id](#output\_vpc\_peering\_id) | The id of the vpc peering connection |
