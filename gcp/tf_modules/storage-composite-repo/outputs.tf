output "bucket_name" {
  value       = google_storage_bucket.bucket.name
  description = "Google Bucket name"
}