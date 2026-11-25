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

module "artifact_registry" {
  source           = "git::https://github.com/yuva-cloud-devops/gcp-terraform-custom-modules.git//container-infrastructure?ref=main"
  config_file_path = "${path.module}/artifact-config.yaml"
}

output "artifact_registries" {
  description = "Artifact Registry repositories"
  value       = module.artifact_registry.artifact_registries
}
