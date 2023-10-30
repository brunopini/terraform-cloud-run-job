terraform {
  required_version = "1.6.2"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.3.0"
    }
  }

  backend "gcs" {
    prefix  = "terraform/state"
    # bucket and credentials provided during initialization in `build.sh`
  }
}

provider "google" {
  credentials = file(var.google_credentials_file_path)
  project     = var.project_id
  region      = var.region
}
