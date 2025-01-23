terraform {
  cloud {
    organization = "KTECH-CLOUD" # Replace with your Terraform Cloud organization name

    workspaces {
      name = "Terraform_AKS" # Replace with the Terraform Cloud workspace name
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID
  subscription_id = var.ARM_SUBSCRIPTION_ID
}

#Resource Group Section 
module "resource_group" {
  source      = "./modules/resource_group"
  rg_name     = var.rg_name
  location    = var.location
  environment = terraform.workspace
}
module "resource_group-hub" {
  source      = "./modules/resource_group"
  rg_name     = var.hub_resource_group_name
  location    = var.location
  environment = terraform.workspace
}

module "resource_group-spoke1" {
  source      = "./modules/resource_group"
  rg_name     = var.spoke1_resource_group_name
  location    = var.location
  environment = terraform.workspace
}
module "resource_group-spoke2" {
  source      = "./modules/resource_group"
  rg_name     = var.spoke2_resource_group_name
  location    = var.location
  environment = terraform.workspace
}

# Network Section 

# Create Hub VNet
module "hub_network" {
  source              = "./modules/network"
  vnet_name           = var.hub_vnet_name
  location            = var.location
  resource_group_name = var.hub_resource_group_name
  address_space       = [var.hub_address_space]
  subnets             = var.hub_subnets
}

# Create Spoke1 VNet
module "spoke1_network" {
  source              = "./modules/network"
  vnet_name           = var.spoke1_vnet_name
  location            = var.location
  resource_group_name = var.spoke1_resource_group_name
  address_space       = [var.spoke1_address_space]
  subnets             = var.spoke1_subnets
}

# Create Spoke2 VNet
module "spoke2_network" {
  source              = "./modules/network"
  vnet_name           = var.spoke2_vnet_name
  location            = var.location
  resource_group_name = var.spoke2_resource_group_name
  address_space       = [var.spoke2_address_space]
  subnets             = var.spoke2_subnets
}

# Peering between Hub and Spoke1
module "hub_spoke1_peering" {
  source                = "./modules/peering"
  source_vnet_id        = module.hub_network.vnet_id
  target_vnet_id        = module.spoke1_network.vnet_id
  source_vnet_name      = var.hub_vnet_name
  target_vnet_name      = var.spoke1_vnet_name
  source_resource_group = var.hub_resource_group_name
  target_resource_group = var.spoke1_resource_group_name
}

# Peering between Hub and Spoke2
module "hub_spoke2_peering" {
  source                = "./modules/peering"
  source_vnet_id        = module.hub_network.vnet_id
  target_vnet_id        = module.spoke2_network.vnet_id
  source_vnet_name      = var.hub_vnet_name
  target_vnet_name      = var.spoke2_vnet_name
  source_resource_group = var.hub_resource_group_name
  target_resource_group = var.spoke2_resource_group_name
}

module "aks" {
  source              = "./modules/aks"
  resource_group_name = var.spoke1_resource_group_name
  location            = var.location
  aks_cluster_name    = var.aks_cluster_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  node_size           = var.node_size
  node_count          = var.node_count
  subnet_id           = module.spoke1_network.subnets[0]
  tags                = var.tags
}

module "ingress_controller" {
  source                            = "./modules/ingress-controller"
  kubernetes_host                   = module.aks.host
  kubernetes_client_certificate     = module.aks.client_certificate
  kubernetes_client_key             = module.aks.client_key
  kubernetes_cluster_ca_certificate = module.aks.cluster_ca_certificate
}
