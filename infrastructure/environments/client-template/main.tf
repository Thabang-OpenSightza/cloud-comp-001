# 1. We are using Google Cloud
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

# 2. Configured the provider to use the Johannesburg region
provider "google" {
  project = "opensightza-client-01" # The client's GCP Project ID
  region  = "africa-south1"         # POPIA Compliant: Johannesburg!
}

# 3. Defined the actual resource we want to build
resource "google_storage_bucket" "client_documents" {
  name          = "opensightza-client01-docs"
  location      = "africa-south1"
  
  # Ensuring data cannot be accidentally deleted
  uniform_bucket_level_access = true

  # Adding a label so it's easy to track costs
  labels = {
    environment = "production"
    managed_by  = "opensightza"
  }
}
