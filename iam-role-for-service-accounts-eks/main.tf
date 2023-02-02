locals {
  name_prefix = "${var.cluster_id}-irsa"

  tags = {
    Terraform = true
  }
}
