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


module "networking" {
  source           = "git::https://github.com/yuva-cloud-devops/gcp-terraform-custom-modules.git//networking-infrastructure/vpc-subnet-router-nat-firewall?ref=main"
  config_file_path = "${path.module}/network-config.yaml"
}


output "vpc_summary" {
  value = module.networking.vpcs
}

output "subnet_summary" {
  value = module.networking.subnets
}

output "router_summary" {
  value = module.networking.routers
}

output "nat_summary" {
  value = module.networking.nat_gateways
}

output "firewall_summary" {
  value = module.networking.firewall_rules
}

output "private_service_access_ranges" {
  value = module.networking.private_service_access_ranges
}

output "private_service_access_connections" {
  value = module.networking.private_service_access_connections
}
