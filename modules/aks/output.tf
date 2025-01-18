output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_identity" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}
