terraform {
  required_version = ">= 0.13.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.75"
    }
  }
}

provider "aws" {
  region = "eu-central-1"

  assume_role {
    role_arn = "arn:aws:iam::111111111111:role/OrganizationAccountAccessRole"
  }
}