#=========================================================================
#      ---------------| Cortex Policy |---------------
#=========================================================================
data "aws_iam_policy_document" "cortex" {
  count = var.attach_cortex_policy ? 1 : 0

  # -- https://thanos.io/v0.16/thanos/storage.md/#aws-policies
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
    resources = [for bucket in var.cortex_s3_bucket_arns : "${bucket}/*"]
  }

  statement {
    sid = "S3List"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
    ]
    resources = var.cortex_s3_bucket_arns
  }
}

resource "aws_iam_policy" "cortex" {
  count = var.attach_cortex_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}Cortex_Policy_"
  description = "Provides Cortex permissions to upload and fetch metrics"
  policy      = data.aws_iam_policy_document.cortex[0].json

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "cortex" {
  count = var.attach_cortex_policy ? 1 : 0

  role       = var.attach_role_name
  policy_arn = aws_iam_policy.cortex[0].arn
}
