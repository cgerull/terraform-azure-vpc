##################################################################################
# DATA
##################################################################################
data "terraform_remote_state" "networking" {
  backend = "azurerm"
  config = {
    key                  = "networking/vpc.tfstate"
    storage_account_name = var.state_backend_storage_account_name
    resource_group_name  = var.state_backend_resource_group_name
    container_name       = var.state_backend_container_name
  }
}
data "http" "my_ip" {
  url = "http://ifconfig.me"
}