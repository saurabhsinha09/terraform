variable "subnet_name" {
  description = "name of the subnet to be created"
  type        = string
}

variable "project_id" {
  description = "Google Project ID."
  type        = string
}

variable "ip_cidr_range" {
  description = "ip cidr range to be created"
  type        = string
}

variable "subnet_regions" {
  description = "The Region in which the subnet address should reside."
  type        = string
}

variable "network_name" {
  description = "Network name"
  type        = string
}

variable "private_ip_google_access" {
  description = "Google APIs and services by using Private Google Access"
  type        = bool
  default     = true
}

variable "secondary_ip_ranges" {
  description = "The map of secondary ip ranges of subnet."
  type        = map(list(string))
  default     = {}
}