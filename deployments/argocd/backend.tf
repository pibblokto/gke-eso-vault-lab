terraform {
  backend "gcs" {
    bucket = "sandbox-pblkt-tf-state"
    prefix = "piblokto-argocd-installation.tfstate"
  }
}
