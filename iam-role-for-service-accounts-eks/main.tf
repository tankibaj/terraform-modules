locals {
  name_prefix = "${var.eks_cluster_id}-irsa"

  tags = {
    Terraform = true
  }
}
