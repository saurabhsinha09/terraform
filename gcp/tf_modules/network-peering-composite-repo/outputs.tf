#Output variables for network peering remote state

output "network_name_1" {
  value = google_compute_network_peering.gcp_compute_network_peering_1.network
}

output "network_name_2" {
  value = google_compute_network_peering.gcp_compute_network_peering_2.network
}

output "network_peer_name_1" {
  value = google_compute_network_peering.gcp_compute_network_peering_1.name
}

output "network_peer_name_2" {
  value = google_compute_network_peering.gcp_compute_network_peering_2.name
}

output "export_custom_routes_1" {
  value = google_compute_network_peering.gcp_compute_network_peering_1.export_custom_routes
}

output "import_custom_routes_1" {
  value = google_compute_network_peering.gcp_compute_network_peering_1.import_custom_routes
}

output "export_custom_routes_2" {
  value = google_compute_network_peering.gcp_compute_network_peering_2.export_custom_routes
}

output "import_custom_routes_2" {
  value = google_compute_network_peering.gcp_compute_network_peering_2.import_custom_routes
}