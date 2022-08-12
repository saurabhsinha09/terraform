output "subnet" {
  description = "Subnet information"
  value       = google_compute_subnetwork.vpc_subnetwork.id
}