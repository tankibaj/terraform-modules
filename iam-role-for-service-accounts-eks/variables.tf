variable "cluster_id" {
  description = "EKS cluster ID"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the EKS cluster OIDC provider"
  type        = string
}

variable "enable_cluster_autoscaler" {
  description = "Determines whether to create the cluster autoscaler irsa"
  type        = bool
  default     = false
}

variable "enable_ebs_csi" {
  description = "Determines whether to create the ebs csi irsa"
  type        = bool
  default     = false
}

variable "enable_efs_csi" {
  description = "Determines whether to create the efs csi irsa"
  type        = bool
  default     = false
}

variable "enable_external_dns" {
  description = "Determines whether to create the external dns irsa"
  type        = bool
  default     = false
}

variable "enable_load_balancer_controller" {
  description = "Determines whether to create the load balancer controller irsa"
  type        = bool
  default     = false
}

variable "enable_argocd" {
  description = "Determines whether to create the argocd irsa"
  type        = bool
  default     = false
}
