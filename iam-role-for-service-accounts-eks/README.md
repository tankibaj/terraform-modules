## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.52.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_argocd"></a> [argocd](#module\_argocd) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 4.18.0 |
| <a name="module_cluster_autoscaler"></a> [cluster\_autoscaler](#module\_cluster\_autoscaler) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 4.18.0 |
| <a name="module_ebs_csi"></a> [ebs\_csi](#module\_ebs\_csi) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 4.18.0 |
| <a name="module_efs_csi"></a> [efs\_csi](#module\_efs\_csi) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 4.18.0 |
| <a name="module_external_dns"></a> [external\_dns](#module\_external\_dns) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 4.18.0 |
| <a name="module_load_balancer_controller"></a> [load\_balancer\_controller](#module\_load\_balancer\_controller) | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | ~> 4.18.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.argocd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.argocd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.argocd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eks_cluster_id"></a> [eks\_cluster\_id](#input\_eks\_cluster\_id) | EKS cluster ID | `string` | n/a | yes |
| <a name="input_eks_oidc_provider_arn"></a> [eks\_oidc\_provider\_arn](#input\_eks\_oidc\_provider\_arn) | ARN of the EKS cluster OIDC provider | `string` | n/a | yes |
| <a name="input_enable_argocd"></a> [enable\_argocd](#input\_enable\_argocd) | Determines whether to create the argocd irsa | `bool` | `false` | no |
| <a name="input_enable_cluster_autoscaler"></a> [enable\_cluster\_autoscaler](#input\_enable\_cluster\_autoscaler) | Determines whether to create the cluster autoscaler irsa | `bool` | `false` | no |
| <a name="input_enable_ebs_csi"></a> [enable\_ebs\_csi](#input\_enable\_ebs\_csi) | Determines whether to create the ebs csi irsa | `bool` | `false` | no |
| <a name="input_enable_efs_csi"></a> [enable\_efs\_csi](#input\_enable\_efs\_csi) | Determines whether to create the efs csi irsa | `bool` | `false` | no |
| <a name="input_enable_external_dns"></a> [enable\_external\_dns](#input\_enable\_external\_dns) | Determines whether to create the external dns irsa | `bool` | `false` | no |
| <a name="input_enable_load_balancer_controller"></a> [enable\_load\_balancer\_controller](#input\_enable\_load\_balancer\_controller) | Determines whether to create the load balancer controller irsa | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argocd_iam_role_arn"></a> [argocd\_iam\_role\_arn](#output\_argocd\_iam\_role\_arn) | IAM role arn of argocd |
| <a name="output_cluster_autoscaler_iam_role_arn"></a> [cluster\_autoscaler\_iam\_role\_arn](#output\_cluster\_autoscaler\_iam\_role\_arn) | IAM role arn of cluster autoscaler |
| <a name="output_ebs_csi_iam_role_arn"></a> [ebs\_csi\_iam\_role\_arn](#output\_ebs\_csi\_iam\_role\_arn) | IAM role arn of ebs csi |
| <a name="output_efs_csi_iam_role_arn"></a> [efs\_csi\_iam\_role\_arn](#output\_efs\_csi\_iam\_role\_arn) | IAM role arn of efs csi |
| <a name="output_external_dns_iam_role_arn"></a> [external\_dns\_iam\_role\_arn](#output\_external\_dns\_iam\_role\_arn) | IAM role arn of external dns |
| <a name="output_load_balancer_controller_iam_role_arn"></a> [load\_balancer\_controller\_iam\_role\_arn](#output\_load\_balancer\_controller\_iam\_role\_arn) | IAM role arn of load balancer controller |
