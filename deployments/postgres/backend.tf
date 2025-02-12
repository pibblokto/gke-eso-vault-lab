terraform {
  backend "gcs" {
    bucket = "sandbox-pblkt-tf-state"
    prefix = "piblokto-cnpg-installation.tfstate"
  }
}
