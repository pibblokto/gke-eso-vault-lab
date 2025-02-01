resource "helm_release" "vault" {
  name             = local.release_name
  namespace        = local.namespace
  repository       = local.repository
  chart            = local.chart
  version          = local.chart_version
  create_namespace = true

  dynamic "set" {
    for_each = local.values
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }
  }
}
