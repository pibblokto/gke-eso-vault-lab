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
resource "kubernetes_ingress_v1" "argocd" {
  depends_on = [ module.argocd_installation ]
  metadata {
    name      = "argocd-ingress"
    namespace = "argocd"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "argocd-server"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
