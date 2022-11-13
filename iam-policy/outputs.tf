output "id" {
  description = "The policy's ID"
  value       = [for item in aws_iam_policy.this : item.id[*]]
}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = [for item in aws_iam_policy.this : item.arn[*]]
}

output "name" {
  description = "The name of the policy"
  value       = [for item in aws_iam_policy.this : item.name[*]]
}
