variable "project_id" {
  description = "Google Project ID."
  type        = string
}

variable "account_id" {
  description = "name of the service account to be created"
  type        = string
}

variable "display_name" {
  description = "display name of the service account created"
  type        = string
}

variable "description" {
  description = "description of the created service account"
  type        = string

}