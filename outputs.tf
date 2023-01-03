output "public_id" {
  description = "The public ip address id."
  value       = azurerm_public_ip.publicip.id
}
output "public_fqdn" {
  description = "The fqdn of the network."
  value       = azurerm_public_ip.publicip.fqdn
}
# output "availability_zone_ip_address" {
#   description = "The availability zone of the public ip address"
#   value       = azurerm_public_ip.developmentpublicip.availability_zone
# }

# output "vmnic_id" {
#   description = ""
#   value       = azurerm_network_interface.vmnic.id
# }

output "subnet_id" {
  description = "VPC public subnet id"
  value       = azurerm_subnet.publicsubnet.id
}

# output "public_ip_id" {
#   description = "Public IP address id"
#   value       = azurerm_public_ip.developmentpublicip.id
# }

output "security_group_id" {
  description = "Network security group id"
  value       = azurerm_network_security_group.developmentnsg.id
}

output "resource_group_name" {
  description = "Resource group name from VPC."
  value       = azurerm_resource_group.rg-base.name
}