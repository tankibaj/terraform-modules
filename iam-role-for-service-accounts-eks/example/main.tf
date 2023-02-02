#data "terraform_remote_state" "eks" {
#  backend = "s3"
#  config = {
#    bucket = "terraform"
#    key    = "aws/development/eks.tfstate"
#    region = "eu-central-1"
#  }
#}

module "irsa" {
  source = "../"

  cluster_id        = "" # data.terraform_remote_state.eks.outputs.cluster_id
  oidc_provider_arn = "" # data.terraform_remote_state.eks.outputs.oidc_provider_arn

  enable_cluster_autoscaler       = true
  enable_efs_csi                  = true
  enable_ebs_csi                  = true
  enable_external_dns             = true
  enable_load_balancer_controller = true
  enable_argocd                   = true
}
