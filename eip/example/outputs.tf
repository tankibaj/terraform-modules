output "id" {
  description = "Contains the EIP allocation ID"
  value       = [for item in module.eip : item.id[*]]
}

output "public_ip" {
  description = "Contains the public IP address"
  value       = [for item in module.eip : item.public_ip[*]]
}
