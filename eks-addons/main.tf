locals {
  eks_cluster_version = var.eks_cluster_version != null ? var.eks_cluster_version : data.aws_eks_cluster.eks_cluster.version
  tags = merge(
    {
      Terraform = true
    },
    try(var.tags, {})
  )
}

#=========================================================================
#      ---------------| VPC CNI |---------------
#=========================================================================
module "aws_vpc_cni" {
  source = "./aws-vpc-cni"

  count = var.enable_vpc_cni ? 1 : 0

  addon_config = merge(
    {
      eks_cluster_id     = var.eks_cluster_id
      kubernetes_version = local.eks_cluster_version
      oidc_provider_arn  = try(var.oidc_provider_arn, null)
      tags               = local.tags
    },
    var.vpc_cni_config,
  )
}

#=========================================================================
#      ---------------| Kube Proxy |---------------
#=========================================================================
module "aws_kube_proxy" {
  source = "./aws-kube-proxy"

  count = var.enable_kube_proxy ? 1 : 0

  addon_config = merge(
    {
      eks_cluster_id     = var.eks_cluster_id
      kubernetes_version = local.eks_cluster_version
      tags               = local.tags
    },
    var.kube_proxy_config,
  )
}

#=========================================================================
#      ---------------| CoreDNS |---------------
#=========================================================================
module "aws_coredns" {
  source = "./aws-coredns"

  count = var.enable_coredns ? 1 : 0

  addon_config = merge(
    {
      eks_cluster_id     = var.eks_cluster_id
      kubernetes_version = local.eks_cluster_version
      tags               = local.tags
    },
    var.coredns_config,
  )
}
