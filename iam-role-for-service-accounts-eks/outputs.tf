output "cluster_autoscaler_iam_role_arn" {
  description = "IAM role arn of cluster autoscaler"
  value       = flatten([for item in module.cluster_autoscaler : item.iam_role_arn[*]])
}

output "efs_csi_iam_role_arn" {
  description = "IAM role arn of efs csi"
  value       = flatten([for item in module.efs_csi : item.iam_role_arn[*]])
}

output "ebs_csi_iam_role_arn" {
  description = "IAM role arn of ebs csi"
  value       = flatten([for item in module.ebs_csi : item.iam_role_arn[*]])
}

output "external_dns_iam_role_arn" {
  description = "IAM role arn of external dns"
  value       = flatten([for item in module.external_dns : item.iam_role_arn[*]])
}

output "load_balancer_controller_iam_role_arn" {
  description = "IAM role arn of load balancer controller"
  value       = flatten([for item in module.load_balancer_controller : item.iam_role_arn[*]])
}

output "argocd_iam_role_arn" {
  description = "IAM role arn of argocd"
  value       = flatten([for item in module.argocd : item.iam_role_arn[*]])
}
