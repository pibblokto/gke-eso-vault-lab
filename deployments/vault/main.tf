module "vault_installation" {
    source               = "../../modules/helm-release"
    release_name         = local.release_name
    repository           = local.repository
    namespace            = local.namespace
    chart                = local.chart
    chart_version        = local.chart_version
    values               = local.values
    expose_release       = true
    ingress_service_name = "vault-ui"
    ingress_service_port = "8200"
}
resource "kubernetes_cluster_role_binding" "role_tokenreview_binding" {
  metadata {
    name = "role-tokenreview-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "system:auth-delegator"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "external-secrets"
    namespace = "external-secrets"
  }
  depends_on = [ module.vault_installation ]
}
module "vault_reader_app" {
    source               = "../../modules/helm-release"
    release_name         = local.app.release_name
    namespace            = local.app.namespace
    chart                = local.app.chart
    values               = local.app.values
    depends_on           = [ kubernetes_cluster_role_binding.role_tokenreview_binding ]
}
