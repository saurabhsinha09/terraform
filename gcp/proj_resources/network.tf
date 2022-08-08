module "dev_network" {
  source     = "../tf_modules/network-composite-repo"
  project_id = var.project_id
  vpc_name   = var.vpc_name
}