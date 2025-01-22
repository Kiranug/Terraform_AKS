variable "vnet_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "address_space" {}
variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
}
