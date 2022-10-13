locals {
  domain = "mydomain.com"
}

module "ses" {
  source = "../"

  domain = local.domain
  emails = ["alert@${local.domain}"]
}