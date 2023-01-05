##################################################################################
# DATA
##################################################################################
data "terraform_remote_state" "vpc" {
  backend = "azurerm"
  config = {
    key                  = "networking/vpc.tfstate"
    storage_account_name = var.storage_account_name
    resource_group_name  = var.resource_group_name
    container_name       = var.container_name
  }
}
data "http" "my_ip" {
  url = "http://ifconfig.me"
}