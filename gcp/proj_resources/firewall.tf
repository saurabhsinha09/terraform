module "dev_firewall_nonprod" {
  source      = "../tf_module/firewall-composite-repo"
  project     = var.project_id
  name        = var.firewall_name
  network     = module.dev_network_nonprod.vpc
  description = "firewall rule to enable ssh, rdp and icmp."
  priority    = "1000"
  direction   = "INGRESS"
  enable_logs = "true"

  allow_protocol_ports = var.allow_protocol_ports
  target_tags          = var.target_tags
  source_ranges        = var.source_ranges
}

module "dev_firewall_prod" {
  source      = "../tf_module/firewall-composite-repo"
  project     = var.project_id
  name        = var.firewall_namep
  network     = module.dev_network_prod.vpc
  description = "firewall rule to enable ssh, rdp and icmp."
  priority    = "1000"
  direction   = "INGRESS"
  enable_logs = "true"

  allow_protocol_ports = var.allow_protocol_ports
  target_tags          = var.target_tagsp
  source_ranges        = var.source_ranges
}