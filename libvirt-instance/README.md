## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | 0.7 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.this](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.this](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7/docs/resources/domain) | resource |
| [libvirt_volume.base_volume](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7/docs/resources/volume) | resource |
| [libvirt_volume.root_volume](https://registry.terraform.io/providers/dmacvicar/libvirt/0.7/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_autostart"></a> [autostart](#input\_autostart) | Whether instance will be auto started or not | `bool` | `true` | no |
| <a name="input_base_volume_id"></a> [base\_volume\_id](#input\_base\_volume\_id) | ID of base OS image if already exist | `any` | `""` | no |
| <a name="input_cloud_image"></a> [cloud\_image](#input\_cloud\_image) | Cloud image path/url to provision instance | `string` | `"https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"` | no |
| <a name="input_graphics_type"></a> [graphics\_type](#input\_graphics\_type) | Type of graphics emulation. spice \| vnc | `string` | `"vnc"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of memory in MiB. If not specified the domain will be created with 512 MiB of memory be used | `number` | `512` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on instance created | `string` | n/a | yes |
| <a name="input_network_config"></a> [network\_config](#input\_network\_config) | Cloud-init network config | `string` | `""` | no |
| <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface) | Customize network interfaces to be attached at instance boot time | `list(map(string))` | `[]` | no |
| <a name="input_pool_name"></a> [pool\_name](#input\_pool\_name) | Name of pool where all volumes will stored | `string` | `"default"` | no |
| <a name="input_root_volume_id"></a> [root\_volume\_id](#input\_root\_volume\_id) | ID of root volume if already exist | `string` | `""` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Cloud-init user data | `string` | `""` | no |
| <a name="input_vcpu"></a> [vcpu](#input\_vcpu) | The amount of virtual CPUs. If not specified, a single CPU will be created | `number` | `1` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The size of the volume in GB | `number` | `8` | no |

## Outputs

No outputs.
