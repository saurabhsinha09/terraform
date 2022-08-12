module "dev_peering_nonprod_prod" {
  source                 = "../tf_module/network-peering-composite-repo"
  network_peer_name_1    = "peering-np-to-p"
  network_peer_name_2    = "peering-p-to-np"
  network_name_1         = module.dev_network_nonprod.vpc
  network_name_2         = module.dev_network_prod.vpc
  export_custom_routes_1 = "true"
  import_custom_routes_1 = "true"
  export_custom_routes_2 = "true"
  import_custom_routes_2 = "true"
}