#=========================================================================
#      ---------------| Loki Policy |---------------
#=========================================================================
data "aws_iam_policy_document" "loki" {
  count = var.attach_loki_policy ? 1 : 0

  # -- https://grafana.com/docs/loki/latest/operations/storage/#cloud-storage-permissions
  statement {
    sid = "S3ReadWrite"
    actions = [
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject",
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts",
      "s3:ListBucketMultipartUploads"
    ]
    resources = [for bucket in var.loki_s3_bucket_arns : "${bucket}/*"]
  }

  statement {
    sid = "S3List"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
    ]
    resources = var.loki_s3_bucket_arns
  }
}

resource "aws_iam_policy" "loki" {
  count = var.attach_loki_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}Loki_Policy_"
  description = "Provides Loki permissions to upload and fetch logs"
  policy      = data.aws_iam_policy_document.loki[0].json

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "loki" {
  count = var.attach_loki_policy ? 1 : 0

  role       = var.attach_role_name
  policy_arn = aws_iam_policy.loki[0].arn
}
