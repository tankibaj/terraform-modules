#=========================================================================
#      ---------------| Harbor Policy |---------------
#=========================================================================
# -- https://docs.docker.com/registry/storage-drivers/s3/#s3-permission-scopes
data "aws_iam_policy_document" "harbor" {
  count = var.attach_harbor_policy ? 1 : 0

  statement {
    sid = "S3Write"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListMultipartUploadParts",
      "s3:AbortMultipartUpload",
    ]
    resources = [for bucket in var.harbor_s3_bucket_arns : "${bucket}/*"]
  }

  statement {
    sid = "S3List"
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:ListBucketMultipartUploads"
    ]
    resources = var.harbor_s3_bucket_arns
  }
}

resource "aws_iam_policy" "harbor" {
  count = var.attach_harbor_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}Harbor_Policy_"
  description = "Provides Harbor permissions to upload and download images"
  policy      = data.aws_iam_policy_document.harbor[0].json

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "harbor" {
  count = var.attach_harbor_policy ? 1 : 0

  role       = var.attach_role_name
  policy_arn = aws_iam_policy.harbor[0].arn
}
