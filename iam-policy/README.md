## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |


## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_group_names"></a> [attach\_group\_names](#input\_attach\_group\_names) | The name of the IAM groups to which the policy should be applied | `list(string)` | `[]` | no |
| <a name="input_attach_role_arn"></a> [attach\_role\_arn](#input\_attach\_role\_arn) | The arn of the IAM role to which the policy should be applied | `string` | `""` | no |
| <a name="input_attach_role_names"></a> [attach\_role\_names](#input\_attach\_role\_names) | The name of the IAM roles to which the policy should be applied | `list(string)` | `[]` | no |
| <a name="input_attach_user_names"></a> [attach\_user\_names](#input\_attach\_user\_names) | The name of the IAM users to which the policy should be applied | `list(string)` | `[]` | no |
| <a name="input_create_policy"></a> [create\_policy](#input\_create\_policy) | Whether to create the IAM policy | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the policy | `string` | `"IAM Policy"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the policy | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The path of the policy in IAM | `string` | `"/"` | no |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | A list of policy statements | `list(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to IAM role resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN assigned by AWS to this policy |
| <a name="output_description"></a> [description](#output\_description) | The description of the policy |
| <a name="output_id"></a> [id](#output\_id) | The policy's ID |
| <a name="output_name"></a> [name](#output\_name) | The name of the policy |
| <a name="output_path"></a> [path](#output\_path) | The path of the policy in IAM |
| <a name="output_policy"></a> [policy](#output\_policy) | The policy document |
