#Shared variables
variable "project_suffix" {
  type        = "string"
  description = "The suffix that will be used for testing purposes"
}

#variables required for project creation
variable "project_name" {
  type        = "string"
  description = "The name of the project"
}

variable "project_id" {
  type        = "string"
  description = "The project ID"
}

variable "folder_id" {
  type        = "string"
  description = "The ID of the parent folder"
}

variable "billing_account_id" {
  type        = "string"
  description = "The billing account ID"
}

variable "project_labels" {
  type        = "map"
  description = "The key value pair of the labels to be attached with the project"
}

variable "auto_create_network" {
  type        = "string"
  description = "The auto_create_network flag to create or to destroy the default network"
}

variable "project_editor_list" {
  type        = "list"
  description = "The members list for role/editor"
}

variable "project_owner_list" {
  type        = "list"
  description = "The members list for role/owner"
}

variable "project_viewer_list" {
  type        = "list"
  description = "The members list for role/viewer"
}

variable "services_list" {
  type        = "list"
  description = "The list of APIs that need to be enabled"
} 

variable "disable_dependent_services" {
  description = "Set to true for project deletion"
  default     = false
}
