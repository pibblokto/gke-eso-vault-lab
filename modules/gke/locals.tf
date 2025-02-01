locals {
    node_pools        = var.node_pools
    project_id        = var.project_id
    cluster_name      = var.cluster_name
    zones             = var.zones
    vpc               = var.vpc
    subnetwork        = var.subnetwork
    ip_range_pods     = var.ip_range_pods
    ip_range_services = var.ip_range_services
}
