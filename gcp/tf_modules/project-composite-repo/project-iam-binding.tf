#resource to create IAM binding with the projects
resource "google_project_iam_member" "gcp_project_iam_member_editor" {
  count      = "${length(var.project_editor_list)}"
  project    = "${google_project.gcp_project.project_id}"
  role       = "roles/editor"
  member     = "${element(var.project_editor_list, count.index)}"
  depends_on = ["google_project.gcp_project"]
}

resource "google_project_iam_member" "gcp_project_iam_member_owner" {
  count      = "${length(var.project_owner_list)}"
  project    = "${google_project.gcp_project.project_id}"
  role       = "roles/owner"
  member     = "${element(var.project_owner_list, count.index)}"
  depends_on = ["google_project.gcp_project"]
}

resource "google_project_iam_member" "gcp_project_iam_member_viewer" {
  count      = "${length(var.project_viewer_list)}"
  project    = "${google_project.gcp_project.project_id}"
  role       = "roles/viewer"
  member     = "${element(var.project_viewer_list, count.index)}"
  depends_on = ["google_project.gcp_project"]
}
