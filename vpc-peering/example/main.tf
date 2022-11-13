module "vpc_peering" {
  # source = "git::git@github.com:tankibaj/terraform-modules.git//vpc-peering?ref=v0.0.1"
  source = "../"

  name = "development-to-staging"

  requester_assume_role_arn = "arn:aws:iam::111111111111:role/OrganizationAccountAccessRole"
  requester_vpc_id          = "vpc-00c9erhsd43lj"

  accepter_assume_role_arn = "arn:aws:iam::222222222222:role/OrganizationAccountAccessRole"
  accepter_vpc_id          = "vpc-00c45gfdjty22"

  enable_requester_route = true
  enable_accepter_route  = true
}
