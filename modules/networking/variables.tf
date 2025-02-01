variable "project_id" {
  type        = string
  description = "Id of GCP project"
}
variable "subnets" {
  type        = list(map(string))
  description = "List of subnets that will be created in vpc"
}
variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
}
variable "vpc_name" {
  type        = string
  description = "Name of VPC that will be created"
}
variable "nat_region" {
  type        = string
  description = "Region, where Cloud NAT will be located"
}
