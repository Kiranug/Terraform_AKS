resource "azurerm_virtual_network_peering" "source_to_target" {
  name                      = "${var.source_vnet_name}-to-${var.target_vnet_name}"
  resource_group_name       = var.source_resource_group
  virtual_network_name      = var.source_vnet_name
  remote_virtual_network_id = var.target_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = false
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "target_to_source" {
  name                      = "${var.target_vnet_name}-to-${var.source_vnet_name}"
  resource_group_name       = var.target_resource_group
  virtual_network_name      = var.target_vnet_name
  remote_virtual_network_id = var.source_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = false
  allow_gateway_transit        = false
}
