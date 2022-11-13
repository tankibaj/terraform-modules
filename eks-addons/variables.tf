variable "eks_cluster_id" {
  description = "EKS Cluster Id"
  type        = string
}

variable "eks_cluster_version" {
  description = "The Kubernetes version for the cluster"
  type        = string
  default     = null
}

variable "data_plane_wait_arn" {
  description = "Addon deployment will not proceed until this value is known. Set to node group/Fargate profile ARN to wait for data plane to be ready before provisioning addons"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}


#=========================================================================
#      ---------------| EKS MANAGED ADD-ONS |---------------
#=========================================================================
#-----------VPC CNI-----------
variable "enable_vpc_cni" {
  description = "Enable VPC CNI add-on"
  type        = bool
  default     = false
}

variable "oidc_provider_arn" {
  description = "The OpenID Connect identity provider ARN of EKS cluster"
  type        = string
  default     = null
}

variable "vpc_cni_config" {
  description = "ConfigMap of Amazon EKS VPC CNI add-on"
  type        = any
  default     = {}
}

#----------- Kube Proxy -----------
variable "enable_kube_proxy" {
  description = "Enable Kube Proxy add-on"
  type        = bool
  default     = false
}

variable "kube_proxy_config" {
  description = "ConfigMap for Amazon EKS Kube-Proxy add-on"
  type        = any
  default     = {}
}

#----------- Core DNS -----------
variable "enable_coredns" {
  description = "Enable CoreDNS add-on"
  type        = bool
  default     = false
}

variable "coredns_config" {
  description = "ConfigMap for Amazon EKS CoreDNS add-on"
  type        = any
  default     = {}
}
