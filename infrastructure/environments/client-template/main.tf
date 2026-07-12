# ==============================================================================
# OpenSightZA - Client Infrastructure Template
# Cloud Provider: Google Cloud Platform (GCP)
# Region: africa-south1 (Johannesburg) for POPIA Compliance
# ==============================================================================

# 1. Configure the Google Cloud Provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# 2. Define Variables (To make this template reusable for multiple clients)
variable "project_id" {
  description = "The GCP Project ID for the specific client"
  type        = string
  default     = "opensightza-client-001"
}

variable "region" {
  description = "GCP Region for POPIA Data Sovereignty"
  type        = string
  default     = "africa-south1"
}

# 3. Create a Secure Cloud Storage Bucket for Client Documents
resource "google_storage_bucket" "client_documents" {
  name          = "${var.project_id}-secure-docs"
  location      = var.region
  
  # Security: Enforce uniform bucket-level access (Disables legacy ACLs)
  uniform_bucket_level_access = true

  # Security: Prevent public access
  public_access_prevention = "enforced"

  # Lifecycle: Automatically delete temporary files after 90 days to save costs
  lifecycle_rule {
    condition {
      age = 90
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    environment = "production"
    managed_by  = "opensightza"
    compliance  = "popia"
  }
}

# 4. Output the bucket name so we can see it after deployment
output "bucket_name" {
  value = google_storage_bucket.client_documents.name
}
