locals {
    repository    = "https://helm.releases.hashicorp.com"
    release_name  = "vault"
    namespace     = "vault"
    chart         = "vault"
    chart_version = "0.29.1"
    values        = [
        {
            name  = "server.dev.enabled"
            value = "true"
        },
    ]
}
