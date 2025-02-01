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
}
variable "chart" {
  type        = string
  description = "Name of the chart to be installed"
}
variable "chart_version" {
  type = string
  description = "Version of the chart"
}
variable "values" {
  type            = list(map(string))
  description     = "List of values that are presented as --set flag during helm release"  
}
