module "policy" {
  # source = "git::git@github.com:tankibaj/terraform-modules.git//iam-policy-for-eks-services?ref=v0.0.1"
  source = "../"

  attach_role_name = "" # module.eks.worker_iam_role_name

  attach_harbor_policy  = true
  harbor_s3_bucket_arns = ["arn:aws:s3:::harbor-artifacts"]

  attach_velero_policy  = true
  velero_s3_bucket_arns = ["arn:aws:s3:::velero-backup"]

  attach_cortex_policy  = true
  cortex_s3_bucket_arns = ["arn:aws:s3:::cortex-metrics"]

  attach_loki_policy  = true
  loki_s3_bucket_arns = ["arn:aws:s3:::loki-logs"]

  attach_kms_policy = true
  kms_arns          = ["arn:aws:kms:eu-central-1:XXXXXXXXXX:key/e822961-w8830-l4793-oq68-t2393ls1349"]
}
