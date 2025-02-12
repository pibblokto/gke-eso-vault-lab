module "cnpg_installation" {
    source               = "../../modules/helm-release"
    release_name         = local.release_name
    repository           = local.repository
    namespace            = local.namespace
    chart                = local.chart
    chart_version        = local.chart_version
    values               = local.values
    expose_release       = false
    ingress_service_name = "vault-ui"
    ingress_service_port = "8200"
}
resource "kubernetes_manifest" "cnpg_cluster" {
  manifest = {
    "apiVersion" = "postgresql.cnpg.io/v1"
    "kind"       = "Cluster"
    "metadata" = {
      "name"      = "pg-cluster"
      "namespace" = "default"
    }
    "spec" = {
      "instances" = "3"
      "storage" = {
        "size" = "1Gi"
      }
    }
  }
  depends_on = [ module.cnpg_installation ]
}
