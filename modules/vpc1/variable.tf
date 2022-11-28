variable "vpcname" {
  type        = string
  default     = "vpc1"
  description = "description"
}

variable "cidr_block" {
  type    = string
  default   = "10.0.0.0/18"
}