#Shared variables
variable "project_id" {
  type        = string
  description = "The project ID"
}

variable "vpc_name" {
  type        = string
  description = "The network name"
}

variable "lob" {
  type        = string
  description = "Line of Business"
}

variable "env" {
  type        = string
  description = "Type of environment"
}

variable "envp" {
  type        = string
  description = "Type of environment"
}

variable "vpc_suffix" {
  type        = list(string)
  description = "DMZ or NonDMZ"
}

variable "subnet_name" {
  type        = string
  description = "The subnet name for given network"
}

variable "ip_cidr_range" {
  type        = list(string)
  description = "Subnet ip range"
}

variable "ip_cidr_rangep" {
  type        = list(string)
  description = "Subnet ip range"
}

variable "subnet_regions" {
  type        = string
  description = "The regions where the subnets will be provisioned"
}

variable "private_ip_google_access" {
  type        = string
  description = "Private access for google api's."
}

variable "region" {
  type        = string
  description = "The region where the resources will be provisioned"
}

variable "boot_disk_size" {
  description = "The size of the image in gigabytes"
  type        = number
}

variable "image_family" {
  description = "The family name of the image"
  type        = string
}

variable "image_project" {
  description = "The project name of the image"
  type        = string
}

variable "machine_type" {
  description = "The machine type to create"
  type        = string
}

variable "static_address_project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
  default     = null
}

variable "static_address_subnetwork" {
  description = "Self link to subnetwork"
  type        = string
}

variable "vm_instance_name" {
  description = "Name of the compute address resource"
  type        = string
}

variable "zone" {
  description = "The zone that the machine should be created in."
  type        = string
}

variable "deletion_protection" {
  description = "Enable deletion protection on this instance. Defaults to false. Note: you must disable deletion protection before removing the resource (e.g., via terraform destroy), or the instance cannot be deleted and the Terraform run will not complete successfully."
  type        = bool
  default     = false
}

variable "supplement_disks" {
  description = "Supplemental disks to attach to the instance"
  default     = {}
}

variable "tags" {
  description = "A list of tags to attach to the instance."
  type        = list(string)
  default     = []
}

variable "application_name" {
  description = "Name of application that instance hosts"
  type        = string
}

variable "os_name" {
  description = "Name of operating system"
  type        = string
}

variable "secondary_ip_ranges" {
  description = "The map of secondary ip ranges of subnet."
  type        = list(map(list(string)))
}

variable "firewall_name" {
  type        = string
  description = "Firewall rule name"
}

variable "firewall_namep" {
  type        = string
  description = "Firewall rule name"
}

variable "allow_protocol_ports" {
  description = "The map of protcol and port ranges."
  type        = map(list(string))
  default     = {}
}

variable "source_ranges" {
  description = "IP ranges for source cidr block or instances"
  type        = list(string)
  default     = []
}

variable "target_tags" {
  description = "Network tag of destination instances"
  type        = list(string)
  default     = []
}

variable "target_tagsp" {
  description = "Network tag of destination instances"
  type        = list(string)
  default     = []
}