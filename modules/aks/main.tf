resource "azurerm_kubernetes_cluster" "aks-config" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name        = "default"
    node_count  = var.node_count
    vm_size     = var.node_size
    vnet_subnet_id = var.subnet_id  # Reference the pre-existing subnet
    max_pods    = 110
    type        = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
