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

variable "secret_env_value" {
  description = "Secret value passed from GitHub"
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account Cloud Run should use."
  type        = string
}