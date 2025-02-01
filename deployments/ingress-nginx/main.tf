module "ingress_nginx" {
    source         = "../../modules/helm-release"
    release_name   = local.release_name
    repository     = local.repository
    namespace      = local.namespace
    chart          = local.chart
    chart_version  = local.chart_version
    values         = local.values
}
