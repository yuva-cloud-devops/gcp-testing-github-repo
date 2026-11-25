terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0, < 7.0.0"
    }
  }
}

provider "google" {
  project = "yuvaraj-internal-project"
  region  = "asia-south1"
}

module "storage" {
  source           = "git::https://github.com/yuva-cloud-devops/gcp-terraform-custom-modules.git//storage-infrastructure?ref=main"
  config_file_path = "${path.module}/storage-config.yaml"
}

output "gcs_buckets" {
  description = "Created Cloud Storage (GCS) buckets"
  value       = module.storage.buckets
}

output "storage_summary" {
  description = "Storage summary"
  value       = module.storage.storage_summary
}
