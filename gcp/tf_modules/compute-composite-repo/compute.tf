locals {
  service_account_name      = var.service_account_name == null ? var.vm_instance_name : var.service_account_name
  service_account_id        = replace(format("%s-%s", substr(local.service_account_name, 0, min(20, length(local.service_account_name))), random_id.service_account.dec), "--", "-")
  service_account_roles     = concat(var.service_account_default_roles, var.service_account_roles)
  static_address_project_id = var.static_address_project_id == null && var.project_id != null ? var.project_id : var.static_address_project_id
}

resource "random_id" "service_account" {
  byte_length = 2
}

resource "google_service_account" "instance" {
  count        = var.create_service_account ? 1 : 0
  account_id   = local.service_account_id
  description  = var.service_account_description
  display_name = local.service_account_name
  project      = var.project_id
}

data "google_service_account" "instance" {
  count      = var.create_service_account ? 0 : 1
  account_id = var.service_account_id
  project    = var.project_id
}

resource "google_service_account_iam_binding" "svcacct_users" {
  service_account_id = var.create_service_account ? google_service_account.instance[0].name : data.google_service_account.instance[0].name
  members            = var.service_account_user_members
  role               = "roles/iam.serviceAccountUser"
}

resource "google_project_iam_member" "svcacct_role" {
  for_each = toset(local.service_account_roles)
  project  = var.project_id
  member   = format("serviceAccount:%s", var.create_service_account ? google_service_account.instance[0].email : data.google_service_account.instance[0].email)
  role     = each.key
}

data "google_compute_subnetwork" "subnet" {
  name    = var.static_address_subnetwork
  project = local.static_address_project_id
  region  = var.region
}

resource "google_compute_address" "static" {
  name         = format("%s-static", var.vm_instance_name)
  address_type = "INTERNAL"
  description  = var.static_address_description
  project      = var.project_id
  region       = var.region
  subnetwork   = data.google_compute_subnetwork.subnet.self_link
}

data "google_compute_image" "boot_disk" {
  family  = var.image_family
  name    = var.image_name
  project = var.image_project
}

