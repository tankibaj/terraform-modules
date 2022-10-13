module "redis" {
  source          = "../"
  name            = "my-redis"
  vpc_environment = "development"
}

output "configuration_endpoint_address" {
  value = module.redis.configuration_endpoint_address
}