module "external_dns" {
  count = var.enable_external_dns ? 1 : 0

  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 4.18.0"

  role_name                     = "${local.name_prefix}-external-dns"
  attach_external_dns_policy    = true
  external_dns_hosted_zone_arns = ["*"]

  oidc_providers = {
    main = {
      provider_arn               = var.eks_oidc_provider_arn
      namespace_service_accounts = ["kube-system:external-dns"]
    }
  }

  tags = local.tags
}
