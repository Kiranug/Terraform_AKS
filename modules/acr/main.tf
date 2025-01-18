resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_role_assignment" "aks_to_acr" {
  principal_id         = var.aks_identity
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}
