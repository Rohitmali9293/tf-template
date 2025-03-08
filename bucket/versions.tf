# Terraform Settings Block
terraform {
   required_version = ">= 1.10.5"
   required_providers {
        google = {
        source  = "hashicorp/google"
        version = ">= 6.18.0"
        }
   }
 }

 provider "google" {
  project = local.config.gcp_project
  region = local.config.gcp_region1
}