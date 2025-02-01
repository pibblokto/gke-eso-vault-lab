locals {
    repository    = "https://kubernetes.github.io/ingress-nginx"
    release_name  = "ingress-nginx"
    namespace     = "ingress-nginx"
    chart         = "ingress-nginx"
    chart_version = "4.12.0"
    values        = []
}
