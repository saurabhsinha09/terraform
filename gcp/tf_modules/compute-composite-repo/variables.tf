variable "allow_stopping" {
  description = "Allow instance to stop for updates"
  type        = bool
  default     = true
}

variable "application_name" {
  description = "Name of application that instance hosts"
  type        = string
}

variable "boot_disk_labels" {
  description = "Labels for boot disks"
  type        = map(string)
  default     = {}
}

variable "boot_disk_size" {
  description = "The size of the image in gigabytes"
  type        = number
  default     = 10
}

variable "boot_disk_snapshot" {
  description = "Snapshot to restore boot disk from"
  type        = string
  default     = null
}

variable "boot_disk_postfix" {
  description = "Postfix for boot_disk name"
  type        = string
  default     = "boot"
}

variable "create_service_account" {
  description = "Create a service account for compute instance"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "Enable deletion protection on this instance. Defaults to false. Note: you must disable deletion protection before removing the resource (e.g., via terraform destroy), or the instance cannot be deleted and the Terraform run will not complete successfully."
  type        = bool
  default     = true
}

variable "enable_integrity_monitoring" {
  description = "Compare the most recent boot measurements to the integrity policy baseline"
  type        = bool
  default     = true
}

variable "enable_secure_boot" {
  description = "Verify the digital signature of all boot components,"
  type        = bool
  default     = true
}

variable "enable_vtpm" {
  description = "Use a virtualized trusted platform module"
  type        = bool
  default     = true
}

variable "image_name" {
  description = "The name of the image"
  type        = string
  default     = null
}

variable "image_family" {
  description = "The family name of the image"
  type        = string
  default     = null
}

variable "image_project" {
  description = "The project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default     = null
}

variable "instance_description" {
  description = "A brief description of this resource."
  type        = string
  default     = null
}

variable "labels" {
  description = "The labels to be associated with the resource/instance"
  type        = map(string)
  default     = {}
}

variable "machine_type" {
  description = "The machine type to create"
  type        = string
}

variable "metadata" {
  description = "Metadata key/value pairs to make available from within the instance."
  type        = map(string)
  default     = {}
}

variable "os_name" {
  description = "Name of operating system"
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs. "
  type        = string
  default     = null
}

variable "region" {
  description = "The Region in which the created address should reside."
  type        = string
}

variable "scratch_disks" {
  description = "Local ephemeral disks to attach to compute instance"
  type = map(object({
    interface = string # Can be either SCSI or NVME
  }))
  default = {}
}

variable "service_account_default_roles" {
  description = "Default IAM roles to apply to service account"
  type        = list(string)
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter"
  ]
}

variable "service_account_description" {
  description = "A text description of the service account."
  type        = string
  default     = null
}

variable "service_account_id" {
  description = "Service account id for out-of-band created service account"
  type        = string
  default     = null
}

variable "service_account_name" {
  description = "The display name for the service account."
  type        = string
  default     = null
}

variable "service_account_roles" {
  description = "IAM roles to apply to service account"
  type        = list(string)
  default     = []
}

variable "service_account_scopes" {
  description = "A list of service scopes. Both OAuth2 URLs and gcloud short names are supported."
  type        = list(string)
  default     = ["cloud-platform"]
}

variable "service_account_user_members" {
  description = "List of members with the Service Account User role on the compute instance service account"
  type        = list(string)
  default     = []
}

variable "snapshot_daily" {
  description = "Daily snapshot schedule"
  type = list(object({
    days_in_cycle = number
    start_time    = string
  }))
  default = [
    {
      days_in_cycle = 1
      start_time    = "04:00"
    }
  ]
}

variable "snapshot_guest_flush" {
  description = "Flush guest before snapshot (VSS)"
  type        = bool
  default     = true
}

variable "snapshot_hourly" {
  description = "Hourly snapshot schedule"
  type = list(object({
    hours_in_cycle = number
    start_time     = string
  }))
  default = []
}

variable "snapshot_labels" {
  description = "Labels for snapshots"
  type        = map(string)
  default     = {}
}

variable "snapshot_storage_locations" {
  description = "List of locations to store snapshots, regional or multi-regional"
  type        = list(string)
  default     = ["asia"]
}

variable "snapshot_max_age" {
  description = "Max age of snapshot in days"
  type        = number
  default     = 10
}

variable "snapshot_schedule" {
  description = "How often to run snapshots"
  type        = string
  default     = "daily"
}

variable "snapshot_weekly" {
  description = "Hourly snapshot schedule"
  type = list(object({
    days = list(object({
      day        = string
      start_time = string
    }))
  }))
  default = []
}

variable "static_address_description" {
  description = "An optional description of this resource."
  type        = string
  default     = null
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

variable "supplement_disks" {
  description = "Supplemental disks to attach to the instance"
  default     = {}
}

variable "regional_disks" {
  description = "Regional disks to attach to the instance"
  default     = {}
}

variable "tags" {
  description = "A list of tags to attach to the instance."
  type        = list(string)
  default     = []
}

variable "vm_instance_name" {
  description = "Name of the compute address resource"
  type        = string
}

variable "zone" {
  description = "The zone that the machine should be created in."
  type        = string
}

variable "regional_zones" {
  description = "The zones that the disks should be created in."
  type        = list(string)
  default     = []
}