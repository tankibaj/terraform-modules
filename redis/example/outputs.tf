output "configuration_endpoint_address" {
  description = "Address of the replication group configuration endpoint when cluster mode is enabled"
  value       = module.redis.configuration_endpoint_address
}
