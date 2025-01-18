variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
}

variable "location" {
  description = "Azure region"
}

variable "node_count" {
  description = "Number of AKS nodes"
  default     = 2
}

variable "node_vm_size" {
  description = "VM size for AKS nodes"
  default     = "Standard_DS2_v2"
}
