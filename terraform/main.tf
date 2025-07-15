provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "default" {
  name     = var.service_name
  location = var.region
  template {
    spec {
      service_account_name = var.service_account_env 
      containers {
        image = var.image
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "noauth" {
  location = google_cloud_run_service.default.location
  service  = google_cloud_run_service.default.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

terraform {
  backend "gcs" {
    bucket  = "tftf-bucket"
    prefix  = "tftf-folder/state/"    
  }
}