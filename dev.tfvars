rg_name                 = "my-dev-rg"
location                = "East US"
environment             = "dev"
backend_rg_name         = "infra-rg"
backend_storage_account = "terraformtfstatekiran"
backend_container_name  = "tfstate"

hub_vnet_name           = "hub-vnet"
hub_resource_group_name = "hub-rg"
hub_address_space       = "10.0.0.0/16"
hub_subnets = [
  { name = "shared-services", address_prefix = "10.0.1.0/24" },
  { name = "routing", address_prefix = "10.0.2.0/24" }
]

spoke1_vnet_name           = "spoke1-vnet"
spoke1_resource_group_name = "spoke1-rg"
spoke1_address_space       = "10.1.0.0/16"
spoke1_subnets = [
  { name = "app", address_prefix = "10.1.1.0/24" },
  { name = "data", address_prefix = "10.1.2.0/24" }
]

spoke2_vnet_name           = "spoke2-vnet"
spoke2_resource_group_name = "spoke2-rg"
spoke2_address_space       = "10.2.0.0/16"
spoke2_subnets = [
  { name = "app", address_prefix = "10.2.1.0/24" },
  { name = "data", address_prefix = "10.2.2.0/24" }
]

aks_cluster_name   = "dev-aks-cluster"
dns_prefix         = "devaks"
kubernetes_version = "1.28"
node_size          = "Standard_DS2_v2"
node_count         = 2
tags = {
  environment = "development"
  project     = "aks-deployment"
}