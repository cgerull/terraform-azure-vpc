## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.developmentnsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.publicip](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg-base](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.privatesubnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/subnet) | resource |
| [azurerm_subnet.publicsubnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.developmentnetwork](https://registry.terraform.io/providers/hashicorp/azurerm/3.37.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags | `map(any)` | <pre>{<br>  "environment": "development",<br>  "group": "development virtual machines",<br>  "services": "development network"<br>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Azure environment: development \| staging\| production | `string` | `"development"` | no |
| <a name="input_network_name_prefix"></a> [network\_name\_prefix](#input\_network\_name\_prefix) | Azure Resource group | `string` | `"net-clgr"` | no |
| <a name="input_private_subnet_name_prefix"></a> [private\_subnet\_name\_prefix](#input\_private\_subnet\_name\_prefix) | Azure Resource group | `string` | `"subnet-private-clgr"` | no |
| <a name="input_privatesubnet"></a> [privatesubnet](#input\_privatesubnet) | Public subnetwork | `list(string)` | <pre>[<br>  "192.168.10.0/24"<br>]</pre> | no |
| <a name="input_public-ip-name_prefix"></a> [public-ip-name\_prefix](#input\_public-ip-name\_prefix) | Azure Resource group | `string` | `"pip-clgr"` | no |
| <a name="input_public_subnet_name_prefix"></a> [public\_subnet\_name\_prefix](#input\_public\_subnet\_name\_prefix) | Azure Resource group | `string` | `"subnet-public-clgr"` | no |
| <a name="input_publicsubnet"></a> [publicsubnet](#input\_publicsubnet) | Public subnetwork | `list(string)` | <pre>[<br>  "192.168.1.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Azure Region for deployment | `string` | `"westeurope"` | no |
| <a name="input_resource_group_name_prefix"></a> [resource\_group\_name\_prefix](#input\_resource\_group\_name\_prefix) | Azure Resource group | `string` | `"rg-clgr"` | no |
| <a name="input_security_group_name_prefix"></a> [security\_group\_name\_prefix](#input\_security\_group\_name\_prefix) | Azure Resource group | `string` | `"sg-clgr"` | no |
| <a name="input_source_ip_prefix"></a> [source\_ip\_prefix](#input\_source\_ip\_prefix) | A single source ip prefix. | `string` | `"172.68.50.170"` | no |
| <a name="input_vpcnetwork"></a> [vpcnetwork](#input\_vpcnetwork) | VPC network | `list(string)` | <pre>[<br>  "192.168.0.0/16"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_fqdn"></a> [public\_fqdn](#output\_public\_fqdn) | The fqdn of the network. |
| <a name="output_public_id"></a> [public\_id](#output\_public\_id) | The public ip address id. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource group name from VPC. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Network security group id |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | VPC public subnet id |
