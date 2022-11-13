locals {
  name = "coredns"
}

data "aws_eks_addon_version" "this" {
  addon_name         = local.name
  kubernetes_version = var.addon_config.kubernetes_version
  most_recent        = try(var.addon_config.most_recent, false)
}

resource "aws_eks_addon" "coredns" {
  cluster_name             = var.addon_config.eks_cluster_id
  addon_name               = local.name
  addon_version            = try(var.addon_config.addon_version, data.aws_eks_addon_version.this.version)
  resolve_conflicts        = try(var.addon_config.resolve_conflicts, "OVERWRITE")
  service_account_role_arn = try(var.addon_config.service_account_role_arn, null)
  preserve                 = try(var.addon_config.preserve, true)
  tags                     = try(var.addon_config.tags, {})
}
