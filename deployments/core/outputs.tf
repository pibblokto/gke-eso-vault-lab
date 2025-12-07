output "ca_certificate" {
    value     = module.sandbox_cluster.ca_certificate
    sensitive = true
}

output "endpoint" {
    value = module.sandbox_cluster.endpoint
}
