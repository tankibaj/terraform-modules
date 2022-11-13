locals {
  name        = "vpc-cni"
  create_irsa = try(var.addon_config.create_irsa, false)
}

data "aws_eks_addon_version" "this" {
  addon_name         = local.name
  kubernetes_version = var.addon_config.kubernetes_version
  most_recent        = try(var.addon_config.most_recent, false)
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name             = var.addon_config.eks_cluster_id
  addon_name               = local.name
  addon_version            = try(var.addon_config.addon_version, data.aws_eks_addon_version.this.version)
  resolve_conflicts        = try(var.addon_config.resolve_conflicts, "OVERWRITE")
  service_account_role_arn = local.create_irsa ? module.irsa_addon[0].iam_role_arn : try(var.addon_config.service_account_role_arn, null)
  preserve                 = try(var.addon_config.preserve, true) # Remove this add-on from EKS management, but do not remove it from the cluster.
  tags                     = try(var.addon_config.tags, {})
}

module "irsa_addon" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.5.5"

  count = local.create_irsa ? 1 : 0

  role_name             = "${var.addon_config.eks_cluster_id}-irsa-vpc-cni"
  attach_vpc_cni_policy = true
  vpc_cni_enable_ipv4   = true
  vpc_cni_enable_ipv6   = try(var.addon_config.vpc_cni_enable_ipv6, false)

  oidc_providers = {
    main = {
      provider_arn               = var.addon_config.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-node"]
    }
  }

  tags = try(var.addon_config.tags, {})
}
