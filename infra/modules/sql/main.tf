resource "azurerm_mssql_server" "sql" {
  name                         = "${var.sql_name}"
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin
  administrator_login_password = var.sql_password
  identity { type = "SystemAssigned" }
  
  public_network_access_enabled = false
}

resource "azurerm_mssql_database" "db" {
  name      = "${var.sql_name}-db"
  server_id = azurerm_mssql_server.sql.id
  sku_name  = "S0"
}
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_access_policy" "sql" {
  key_vault_id = var.key_vault_id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_mssql_server.sql.identity[0].principal_id
  key_permissions = ["Get","WrapKey","UnwrapKey"]
}

resource "azurerm_mssql_server_transparent_data_encryption" "tde" {
  server_id = azurerm_mssql_server.sql.id
  key_vault_key_id = var.key_vault_key_id
}
