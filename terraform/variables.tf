variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "image" {
  type        = string
  description = "Docker image to deploy"
}

variable "service_name" {
  type        = string
  description = "The name of the Cloud Run service"
}

variable "env" {
  description = "Environment type (e.g., dev, beta, prod)"
  type        = string
}

variable "service_account_env" {
  description = "The email of the service account Cloud Run should use."
  type        = string
}