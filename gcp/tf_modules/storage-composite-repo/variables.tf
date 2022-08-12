variable "bucket_name" {
  description = "Name of Bucket to be created."
  type        = string
}
variable "location" {
  description = "Storage Bucket location"
  type        = string
  default     = "asia-south2"
}
variable "storage_class" {
  description = "Storage Bucket storage class"
  type        = string
  default     = "STANDARD"
}
variable "project_id" {
  description = "Project ID"
  type        = string
  default     = null
}
variable "force_destroy" {
  description = "Destroy even if bucket is not empty"
  type        = bool
  default     = false
}
variable "bucket_iam_policy_enabled" {
  description = "Enables policy bucket access"
  type        = bool
  default     = false
}
variable "policy_data" {
  description = "policy access data"
  default     = ""
}
variable "uniform_bucket_level_access" {
  description = "Enables Uniform bucket-level access to a bucket."
  type        = bool
  default     = true
}

variable "retentionPolicy" {
  description = "Retention policy for bucket"
  default     = []
  type = list(object({
    isLocked        = bool
    retentionPeriod = number
  }))
}
variable "encryption" {
  description = "Encryption key for the bucket"
  default     = []
  type        = set(string)
}

variable "lifecycle_rules" {
  type = set(object({
    action    = map(string)
    condition = map(string)
  }))
  description = "List of lifecycle rules to configure. Format is the same as described in provider documentation https://www.terraform.io/docs/providers/google/r/storage_bucket.html#lifecycle_rule except condition.matches_storage_class should be a comma delimited string. Example and description can be found in module readme file"
  default     = []
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
}