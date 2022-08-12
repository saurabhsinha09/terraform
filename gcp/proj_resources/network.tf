module "dev_network_nonprod" {
  source     = "../tf_module/network-composite-repo"
  project_id = var.project_id
  vpc_name   = "${var.vpc_name}-${var.lob}-${var.env}-001"
}

module "dev_network_prod" {
  source     = "../tf_module/network-composite-repo"
  project_id = var.project_id
  vpc_name   = "${var.vpc_name}-${var.lob}-${var.envp}-001"
}