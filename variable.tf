variable "app_name" {
  type        = string
  description = "App middle prefix name"
  default     = "waf-log-service"
}

variable "project_name_prefix" {
  type        = string
  description = "A string value to describe prefix of all the resources"
  default     = "dev-tothenew"
}

variable "common_tags" {
  type        = map(string)
  description = "A map to add common tags to all the resources"
  default = {
    Project = "ToTheNew"
  }
}

variable "accepter_region" {
  type        = string
  description = "The region of the accepter VPC of the VPC Peering Connection."
  default     = ""
}

variable "accepter_owner_id" {
  type        = number
  description = "The AWS account ID of the owner of the peer VPC."
  default     = 0
}

variable "accepter_vpc_id" {
  type        = string
  description = "The ID of the VPC with which you are creating the VPC Peering Connection."
}

variable "requester_vpc_id" {
  type        = string
  description = "The ID of the requester VPC."
}

variable "auto_accept_peering" {
  type        = bool
  description = "Whether or not to accept the peering request."
  default     = false
}

variable "requester_dns_resolution" {
  type        = bool
  description = "Indicates whether a local VPC can resolve public DNS hostnames to private IP addresses when queried from instances in a requester VPC."
  default     = false
}

variable "accepter_dns_resolution" {
  type        = bool
  description = "Indicates whether a local VPC can resolve public DNS hostnames to private IP addresses when queried from instances in a accepter VPC."
  default     = false
}

variable "create_peering_routes" {
  type        = bool
  description = "True/False value need to create Peering Route or not, Default to false"
  default     = false
}

variable "route_table_id" {
  type        = string
  description = "Route Table Id"
  default     = ""
}

variable "destination_cidr_block" {
  type        = string
  description = "Route Table destination cidr_block"
  default     = ""
}