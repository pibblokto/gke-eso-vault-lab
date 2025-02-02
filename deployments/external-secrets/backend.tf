terraform {
  backend "gcs" {
    bucket = "sandbox-pblkt-tf-state"
    prefix = "piblokto-ingress-external-secrets.tfstate"
  }
}
