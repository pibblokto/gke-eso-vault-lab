data "google_client_config" "current" {}

data "terraform_remote_state" "core" {
  backend = "gcs"

  config = {
    bucket = "sandbox-pblkt-tf-state"
    prefix = "piblokto-sandbox-gke-deployment.tfstate"
  }
}


provider "helm" {
    kubernetes = {
        cluster_ca_certificate = base64decode(data.terraform_remote_state.core.outputs.ca_certificate)
        token                  = data.google_client_config.current.access_token
        host                   = "https://${data.terraform_remote_state.core.outputs.endpoint}"
    }
}

provider "kubernetes" {
    cluster_ca_certificate = base64decode(data.terraform_remote_state.core.outputs.ca_certificate)
    token                  = data.google_client_config.current.access_token
    host                   = "https://${data.terraform_remote_state.core.outputs.endpoint}"
}

provider "kubectl" {
    cluster_ca_certificate = base64decode(data.terraform_remote_state.core.outputs.ca_certificate)
    token                  = data.google_client_config.current.access_token
    host                   = "https://${data.terraform_remote_state.core.outputs.endpoint}"
}
