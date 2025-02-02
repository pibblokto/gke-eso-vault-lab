resource "helm_release" "this" {
  name             = local.release_name
  namespace        = local.namespace
  repository       = local.repository != "" ? local.repository : null
  chart            = local.chart
  version          = local.chart_version != "" ? local.chart_version : null
  create_namespace = true

  dynamic "set" {
    for_each = local.values
    content {
      name  = set.value["name"]
      value = set.value["value"]
    }
  }
}
resource "kubernetes_ingress_v1" "this" {
  count = local.expose_release ? 1 : 0

  metadata {
    name      = "${local.release_name}-ingress"
    namespace = var.namespace
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          path = "/"
          backend {
            service {
              name = local.ingress_service_name
              port {
                number = local.ingress_service_port
              }
            }
          }
        }
      }
    }
  }
}
