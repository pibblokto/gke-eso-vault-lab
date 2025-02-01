output cluster_id {
  value       = module.gke.cluster_id
  sensitive   = false
  description = "Id of GKE cluster"
}
output endpoint {
    value       = module.gke.endpoint
    sensitive   = false
    description = "Endpoint of GKE cluster"
}
output identity_namespace {
    value       = module.gke.identity_namespace
    sensitive   = false
    description = "Workload Identity pool"
}
output name {
    value       = module.gke.name
    sensitive   = false
    description = "Name of GKE cluster"
}
output node_pools_names {
    value       = module.gke.node_pools_names
    sensitive   = false
    description = "List of GKE cluster node pools"
}
output type {
    value       = module.gke.type
    sensitive   = false
    description = "Type of GKE cluster (regional/zonal)"
}
