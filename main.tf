terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.37.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# data "terraform_remote_state" "vpc" {
#   backend = "azurerm"

#   config = {
#     resource_group_name  = "tfstate"
#     storage_account_name = "tfstate778xd"
#     container_name       = "tfstate"
#     key                  = "vpc-dev.tfstate"
#   }
# }

# Define resource group
resource "azurerm_resource_group" "rg-base" {
  name     = join("-", [var.resource_group_name_prefix, var.environment])
  location = var.region

  tags = var.common_tags
}

# Create virtual network
resource "azurerm_virtual_network" "developmentnetwork" {
  name                = join("-", [var.network_name_prefix, var.environment])
  address_space       = var.vpcnetwork
  location            = var.region
  resource_group_name = azurerm_resource_group.rg-base.name

  tags = var.common_tags
}

# Create subnet
resource "azurerm_subnet" "publicsubnet" {
  name                 = join("-", [var.public_subnet_name_prefix, var.environment])
  resource_group_name  = azurerm_resource_group.rg-base.name
  virtual_network_name = azurerm_virtual_network.developmentnetwork.name
  address_prefixes     = var.publicsubnet
}

# Create subnet
resource "azurerm_subnet" "privatesubnet" {
  name                 = join("-", [var.private_subnet_name_prefix, var.environment])
  resource_group_name  = azurerm_resource_group.rg-base.name
  virtual_network_name = azurerm_virtual_network.developmentnetwork.name
  address_prefixes     = var.privatesubnet
}

# Create public IPs
resource "azurerm_public_ip" "publicip" {
  name                = join("-", [var.public-ip-name_prefix, var.environment])
  location            = var.region
  resource_group_name = azurerm_resource_group.rg-base.name
  allocation_method   = "Dynamic"

  tags = var.common_tags
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "developmentnsg" {
  name                = join("-", [var.security_group_name_prefix, var.environment])
  location            = var.region
  resource_group_name = azurerm_resource_group.rg-base.name

  security_rule {
    name                       = "ssh"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.source_ip_prefix
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "kubectl"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = var.source_ip_prefix
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "https"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = var.source_ip_prefix
    destination_address_prefix = "*"
  }

  tags = var.common_tags
}

# Create public ip
# resource "azurerm_public_ip" "developmentpublicip" {
#   name                = "developmentPublicIp"
#   resource_group_name = azurerm_resource_group.rg-base.name
#   location            = azurerm_resource_group.rg-base.location
#   allocation_method   = "Static"

#   tags = var.common_tags

# }
