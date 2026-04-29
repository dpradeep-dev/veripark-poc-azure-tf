resource "azurerm_private_dns_zone" "zones" {
  for_each = var.dns_zones
  name                = each.value
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  for_each = var.dns_zones
  name                  = "${each.key}-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.zones[each.key].name
  virtual_network_id    = var.vnet_id
}

