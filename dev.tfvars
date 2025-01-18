resource_group_name = "dev-rg"
location            = "East US"
vnet_name           = "dev-vnet"
address_space       = ["10.0.0.0/16"]
subnets = [
  { name = "aks-subnet", address_prefix = "10.0.1.0/24" },
  { name = "lb-subnet", address_prefix = "10.0.2.0/24" }
]
sql_server_name     = "dev-sql-server"
sql_database_name   = "dev-db"
admin_username      = "adminuser"
admin_password      = "password123!"
key_vault_name      = "dev-keyvault"
