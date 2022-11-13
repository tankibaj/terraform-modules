## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.cortex](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.harbor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.loki](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.cortex](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.harbor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.loki](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.cortex](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.harbor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.loki](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.velero](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_cortex_policy"></a> [attach\_cortex\_policy](#input\_attach\_cortex\_policy) | Determines whether to attach the Cortex IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_harbor_policy"></a> [attach\_harbor\_policy](#input\_attach\_harbor\_policy) | Determines whether to attach the Harbor IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_loki_policy"></a> [attach\_loki\_policy](#input\_attach\_loki\_policy) | Determines whether to attach the Loki IAM policy to the role | `bool` | `false` | no |
| <a name="input_attach_role_name"></a> [attach\_role\_name](#input\_attach\_role\_name) | The name of the IAM roles to which the policy should be applied | `string` | n/a | yes |
| <a name="input_attach_velero_policy"></a> [attach\_velero\_policy](#input\_attach\_velero\_policy) | Determines whether to attach the Velero IAM policy to the role | `bool` | `false` | no |
| <a name="input_cortex_s3_bucket_arns"></a> [cortex\_s3\_bucket\_arns](#input\_cortex\_s3\_bucket\_arns) | List of S3 Bucket ARNs that Cortex needs | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_harbor_s3_bucket_arns"></a> [harbor\_s3\_bucket\_arns](#input\_harbor\_s3\_bucket\_arns) | List of S3 Bucket ARNs that Harbor needs | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_loki_s3_bucket_arns"></a> [loki\_s3\_bucket\_arns](#input\_loki\_s3\_bucket\_arns) | List of S3 Bucket ARNs that Loki needs | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_policy_name_prefix"></a> [policy\_name\_prefix](#input\_policy\_name\_prefix) | IAM policy name prefix | `string` | `"AmazonEKS_"` | no |
| <a name="input_velero_s3_bucket_arns"></a> [velero\_s3\_bucket\_arns](#input\_velero\_s3\_bucket\_arns) | List of S3 Bucket ARNs that Velero needs | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |

## Outputs

No outputs.
