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
module "secrets_engine" {
  source = "git::git@github.com:tankibaj/terraform-modules.git//hashicorp-vault/secrets_engine?ref=v0.0.1"

  path = "secret"
  type = "kv"
  options = {
    version = 2
  }
}
```

## Resources

| Name | Type |
|------|------|
| [vault_mount.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_lease_ttl_seconds"></a> [default\_lease\_ttl\_seconds](#input\_default\_lease\_ttl\_seconds) | Default lease duration for tokens and secrets in seconds | `number` | `0` | no |
| <a name="input_description"></a> [description](#input\_description) | Human-friendly description of the mount | `string` | `null` | no |
| <a name="input_local"></a> [local](#input\_local) | Boolean flag that can be explicitly set to true to enforce local mount in HA environment | `bool` | `false` | no |
| <a name="input_max_lease_ttl_seconds"></a> [max\_lease\_ttl\_seconds](#input\_max\_lease\_ttl\_seconds) | Maximum possible lease duration for tokens and secrets in seconds | `number` | `0` | no |
| <a name="input_options"></a> [options](#input\_options) | Specifies mount type specific options that are passed to the backend | `map` | `{}` | no |
| <a name="input_path"></a> [path](#input\_path) | (Required) Where the secret backend will be mounted | `string` | n/a | yes |
| <a name="input_seal_wrap"></a> [seal\_wrap](#input\_seal\_wrap) | Boolean flag that can be explicitly set to true to enable seal wrapping for the mount, causing values stored by the mount to be wrapped by the seal's encryption capability | `bool` | `false` | no |
| <a name="input_type"></a> [type](#input\_type) | (Required) Type of the backend, such as 'aws' | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_path"></a> [path](#output\_path) | Where the secret backend mounted |
