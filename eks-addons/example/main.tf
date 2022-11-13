module "addons" {
  # source = "git::git@github.com:tankibaj/terraform-modules.git//eks-addons?ref=v0.0.1"
  source = "../"

  eks_cluster_id = "" # module.eks.cluster_id

  #----------- VPC CNI -----------
  enable_vpc_cni = true
  vpc_cni_config = {
    most_recent       = true
    create_irsa       = true
    oidc_provider_arn = "" # module.eks.oidc_provider_arn
  }

  #----------- Kube Proxy -----------
  enable_kube_proxy = true
  kube_proxy_config = {
    most_recent = true
  }

  #----------- Core DNS -----------
  enable_coredns = true
  coredns_config = {
    most_recent = true
  }
}
