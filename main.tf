##################################################################################
# CONFIGURATION
##################################################################################
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.37.0"
    }
  }
  backend "azurerm" {
    key = "networking/vpc.tfstate"
  }
}

##################################################################################
# PROVIDERS
##################################################################################
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
##################################################################################
# LOCALS
##################################################################################
locals {
  environment      = terraform.workspace
  source_ip_prefix = data.http.my_ip.response_body
}
##################################################################################
# RESOURCES
##################################################################################
resource "azurerm_resource_group" "rg-base" {
  name     = join("-", ["rg", var.common_name, local.environment])
  location = var.region

  tags = merge(var.common_tags,
    {
      environment = terraform.workspace
    }
  )
}

# Create virtual network
resource "azurerm_virtual_network" "developmentnetwork" {
  name                = join("-", ["vpc", var.common_name, var.environment])
  address_space       = var.vpcnetwork
  location            = var.region
  resource_group_name = azurerm_resource_group.rg-base.name

  tags = merge(var.common_tags,
    {
      environment = terraform.workspace
    }
  )
}

# Create subnet
resource "azurerm_subnet" "publicsubnet" {
  name                 = join("-", ["subnet", "public", var.common_name, var.environment])
  resource_group_name  = azurerm_resource_group.rg-base.name
  virtual_network_name = azurerm_virtual_network.developmentnetwork.name
  address_prefixes     = var.publicsubnet
}

# Create subnet
resource "azurerm_subnet" "privatesubnet" {
  name                 = join("-", ["subnet", "private", var.common_name, var.environment])
  resource_group_name  = azurerm_resource_group.rg-base.name
  virtual_network_name = azurerm_virtual_network.developmentnetwork.name
  address_prefixes     = var.privatesubnet
}

# Create public IPs
resource "azurerm_public_ip" "publicip" {
  name                = join("-", ["pip", var.common_name, var.environment])
  location            = var.region
  resource_group_name = azurerm_resource_group.rg-base.name
  allocation_method   = "Dynamic"

  tags = merge(var.common_tags,
    {
      environment = terraform.workspace
    }
  )
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = join("-", ["sg", var.common_name, var.environment])
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
    source_address_prefix      = local.source_ip_prefix
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
    source_address_prefix      = local.source_ip_prefix
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
    source_address_prefix      = local.source_ip_prefix
    destination_address_prefix = "*"
  }

  tags = merge(var.common_tags,
    {
      environment = terraform.workspace
    }
  )
}
