terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.72"
    }
  }
  backend "s3" {
    bucket         = "terraform"
    key            = "development/redis.tfstate"
    dynamodb_table = "terraform"
    region         = "eu-central-1"
    kms_key_id     = "arn:aws:kms:eu-central-1:XXXXXXXXXXXX:alias/terraform"
  }
}

provider "aws" {
  region = "eu-central-1"

  #  assume_role {
  #    role_arn = "arn:aws:iam::XXXXXXXXXXX:role/OrganizationAccountAccessRole"
  #  }
}
