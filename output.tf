output "resource_group_id" {
  value = module.resource_group.id
}
output "kube_config" {
  description = "The kubeconfig to access the AKS cluster"
  value       = module.aks.kube_config
  sensitive   = true
}

