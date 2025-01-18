terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.64.0"
    }
  }
}

provider "azurerm" {
  features {}
}



module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnets             = var.subnets
}

module "aks" {
  source              = "./modules/aks"
  ...
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  ...
}

module "key_vault" {
  source              = "./modules/key_vault"
  ...
}

module "database" {
  source              = "./modules/database"
  ...
}
