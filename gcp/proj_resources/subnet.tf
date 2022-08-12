module "dev_subnetwork_nonprod_dmz" {
  source                   = "../tf_module/subnet-composite-repo"
  project_id               = var.project_id
  network_name             = module.dev_network_nonprod.vpc
  subnet_name              = "${var.subnet_name}-${var.lob}-${var.env}-del-${var.vpc_suffix[0]}-001"
  ip_cidr_range            = var.ip_cidr_range[0]
  subnet_regions           = var.subnet_regions
  private_ip_google_access = var.private_ip_google_access
}

module "dev_subnetwork_nonprod_nondmz" {
  source                   = "../tf_module/subnet-composite-repo"
  project_id               = var.project_id
  network_name             = module.dev_network_nonprod.vpc
  subnet_name              = "${var.subnet_name}-${var.lob}-${var.env}-del-${var.vpc_suffix[1]}-001"
  ip_cidr_range            = var.ip_cidr_range[1]
  subnet_regions           = var.subnet_regions
  private_ip_google_access = var.private_ip_google_access
}

module "dev_subnetwork_prod_dmz" {
  source                   = "../tf_module/subnet-composite-repo"
  project_id               = var.project_id
  network_name             = module.dev_network_prod.vpc
  subnet_name              = "${var.subnet_name}-${var.lob}-${var.envp}-del-${var.vpc_suffix[0]}-001"
  ip_cidr_range            = var.ip_cidr_rangep[0]
  subnet_regions           = var.subnet_regions
  private_ip_google_access = var.private_ip_google_access
}

module "dev_subnetwork_prod_nondmz" {
  source                   = "../tf_module/subnet-composite-repo"
  project_id               = var.project_id
  network_name             = module.dev_network_prod.vpc
  subnet_name              = "${var.subnet_name}-${var.lob}-${var.envp}-del-${var.vpc_suffix[1]}-001"
  ip_cidr_range            = var.ip_cidr_rangep[1]
  subnet_regions           = var.subnet_regions
  private_ip_google_access = var.private_ip_google_access
}