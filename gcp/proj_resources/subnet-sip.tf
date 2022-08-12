/*module "dev_subnetwork_sip_dmz" {
  source                   = "../tf_module/subnet-sip-composite-repo"
  project_id               = var.project_id
  network_name             = module.dev_network_nonprod.vpc
  subnet_name              = "${var.subnet_name}-${var.lob}-${var.env}-del-${var.vpc_suffix[0]}-001"
  ip_cidr_range            = var.ip_cidr_range[0]
  subnet_regions           = var.subnet_regions
  private_ip_google_access = var.private_ip_google_access
  secondary_ip_ranges      = var.secondary_ip_ranges[0]
}

module "dev_subnetwork_sip_nondmz" {
  source                   = "../tf_module/subnet-sip-composite-repo"
  project_id               = var.project_id
  network_name             = module.dev_network_nonprod.vpc
  subnet_name              = "${var.subnet_name}-${var.lob}-${var.env}-del-${var.vpc_suffix[1]}-001"
  ip_cidr_range            = var.ip_cidr_range[1]
  subnet_regions           = var.subnet_regions
  private_ip_google_access = var.private_ip_google_access
  secondary_ip_ranges      = var.secondary_ip_ranges[1]
}
*/