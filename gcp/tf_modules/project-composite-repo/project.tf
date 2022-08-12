#resource to create a Project in GCP
resource "google_project" "gcp_project" {
  name                = "${var.project_name}${var.project_suffix}"
  project_id          = "${var.project_id}${var.project_suffix}"
  folder_id           = "${var.folder_id}"
  billing_account     = "${var.billing_account_id}"
  labels              = "${var.project_labels}"
  auto_create_network = "${var.auto_create_network}"
}
