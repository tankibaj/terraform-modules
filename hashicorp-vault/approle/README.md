# Vault AppRole Terraform module

Terraform module which creates Vault AppRole

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 3.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | ~> 3.12 |


## Usage

```hcl
module "approle" {
  source = "git::git@github.com:tankibaj/terraform-modules.git//hashicorp-vault/approle?ref=v0.0.1"

  role_name   = "mySuperApp"
  policy_name = "mySuperApp"
  policy      = <<EOT
  path "secret/data/mySuperApp" {
    capabilities = ["read","list","update"]
  }
  EOT
}
```

## Resources

| Name | Type |
|------|------|
| [vault_approle_auth_backend_login.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_login) | resource |
| [vault_approle_auth_backend_role.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role) | resource |
| [vault_approle_auth_backend_role_secret_id.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role_secret_id) | resource |
| [vault_policy.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_auth_backend.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/auth_backend) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_secret_id"></a> [create\_secret\_id](#input\_create\_secret\_id) | Create secret\_id | `bool` | `false` | no |
| <a name="input_enable_login"></a> [enable\_login](#input\_enable\_login) | Enable login feature | `bool` | `false` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | Vault policy | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Name for Vault policy | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Name for AppRole | `string` | n/a | yes |
| <a name="input_secret_id_num_uses"></a> [secret\_id\_num\_uses](#input\_secret\_id\_num\_uses) | The number of times any particular SecretID can be used to fetch a token from this AppRole, after which the SecretID will expire. A value of zero will allow unlimited uses. | `number` | `0` | no |
| <a name="input_secret_id_ttl"></a> [secret\_id\_ttl](#input\_secret\_id\_ttl) | The number of seconds after which any SecretID expires | `number` | `0` | no |
| <a name="input_token_explicit_max_ttl"></a> [token\_explicit\_max\_ttl](#input\_token\_explicit\_max\_ttl) | If set, will encode an explicit max TTL onto the token in number of seconds. This is a hard cap even if token\_ttl and token\_max\_ttl would otherwise allow a renewal. | `number` | `0` | no |
| <a name="input_token_max_ttl"></a> [token\_max\_ttl](#input\_token\_max\_ttl) | The maximum lifetime for generated tokens in number of seconds. Its current value will be referenced at renewal time. | `number` | `0` | no |
| <a name="input_token_num_uses"></a> [token\_num\_uses](#input\_token\_num\_uses) | The period, if any, in number of seconds to set on the token. | `number` | `0` | no |
| <a name="input_token_period"></a> [token\_period](#input\_token\_period) | If set, indicates that the token generated using this role should never expire. The token should be renewed within the duration specified by this value. At each renewal, the token's TTL will be set to the value of this field. Specified in seconds. | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | The policy ID |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | The role ID of created approle |
| <a name="output_secret_id"></a> [secret\_id](#output\_secret\_id) | The secret ID of created approle |
