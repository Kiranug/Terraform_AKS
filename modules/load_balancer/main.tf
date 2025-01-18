resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "backend-pool"
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
}
