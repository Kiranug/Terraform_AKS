variable "acr_name" {
  description = "Name of the Azure Container Registry"
}

variable "location" {
  description = "Azure region"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
}

variable "aks_identity" {
  description = "Managed Identity of the AKS cluster"
}
