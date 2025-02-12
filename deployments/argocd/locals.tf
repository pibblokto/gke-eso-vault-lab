locals {
    repository    = "https://argoproj.github.io/argo-helm"
    release_name  = "argocd"
    namespace     = "argocd"
    chart         = "argo-cd"
    chart_version = "7.8.2"
    values        = [
        {
            name  = "server.insecure"
            value = "true"
        },
        {
            name  = "server.service.type"
            value = "LoadBalancer"
        }
    ]
}
