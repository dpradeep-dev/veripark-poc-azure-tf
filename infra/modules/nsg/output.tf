output "web_nsg_id" {
  value = azurerm_network_security_group.web_nsg.id
}
output "mw_nsg_id" {
  value = azurerm_network_security_group.mw_nsg.id
}
output "pe_nsg_id" {
  value = azurerm_network_security_group.pe_nsg.id
}
