module "infra_commn_svc_acc" {
  source = "../tf_modules/service-composite-repo"

  #Shared global variables
  project_id = var.project_id

  #Variable for the service account
  account_id   = "tf-clops-infra-svcacct"
  display_name = "tf-clops-infra-svcacct"
  description  = "Service Account for infra creation in shared services project"
}