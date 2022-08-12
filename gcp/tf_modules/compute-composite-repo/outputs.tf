output "instance" {
  description = "The name of the instance created while running the module"
  value       = google_compute_instance.persistent
}

output "service_account" {
  description = "The service account created to be used by the instance created above"
  value       = coalescelist(google_service_account.instance[*], data.google_service_account.instance[*])[0]
}

output "internal_address" {
  description = "The created internal IP address"
  value       = google_compute_address.static
}

output "boot_disk" {
  description = "Instance boot disk"
  value       = google_compute_disk.boot_disk
}

output "supplement_disks" {
  description = "Supplemental disks attached to the instance"
  value       = google_compute_disk.supplement_disks
}