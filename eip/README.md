## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of Elastic IP address | `string` | n/a | yes |
| <a name="input_network_border_group"></a> [network\_border\_group](#input\_network\_border\_group) | Location from which the IP address is advertised. Use this parameter to limit the address to this location | `string` | `"eu-central-1"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | Boolean if the EIP is in a VPC or not. Defaults to true unless the region supports EC2-Classic | `string` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Contains the EIP allocation ID |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Contains the public IP address |
