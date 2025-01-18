variable "vnet_name" {
  description = "Name of the Virtual Network"
}

variable "location" {
  description = "Azure region"
}

variable "resource_group_name" {
  description = "Resource Group name"
}

variable "address_space" {
  description = "Address space for the Virtual Network"
}

variable "subnets" {
  description = "Subnets to create in the Virtual Network"
  type = list(object({
    name            = string
    address_prefix  = string
  }))
}
