output "name" {
  description = "The name of the VPC specified as argument to this module"
  value       = data.terraform_remote_state.vpc.outputs.name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = data.terraform_remote_state.vpc.outputs.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = data.terraform_remote_state.vpc.outputs.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = data.terraform_remote_state.vpc.outputs.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = data.terraform_remote_state.vpc.outputs.private_subnets
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = data.terraform_remote_state.vpc.outputs.database_subnets
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = data.terraform_remote_state.vpc.outputs.public_subnets_cidr_blocks
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = data.terraform_remote_state.vpc.outputs.private_subnets_cidr_blocks
}

output "database_subnets_cidr_blocks" {
  description = "List of cidr_blocks of database subnets"
  value       = data.terraform_remote_state.vpc.outputs.database_subnets_cidr_blocks
}

output "database_subnet_group" {
  description = "ID of database subnet group"
  value       = data.terraform_remote_state.vpc.outputs.database_subnet_group
}

output "database_subnet_group_name" {
  description = "Name of database subnet group"
  value       = data.terraform_remote_state.vpc.outputs.database_subnet_group_name
}