variable project_id {
  type        = string
  description = "Id of GCP project for cluster to be deployed in"
}
variable node_pools {
  type        = list(map(string))
  description = "List of node pool for gke cluster"
}
variable cluster_name {
  type = string
  description = "Name of GKE cluster that will be deployed"
}
variable zones {
  type        = list(string)
  description = "Zones of GKE cluster. It's assumed that cluster in this module is zonal"
}
variable vpc {
  type        = string
  description = "VPC name for cluster to be deployed in"
}
variable subnetwork {
  type        = string
  description = "Subnetwork to host cluster in"
}
variable ip_range_pods {
  type        = string
  description = "Name of secondary cird range for pods to get ip from"
}
variable ip_range_services {
  type        = string
  description = "Name of secondary cird range for services to get ip from"
}
