#output variables of vpc resource
output "vpc" {
  description = "VPC information"
  value       = google_compute_network.vpc_network.id
}