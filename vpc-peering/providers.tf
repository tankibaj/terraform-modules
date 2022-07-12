################################################################################
# Requester
################################################################################
provider "aws" {
  alias  = "requester"
  region = var.requester_region

  assume_role {
    role_arn = var.requester_assume_role_arn
  }
}


################################################################################
# Accepter
################################################################################
provider "aws" {
  alias  = "accepter"
  region = var.accepter_region

  assume_role {
    role_arn = var.accepter_assume_role_arn
  }
}