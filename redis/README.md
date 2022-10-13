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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_redis_sg"></a> [redis\_sg](#module\_redis\_sg) | terraform-aws-modules/security-group/aws | 4.13.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../vpc-remote-state | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_replication_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, num\_cache\_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups. | `bool` | `true` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | Specifies whether to enable Multi-AZ Support for the replication group. If true, automatic\_failover\_enabled must also be enabled | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of redis cluster | `string` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Type of redis cluster node | `string` | `"cache.m4.large"` | no |
| <a name="input_num_cache_clusters"></a> [num\_cache\_clusters](#input\_num\_cache\_clusters) | Number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2. | `number` | `2` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Name of the parameter group to associate with this replication group | `string` | `"default.redis6.x.cluster.on"` | no |
| <a name="input_vpc_environment"></a> [vpc\_environment](#input\_vpc\_environment) | Name of the VPC environment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the created ElastiCache Replication Group |
| <a name="output_configuration_endpoint_address"></a> [configuration\_endpoint\_address](#output\_configuration\_endpoint\_address) | Address of the replication group configuration endpoint when cluster mode is enabled |
| <a name="output_primary_endpoint_address"></a> [primary\_endpoint\_address](#output\_primary\_endpoint\_address) | Address of the endpoint for the primary node in the replication group, if the cluster mode is disabled |
| <a name="output_reader_endpoint_address"></a> [reader\_endpoint\_address](#output\_reader\_endpoint\_address) | Address of the endpoint for the reader node in the replication group, if the cluster mode is disabled |
