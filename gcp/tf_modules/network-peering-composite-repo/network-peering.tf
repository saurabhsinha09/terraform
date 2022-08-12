#resources to create network peer in GCP
resource "google_compute_network_peering" "gcp_compute_network_peering_1" {
  name                 = var.network_peer_name_1
  network              = var.network_name_1
  peer_network         = var.network_name_2
  export_custom_routes = var.export_custom_routes_1
  import_custom_routes = var.import_custom_routes_1
}

resource "google_compute_network_peering" "gcp_compute_network_peering_2" {
  name                 = var.network_peer_name_2
  network              = var.network_name_2
  peer_network         = var.network_name_1
  export_custom_routes = var.export_custom_routes_2
  import_custom_routes = var.import_custom_routes_2
  depends_on           = [google_compute_network_peering.gcp_compute_network_peering_1]
}