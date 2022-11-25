#=========================================================================
#      ---------------| KMS Policy |---------------
#=========================================================================
data "aws_iam_policy_document" "kms" {
  count = var.attach_kms_policy ? 1 : 0

  statement {
    sid = "KMSEncryptDecrypt"
    actions = [
      "kms:ListKeys",
      "kms:DescribeKey",
      "kms:GenerateDataKey*",
      "kms:Encrypt",
      "kms:ReEncrypt*",
      "kms:Decrypt"
    ]
    resources = [for kms in var.kms_arns : kms]
  }
}

resource "aws_iam_policy" "kms" {
  count = var.attach_kms_policy ? 1 : 0

  name_prefix = "${var.policy_name_prefix}KMS_Policy_"
  description = "Provides KMS encrypt decrypt permission"
  policy      = data.aws_iam_policy_document.kms[0].json

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "kms" {
  count = var.attach_kms_policy ? 1 : 0

  role       = var.attach_role_name
  policy_arn = aws_iam_policy.kms[0].arn
}
