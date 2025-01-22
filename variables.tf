variable "rg_name" {
  description = "Name of the resource group"
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
}

variable "backend_rg_name" {
  description = "Resource group name for backend storage"
}

variable "backend_storage_account" {
  description = "Storage account name for backend"
}

variable "backend_container_name" {
  description = "Container name for backend"
}

variable "hub_vnet_name" {
}
variable "hub_resource_group_name" {}
variable "hub_address_space" {}
variable "hub_subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}
variable "spoke1_vnet_name" {}
variable "spoke1_resource_group_name" {}
variable "spoke1_address_space" {}
variable "spoke1_subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}
variable "spoke2_vnet_name" {}
variable "spoke2_resource_group_name" {}
variable "spoke2_address_space" {}
variable "spoke2_subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}


variable "vm_size" {
  type    = string
  default = "Standard_D2_v2"
}

variable "username" {
  type    = string
  default = "azureadmin"
}


# The Azure region where the resources will be deployed
variable "location" {
  description = "The Azure region for the resources"
  type        = string
  default     = "East US"
}

# The name of the AKS Cluster
variable "aks_cluster_name" {
  description = "The name of the AKS Cluster"
  type        = string
}

# The DNS prefix for the AKS Cluster
variable "dns_prefix" {
  description = "DNS prefix for the AKS Cluster"
  type        = string
}

# The Kubernetes version to use in the AKS cluster
variable "kubernetes_version" {
  description = "The Kubernetes version to use"
  type        = string
  default     = "1.24.5"
}

# The size of the VM for the AKS nodes
variable "node_size" {
  description = "VM size for the AKS nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

# The number of nodes in the AKS cluster
variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 2
}



# Tags to assign to the resources
variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "ARM_CLIENT_ID" {
  type        = string
  description = "The client ID of the Azure Service Principal."
}

variable "ARM_CLIENT_SECRET" {
  type        = string
  description = "The client secret of the Azure Service Principal."
  sensitive   = true  # Marking as sensitive to keep the value secure
}

variable "ARM_TENANT_ID" {
  type        = string
  description = "The tenant ID of the Azure Service Principal."
}

variable "ARM_SUBSCRIPTION_ID" {
  type        = string
  description = "The Azure Subscription ID."
}


