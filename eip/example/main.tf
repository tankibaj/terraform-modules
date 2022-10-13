module "public_ip" {
  source = "../"

  count = 3

  name = "public-ip-${count.index + 1}"
}