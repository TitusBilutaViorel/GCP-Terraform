provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "default" {
  name     = var.service_name
  location = var.region
  template {
    spec {
      service_account_name = var.service_account_email 
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

resource "google_secret_manager_secret" "my_secret" {
  secret_id = "my-secret-${var.env}"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "my_secret_version" {
  secret      = google_secret_manager_secret.my_secret.id
  secret_data = var.secret_env_value
}

terraform {
  backend "gcs" {
    bucket  = "tftf-bucket"
    prefix  = "tftf-folder/state/"    
  }
}