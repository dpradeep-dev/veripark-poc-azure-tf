resource "azurerm_private_endpoint" "pe" {
  name                = "${var.pe_name}-pe"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.pe_name}-psc"
    is_manual_connection            = false
    private_connection_resource_id   = var.resource_id
    subresource_names                = var.subresource_names
  }

  private_dns_zone_group {
    name                 = "${var.pe_name}-dns-group"
    private_dns_zone_ids = [var.private_dns_zone_id]

  }
}
