/******************************************
    Basic Storage Bucket Creation
 *****************************************/
resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  project       = var.project_id
  force_destroy = var.force_destroy

  uniform_bucket_level_access = var.uniform_bucket_level_access

  dynamic "retention_policy" {
    for_each = var.retentionPolicy

    content {
      is_locked        = retention_policy.value.isLocked
      retention_period = retention_policy.value.retentionPeriod
    }
  }

  dynamic "encryption" {
    for_each = var.encryption

    content {
      default_kms_key_name = encryption.value
    }
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rules
    content {
      action {
        type          = lifecycle_rule.value.action.type
        storage_class = lookup(lifecycle_rule.value.action, "storage_class", null)
      }
      condition {
        age                   = lookup(lifecycle_rule.value.condition, "age", null)
        created_before        = lookup(lifecycle_rule.value.condition, "created_before", null)
        with_state            = lookup(lifecycle_rule.value.condition, "with_state", lookup(lifecycle_rule.value.condition, "is_live", false) ? "LIVE" : null)
        matches_storage_class = contains(keys(lifecycle_rule.value.condition), "matches_storage_class") ? split(",", lifecycle_rule.value.condition["matches_storage_class"]) : null
        num_newer_versions    = lookup(lifecycle_rule.value.condition, "num_newer_versions", null)
      }
    }
  }
}

resource "google_storage_bucket_iam_policy" "policy" {
  count = var.bucket_iam_policy_enabled ? 1 : 0

  bucket      = google_storage_bucket.bucket.name
  policy_data = var.policy_data
}
