locals {
    release_name         = var.release_name
    namespace            = var.namespace
    repository           = var.repository
    chart                = var.chart
    chart_version        = var.chart_version
    values               = var.values
    expose_release       = var.expose_release
    ingress_service_name = var.ingress_service_name
    ingress_service_port = var.ingress_service_port
    values_file          = var.values_file
}
