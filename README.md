# Azure Virtual Private Computing

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.37.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.2.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.publicip](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg-base](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.privatesubnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/subnet) | resource |
| [azurerm_subnet.publicsubnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.developmentnetwork](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/virtual_network) | resource |
| [http_http.my_ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [terraform_remote_state.networking](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_name"></a> [common\_name](#input\_common\_name) | Common part of all resource names, eq. organisation or project. | `string` | `"networking"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags | `map(any)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Azure environment name. | `string` | `"development"` | no |
| <a name="input_privatesubnet"></a> [privatesubnet](#input\_privatesubnet) | Public subnetwork | `list(string)` | n/a | yes |
| <a name="input_publicsubnet"></a> [publicsubnet](#input\_publicsubnet) | Public subnetwork | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Azure Region for deployment | `string` | `"westeurope"` | no |
| <a name="input_state_backend_container_name"></a> [state\_backend\_container\_name](#input\_state\_backend\_container\_name) | Container name for state file data. | `string` | n/a | yes |
| <a name="input_state_backend_resource_group_name"></a> [state\_backend\_resource\_group\_name](#input\_state\_backend\_resource\_group\_name) | Resource group for state file data. | `string` | n/a | yes |
| <a name="input_state_backend_storage_account_name"></a> [state\_backend\_storage\_account\_name](#input\_state\_backend\_storage\_account\_name) | Storage account for state file data. | `string` | n/a | yes |
| <a name="input_vpcnetwork"></a> [vpcnetwork](#input\_vpcnetwork) | VPC network | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | VPC private subnet id |
| <a name="output_public_fqdn"></a> [public\_fqdn](#output\_public\_fqdn) | The fqdn of the network. |
| <a name="output_public_ip_id"></a> [public\_ip\_id](#output\_public\_ip\_id) | The public ip address id. |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | VPC public subnet id |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource group name from VPC. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Network security group id |
| <a name="output_source_ip_address"></a> [source\_ip\_address](#output\_source\_ip\_address) | Source ip address allow for security group |
<!-- END_TF_DOCS -->