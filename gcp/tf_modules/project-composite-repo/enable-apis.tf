#resource to enable APIs in a project
resource "google_project_service" "gcp_project_service" {
  count      = "${length(var.services_list)}"
  project    = "${google_project.gcp_project.project_id}"
  service    = "${element(var.services_list, count.index)}"
  disable_dependent_services = "${var.disable_dependent_services}"
  depends_on = ["google_project.gcp_project"]
}
