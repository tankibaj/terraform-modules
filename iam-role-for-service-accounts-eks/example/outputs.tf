output "cluster_autoscaler_iam_role_arn" {
  description = "IAM role arn of cluster autoscaler"
  value       = module.irsa.cluster_autoscaler_iam_role_arn
}

output "efs_csi_iam_role_arn" {
  description = "IAM role arn of efs csi"
  value       = module.irsa.efs_csi_iam_role_arn
}

output "ebs_csi_iam_role_arn" {
  description = "IAM role arn of ebs csi"
  value       = module.irsa.ebs_csi_iam_role_arn
}

output "external_dns_iam_role_arn" {
  description = "IAM role arn of external dns"
  value       = module.irsa.external_dns_iam_role_arn
}

output "load_balancer_controller_iam_role_arn" {
  description = "IAM role arn of load balancer controller"
  value       = module.irsa.load_balancer_controller_iam_role_arn
}

output "argocd_iam_role_arn" {
  description = "IAM role arn of argocd"
  value       = module.irsa.argocd_iam_role_arn
}
