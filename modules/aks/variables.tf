variable "resource_group_name" {}

variable "location" {
  description = "The Azure region for the resources"
  type        = string
  default     = "East US"
}

variable "aks_cluster_name" {
  description = "The name of the AKS Cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS Cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "The Kubernetes version to use"
  type        = string
  default     = "1.24.5"
}

variable "node_size" {
  description = "VM size for the AKS nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 3
}

variable "subnet_id" {
  description = "The ID of the existing subnet where AKS nodes will be deployed"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}
