terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72"
    }
  }
}

provider "aws" {
  region = "eu-central-1"

  #  assume_role {
  #    role_arn = "arn:aws:iam::XXXXXXXXXXXX:role/OrganizationAccountAccessRole"
  #  }
}
