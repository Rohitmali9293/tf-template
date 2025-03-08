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
  project = "tf-9293-sandbox"
  region = "asia-south1"
}