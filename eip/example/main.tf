module "eip" {
  # source = "git::git@github.com:tankibaj/terraform-modules.git//eip?ref=v0.0.1"
  source = "../"

  count = 3

  name = "public-ip-${count.index + 1}"
}
