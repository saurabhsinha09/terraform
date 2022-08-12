module "dev_storage" {
  source      = "../tf_module/storage-composite-repo"
  project_id  = var.project_id
  bucket_name = "${var.project_id}-001"
  location    = var.subnet_regions
}