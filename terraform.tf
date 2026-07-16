# Declare the required version of Terraform
terraform {
  required_version = ">= 1.4.0"

  // s3 statefile locking
  backend "s3" {
    bucket = "three-tier-tf-state-file"
    key    = "Terraform-highly-scalable-and-available-3Tier-web-app-architecture/terrafom.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }

  # Declare the required provider and its version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}