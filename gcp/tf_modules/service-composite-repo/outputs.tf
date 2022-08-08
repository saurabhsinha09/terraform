output "service_account_email" {
  value       = google_service_account.service_account.email
  description = "Email of Service Account"
}

output "service_account_name" {
  value       = google_service_account.service_account.account_id
  description = "Name of Service Account"
}