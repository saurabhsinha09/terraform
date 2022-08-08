variable "project_id" {
  description = "Google Project ID."
  type        = string
}

variable "vpc_name" {
  description = "name of the vpc to be created"
  type        = string
}

variable "routing" {
  description = "routing mode of network"
  type        = string
  default     = "REGIONAL"
}