## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.38.0 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.9.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_coredns"></a> [aws\_coredns](#module\_aws\_coredns) | ./aws-coredns | n/a |
| <a name="module_aws_kube_proxy"></a> [aws\_kube\_proxy](#module\_aws\_kube\_proxy) | ./aws-kube-proxy | n/a |
| <a name="module_aws_vpc_cni"></a> [aws\_vpc\_cni](#module\_aws\_vpc\_cni) | ./aws-vpc-cni | n/a |

## Resources

| Name | Type |
|------|------|
| [time_sleep.dataplane](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_coredns_config"></a> [coredns\_config](#input\_coredns\_config) | ConfigMap for Amazon EKS CoreDNS add-on | `any` | `{}` | no |
| <a name="input_data_plane_wait_arn"></a> [data\_plane\_wait\_arn](#input\_data\_plane\_wait\_arn) | Addon deployment will not proceed until this value is known. Set to node group/Fargate profile ARN to wait for data plane to be ready before provisioning addons | `string` | `""` | no |
| <a name="input_eks_cluster_id"></a> [eks\_cluster\_id](#input\_eks\_cluster\_id) | EKS Cluster Id | `string` | n/a | yes |
| <a name="input_eks_cluster_version"></a> [eks\_cluster\_version](#input\_eks\_cluster\_version) | The Kubernetes version for the cluster | `string` | `null` | no |
| <a name="input_enable_coredns"></a> [enable\_coredns](#input\_enable\_coredns) | Enable CoreDNS add-on | `bool` | `false` | no |
| <a name="input_enable_kube_proxy"></a> [enable\_kube\_proxy](#input\_enable\_kube\_proxy) | Enable Kube Proxy add-on | `bool` | `false` | no |
| <a name="input_enable_vpc_cni"></a> [enable\_vpc\_cni](#input\_enable\_vpc\_cni) | Enable VPC CNI add-on | `bool` | `false` | no |
| <a name="input_kube_proxy_config"></a> [kube\_proxy\_config](#input\_kube\_proxy\_config) | ConfigMap for Amazon EKS Kube-Proxy add-on | `any` | `{}` | no |
| <a name="input_oidc_provider_arn"></a> [oidc\_provider\_arn](#input\_oidc\_provider\_arn) | The OpenID Connect identity provider ARN of EKS cluster | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags | `map(string)` | `{}` | no |
| <a name="input_vpc_cni_config"></a> [vpc\_cni\_config](#input\_vpc\_cni\_config) | ConfigMap of Amazon EKS VPC CNI add-on | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_vpc_cni"></a> [aws\_vpc\_cni](#output\_aws\_vpc\_cni) | Map of attributes of the Helm release and IRSA created |
