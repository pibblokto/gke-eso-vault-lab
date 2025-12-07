module "argocd_installation" {
    source               = "../../modules/helm-release"
    release_name         = local.release_name
    repository           = local.repository
    namespace            = local.namespace
    chart                = local.chart
    chart_version        = local.chart_version
    values               = local.values
    expose_release       = false
}

data "kubectl_path_documents" "this" {
  pattern = "manifests/*.yaml"
  depends_on = [ module.argocd_installation ]
}

resource "kubectl_manifest" "this" {
  for_each  = data.kubectl_path_documents.this.manifests
  yaml_body = each.value
}
