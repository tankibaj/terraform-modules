module "argocd" {
  count = var.enable_argocd ? 1 : 0

  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 4.18.0"

  role_name = "${local.name_prefix}-argocd-deployment"

  oidc_providers = {
    argocd = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["argocd:argocd-server", "argocd:argocd-application-controller"]
    }
  }

  tags = local.tags
}

data "aws_iam_policy_document" "argocd" {
  count = var.enable_argocd ? 1 : 0

  statement {
    sid       = "AssumeRole"
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "argocd" {
  count = var.enable_argocd ? 1 : 0

  name_prefix = "AmazonEKS_ArgoCD_Policy_"
  description = "ArgoCD policy to allow assume eks cluster iam role"
  policy      = data.aws_iam_policy_document.argocd[0].json

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "argocd" {
  count = var.enable_argocd ? 1 : 0

  role       = module.argocd[0].iam_role_name
  policy_arn = aws_iam_policy.argocd[0].arn
}
