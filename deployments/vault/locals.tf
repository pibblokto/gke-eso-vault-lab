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
        {
            name  = "ui.enabled"
            value = "true"
        },
    ]

    app = {
        release_name  = "vault-reader"
        namespace     = "vault-reader"
        chart         = "./app/app-chart"
        values        = [
            {
                name  = "repository"
                value = "us-central1-docker.pkg.dev/piblokto/hashicorp-vault/vault-reader-http-server"
            },
            {
                name  = "tag"
                value = "v1"
            },
            {
                name  = "port"
                value = "8080"
            },
        ]
    }
}
