terraform {
  backend "gcs" {
    bucket = "sandbox-pblkt-tf-state"
    prefix = "piblokto-ingress-nginx-installation.tfstate"
  }
}
