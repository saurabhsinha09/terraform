#resource to create a firewall that will be applied to the whole network
resource "google_compute_firewall" "firewall-rule" {
  name        = var.name
  project     = var.project
  network     = var.network
  priority    = var.priority
  direction   = var.direction
  description = var.description
  #disabled    = var.disabled

  target_tags = var.target_tags
  source_tags = var.direction == "INGRESS" ? var.source_tags : null

  source_ranges      = var.direction == "INGRESS" ? var.source_ranges : null
  destination_ranges = var.direction == "EGRESS" ? var.destination_ranges : null

  #source_service_accounts = var.direction == "INGRESS" ? var.source_service_accounts : null
  #target_service_accounts = var.target_service_accounts

  dynamic "allow" {
    for_each = var.allow_protocol_ports
    content {
      protocol = allow.key
      ports    = allow.value
    }
  }

  dynamic "deny" {
    for_each = var.deny_protocol_ports
    content {
      protocol = deny.key
      ports    = deny.value
    }
  }

  dynamic "log_config" {
    for_each = var.enable_logs ? toset([0]) : []
    content {
      metadata = var.log_metadata
    }
  }
}