variable "region" {
  description = "Azure Region for deployment"
  type        = string
  default     = "westeurope"
}
variable "environment" {
  description = "Azure environment: development | staging| production"
  type        = string
  default     = "development"
}
variable "resource_group_name_prefix" {
  description = "Azure Resource group"
  type        = string
  default     = "rg-clgr"
}
variable "network_name_prefix" {
  description = "Azure Resource group"
  type        = string
  default     = "net-clgr"
}
variable "public_subnet_name_prefix" {
  description = "Azure Resource group"
  type        = string
  default     = "subnet-public-clgr"
}
variable "private_subnet_name_prefix" {
  description = "Azure Resource group"
  type        = string
  default     = "subnet-private-clgr"
}
variable "security_group_name_prefix" {
  description = "Azure Resource group"
  type        = string
  default     = "sg-clgr"
}
variable "public-ip-name_prefix" {
  description = "Azure Resource group"
  type        = string
  default     = "pip-clgr"
}
variable "source_ip_prefix" {
  description = "A single source ip prefix."
  type        = string
  default     = "172.68.50.170"
}
variable "vpcnetwork" {
  description = "VPC network"
  type        = list(string)
  default     = ["192.168.0.0/16"]
}
variable "publicsubnet" {
  description = "Public subnetwork"
  type        = list(string)
  default     = ["192.168.1.0/24"]
}
variable "privatesubnet" {
  description = "Public subnetwork"
  type        = list(string)
  default     = ["192.168.10.0/24"]
}
variable "common_tags" {
  description = "Common tags"
  type        = map(any)
  default = {
    environment = "development"
    services    = "development network"
    group       = "development virtual machines"
  }
}