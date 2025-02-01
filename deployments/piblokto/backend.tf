terraform {
  backend "gcs" {
    bucket = "sandbox-pblkt-tf-state"
    prefix = "piblokto-sandbox-gke-deployment.tfstate"
  }
}
