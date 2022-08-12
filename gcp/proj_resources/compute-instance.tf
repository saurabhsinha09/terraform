module "dev_compute_instance1" {
  source                    = "../tf_module/compute-composite-repo"
  project_id                = var.project_id
  boot_disk_size            = var.boot_disk_size
  region                    = var.region
  image_family              = var.image_family
  image_project             = var.image_project
  machine_type              = var.machine_type
  vm_instance_name          = var.vm_instance_name
  application_name          = var.application_name
  os_name                   = var.os_name
  zone                      = var.zone
  static_address_project_id = var.static_address_project_id
  static_address_subnetwork = var.static_address_subnetwork
  deletion_protection       = var.deletion_protection
  tags                      = var.tags
  supplement_disks          = var.supplement_disks
  snapshot_guest_flush      = false
  create_service_account    = "false"
  service_account_id = module.infra_commn_svc_acc.service_account_name
  metadata = {
    enable-oslogin = "TRUE"
  }
}