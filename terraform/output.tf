output "cloud_run_url" {
  description = "URL-ul public al serviciului Cloud Run"
  value       = google_cloud_run_service.default.status[0].url
}