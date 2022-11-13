module "policy" {
  # source = "git::git@github.com:tankibaj/terraform-modules.git//iam-policy-for-eks-services?ref=v0.0.1"
  source = "../"

  attach_role_name = "" # module.eks.worker_iam_role_name

  attach_harbor_policy  = true
  harbor_s3_bucket_arns = ["arn:aws:s3:::harbor-development"]

  attach_velero_policy  = true
  velero_s3_bucket_arns = ["arn:aws:s3:::velero-backup"]

  attach_cortex_policy  = true
  cortex_s3_bucket_arns = ["arn:aws:s3:::cortex-development"]

  attach_loki_policy  = true
  loki_s3_bucket_arns = ["arn:aws:s3:::loki-development"]
}
