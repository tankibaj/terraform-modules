locals {
  domain = "mydomain.com"
}

module "ses" {
  # source = "git::git@github.com:tankibaj/terraform-modules.git//ses?ref=v0.0.1"
  source = "../"

  domain = local.domain
  emails = ["alert@${local.domain}"]
}
