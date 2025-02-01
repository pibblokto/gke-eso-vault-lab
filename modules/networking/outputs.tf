output "network_self_link" {
    value = module.vpc.network_self_link
}
output "subnets_ips" {
    value = module.vpc.subnets_ips
}
output "subnets_name" {
    value = module.vpc.subnets_names
}
output "network_name" {
    value = module.vpc.network_name
}