#=========================================================================
#      ---------------| Velero Policy |---------------
#=========================================================================
# https://github.com/vmware-tanzu/velero-plugin-for-aws#set-permissions-for-velero
data "aws_iam_policy_document" "velero" {
  count = var.attach_velero_policy ? 1 : 0

  statement {
    sid = "Ec2ReadWrite"
    actions = [
      "ec2:DescribeVolumes",
      "ec2:DescribeSnapshots",
      "ec2:CreateTags",
      "ec2:CreateVolume",
      "ec2:CreateSnapshot",
      "ec2:DeleteSnapshot",
    ]
    resources = ["*"]
  }

  statement {
    sid = "S3ReadWrite"
    actions = [
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:PutObject",
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts",
    ]
    resources = [for bucket in var.velero_s3_bucket_arns : "${bucket}/*"]
  }

  statement {
    sid = "S3List"
    actions = [
      "s3:ListBucket",
    ]
    resources = var.velero_s3_bucket_arns
  }
}

resource "aws_iam_policy" "velero" {
  count = var.attach_velero_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}Velero_Policy_"
  description = "Provides Velero permissions to backup and restore cluster resources"
  policy      = data.aws_iam_policy_document.velero[0].json

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "velero" {
  count = var.attach_velero_policy ? 1 : 0

  role       = var.attach_role_name
  policy_arn = aws_iam_policy.velero[0].arn
}