resource "google_compute_resource_policy" "snapshots" {
  name    = format("%s-snapshots", var.vm_instance_name)
  project = var.project_id
  region  = var.region
  snapshot_schedule_policy {
    schedule {
      dynamic "daily_schedule" {
        for_each = var.snapshot_schedule == "daily" ? var.snapshot_daily : []
        content {
          days_in_cycle = daily_schedule.value["days_in_cycle"]
          start_time    = daily_schedule.value["start_time"]
        }
      }
      dynamic "hourly_schedule" {
        for_each = var.snapshot_schedule == "hourly" ? var.snapshot_hourly : []
        content {
          hours_in_cycle = hourly_schedule.value["hours_in_cycle"]
          start_time     = hourly_schedule.value["start_time"]
        }
      }
      dynamic "weekly_schedule" {
        for_each = var.snapshot_schedule == "weekly" ? var.snapshot_weekly : []
        content {
          dynamic "day_of_weeks" {
            for_each = length(weekly_schedule.value["days"]) > 0 ? weekly_schedule.value["days"] : []
            content {
              day        = day_of_weeks.value["day"]
              start_time = day_of_weeks.value["start_time"]
            }
          }
        }
      }
    }
    retention_policy {
      max_retention_days    = var.snapshot_max_age
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    snapshot_properties {
      labels            = var.snapshot_labels
      storage_locations = var.snapshot_storage_locations
      guest_flush       = var.snapshot_guest_flush
    }
  }
}

resource "google_compute_disk" "boot_disk" {
  name     = format("%s-%s", var.vm_instance_name, var.boot_disk_postfix)
  image    = var.boot_disk_snapshot == null ? data.google_compute_image.boot_disk.self_link : null
  labels   = var.boot_disk_labels
  project  = var.project_id
  size     = var.boot_disk_size
  snapshot = var.boot_disk_snapshot
  type     = "pd-ssd"
  zone     = var.zone
  lifecycle {
    ignore_changes  = [image, snapshot]
    prevent_destroy = true
  }
}

resource "google_compute_disk_resource_policy_attachment" "boot_disk_snapshots" {
  name    = google_compute_resource_policy.snapshots.name
  disk    = google_compute_disk.boot_disk.name
  project = var.project_id
  zone    = var.zone
}

resource "google_compute_disk" "supplement_disks" {
  for_each = var.supplement_disks
  name     = format("%s-%s", var.vm_instance_name, each.key)
  labels   = lookup(each.value, "labels", {})
  project  = var.project_id
  size     = each.value["size"]
  snapshot = lookup(each.value, "snapshot", null)
  type     = lookup(each.value, "type", "pd-ssd")
  zone     = var.zone
  lifecycle {
    ignore_changes  = [type, snapshot]
    prevent_destroy = true
  }
}

resource "google_compute_disk_resource_policy_attachment" "supplement_disks_snapshots" {
  for_each = var.supplement_disks
  name     = google_compute_resource_policy.snapshots.name
  disk     = google_compute_disk.supplement_disks[each.key].name
  project  = var.project_id
  zone     = var.zone
}

resource "google_compute_region_disk" "regional_disks" {
  for_each = var.regional_disks
  name     = format("%s-%s", var.vm_instance_name, each.key)
  labels   = lookup(each.value, "labels", {})
  project  = var.project_id
  size     = each.value["size"]
  snapshot = lookup(each.value, "snapshot", null)
  type     = lookup(each.value, "type", "pd-ssd")
  region   = var.region
  replica_zones = var.regional_zones
}

resource "google_compute_region_disk_resource_policy_attachment" "regional_disks_snapshots" {
  for_each = var.regional_disks
  name     = google_compute_resource_policy.snapshots.name
  disk     = google_compute_region_disk.regional_disks[each.key].name
  project  = var.project_id
  region   = var.region
}

resource "google_compute_instance" "persistent" {
  allow_stopping_for_update = var.allow_stopping
  dynamic "attached_disk" {
    for_each = var.supplement_disks
    content {
      source = google_compute_disk.supplement_disks[attached_disk.key].self_link
      mode   = lookup(attached_disk.value, "mode", "READ_WRITE")
    }
  }
  dynamic "attached_disk"{
    for_each = var.regional_disks
    content {
      source = google_compute_region_disk.regional_disks[attached_disk.key].self_link
      mode   = lookup(attached_disk.value, "mode", "READ_WRITE")
    }    
  }
  boot_disk {
    auto_delete = false
    source      = google_compute_disk.boot_disk.self_link
  }

  dynamic "scratch_disk" {
    for_each = var.scratch_disks
    content {
      interface = scratch_disk.value["interface"]
    }
  }

  deletion_protection = var.deletion_protection
  description         = var.instance_description
  labels = merge(
    {
      os          = var.os_name,
      application = var.application_name
  }, var.labels)
  machine_type = var.machine_type
  metadata     = var.metadata
  name         = var.vm_instance_name

  network_interface {
    network_ip         = google_compute_address.static.address
    subnetwork         = var.static_address_subnetwork
    subnetwork_project = local.static_address_project_id
  }

  project = var.project_id

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  service_account {
    email  = var.create_service_account ? google_service_account.instance[0].email : data.google_service_account.instance[0].email
    scopes = var.service_account_scopes
  }

  shielded_instance_config {
    enable_secure_boot          = var.enable_secure_boot
    enable_vtpm                 = var.enable_vtpm
    enable_integrity_monitoring = var.enable_integrity_monitoring
  }

  tags = var.tags
  zone = var.zone

  lifecycle {
    ignore_changes  = [boot_disk[0].initialize_params[0].image]
    prevent_destroy = true
  }
}
