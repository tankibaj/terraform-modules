module "redis" {
  # source = "git::git@github.com:tankibaj/terraform-modules.git//redis?ref=v0.0.1"
  source          = "../"
  name            = "my-redis"
  vpc_environment = "development"
}
