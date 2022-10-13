output "id" {
  description = "Contains the EIP allocation ID"
  value       = module.public_ip.*.id
}

output "public_ip" {
  description = "Contains the public IP address"
  value       = module.public_ip.*.public_ip
}