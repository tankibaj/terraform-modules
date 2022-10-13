output "this_iam_user_name" {
  description = "The user's name"
  value       = module.ses.iam_user_name
}

output "this_iam_user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = module.ses.iam_user_arn
}

output "this_iam_access_key_id" {
  description = "The access key ID"
  value       = module.ses.iam_access_key_id
}

output "this_iam_access_key_secret" {
  description = "The access key secret"
  value       = module.ses.iam_access_key_secret
  sensitive   = true
}