resource "google_compute_subnetwork" "vpc_subnetwork" {
  name          = var.subnet_name
  project       = var.project_id
  ip_cidr_range = var.ip_cidr_range
  region        = var.subnet_regions
  network       = var.network_name

  #setting default log_config to ensure flow logs are on
  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
  
  private_ip_google_access = var.private_ip_google_access
}