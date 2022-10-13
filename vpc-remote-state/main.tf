data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraform"
    key    = "${var.environment}/vpc.tfstate"
    region = "eu-central-1"
  }
}