data "aws_route53_zone" "this" {
  name = var.domain
}

resource "aws_ses_domain_identity" "this" {
  domain = var.domain
}

resource "aws_route53_record" "amazonses_verification_record" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "_amazonses.${var.domain}"
  type    = "TXT"
  ttl     = "60"
  records = [join("", aws_ses_domain_identity.this.*.verification_token)]
}

resource "aws_ses_domain_dkim" "this" {
  domain = aws_ses_domain_identity.this.domain
}

resource "aws_route53_record" "amazonses_dkim_record" {
  count   = 3
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${element(aws_ses_domain_dkim.this.dkim_tokens, count.index)}._domainkey"
  type    = "CNAME"
  ttl     = "60"
  records = ["${element(aws_ses_domain_dkim.this.dkim_tokens, count.index)}.dkim.amazonses.com"]
}

resource "aws_ses_email_identity" "this" {
  for_each = toset(var.emails)
  email    = each.value
}

module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "~> 3.0"

  name          = "sa-ses-smtp"
  force_destroy = true

  create_iam_user_login_profile = false
  create_iam_access_key         = true
}

module "ses_user_policy" {
  source = "../iam-policy"

  name        = "AmazonSES-SMTP-Send-Email-Policy"
  description = "Allow user to send emails"

  policy_statements = [
    {
      sid    = "SendEmail"
      effect = "Allow"
      actions = [
        "ses:SendEmail",
        "ses:SendRawEmail",
        "ses:SendTemplatedEmail"
      ]
      resources = ["*"]
    },
  ]

  attach_user_names = [module.iam_user.this_iam_user_name]

  tags = {
    Name      = "AmazonSES-SMTP-Send-Email-Policy",
    Terraform = true
  }
}

