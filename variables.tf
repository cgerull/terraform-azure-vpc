##################################################################################
# VARIABLES
##################################################################################
variable "region" {
  description = "Azure Region for deployment"
  type        = string
  default     = "westeurope"
}
variable "environment" {
  description = "Azure environment name."
  type        = string
  default     = "development"
}
variable "common_name" {
  description = "Common part of all resource names, eq. organisation or project."
  type        = string
  default     = "networking"
}
variable "vpcnetwork" {
  description = "VPC network"
  type        = list(string)
}
variable "publicsubnet" {
  description = "Public subnetwork"
  type        = list(string)
}
variable "privatesubnet" {
  description = "Public subnetwork"
  type        = list(string)
}
variable "common_tags" {
  description = "Common tags"
  type        = map(any)
}
variable "state_backend_resource_group_name" {
  description = "Resource group for state file data."
  type        = string
}
variable "state_backend_storage_account_name" {
  description = "Storage account for state file data."
  type        = string
}
variable "state_backend_container_name" {
  description = "Container name for state file data."
  type        = string
}