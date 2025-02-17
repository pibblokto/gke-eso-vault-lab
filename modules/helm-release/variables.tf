variable "release_name" {
  type        = string
  description = "Name of the helm release"
}
variable "namespace" {
  type        = string
  description = "Namespace for release to be deployed in"
}
variable "repository" {
  type        = string
  description = "Repository URL to fetch chart from"
  default     = ""
}
variable "chart" {
  type        = string
  description = "Name of the chart to be installed"
}
variable "chart_version" {
  type        = string
  description = "Version of the chart"
  default     = ""
}
variable "values" {
  type            = list(map(string))
  description     = "List of values that are presented as --set flag during helm release"  
}
variable "expose_release" {
  type        = bool
  description = "Wether app should be exposed to the internet via Ingress. Create kubernetes_ingress resource if set to true"
  default     = false
}
variable "ingress_service_name" {
  type        = string
  description = "Name of target service for ingress. Required if expose_release is true"
  default     = ""
}
variable "ingress_service_port" {
  type        = string
  description = "Port of target service for ingress. Required if expose_release is true"
  default     = ""
}
variable "values_file" {
  type        = string
  description = "Values.yaml"
  default     = []  
}
