resource "time_sleep" "dataplane" {
  create_duration = "10s"

  triggers = {
    data_plane_wait_arn = var.data_plane_wait_arn # this waits for the data plane to be ready
    eks_cluster_id      = var.eks_cluster_id      # this ties it to downstream resources
  }
}

data "aws_eks_cluster" "eks_cluster" {
  # this makes downstream resources wait for data plane to be ready
  name = time_sleep.dataplane.triggers["eks_cluster_id"]
}
