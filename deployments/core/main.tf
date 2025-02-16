module "sandbox_vpc" {
    source           = "../../modules/networking"
    project_id       = local.project_id
    vpc_name         = local.vpc_name
    nat_region       = local.nat_region
    subnets          = local.subnets
    secondary_ranges = local.secondary_ranges
}

module "sandbox_cluster" {
    source            = "../../modules/gke"
    project_id        = local.project_id
    cluster_name      = local.cluster_name
    vpc               = local.vpc_name
    subnetwork        = local.subnets[0]["subnet_name"]
    zones             = local.zones
    ip_range_pods     = "${local.subnets[0]["subnet_name"]}-pods-range"
    ip_range_services = "${local.subnets[0]["subnet_name"]}-services-range"
    node_pools        = local.node_pools
    depends_on        = [ module.sandbox_vpc ]
}
