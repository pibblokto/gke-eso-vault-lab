locals {
    repository    = "https://argoproj.github.io/argo-helm"
    release_name  = "argocd-rollouts"
    namespace     = "argocd-rollouts"
    chart         = "argo-rollouts"
    chart_version = "2.40.5"
    values        = []
}
