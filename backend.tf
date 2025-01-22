terraform {
  backend "azurerm" {
    resource_group_name  = "infra-rg"
    storage_account_name = "terraformtfstatekiran"
    container_name       = "tfstate"
    key                  = "terraform.tfstateenv:dev"
  }
}
