terraform {
  required_version = ">=1.2.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.31.0"
    }
  }
  backend "gcs" {
    bucket = "" /*Bucket name*/
    prefix = "terraform"
  }
}