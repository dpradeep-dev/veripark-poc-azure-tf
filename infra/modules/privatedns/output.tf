output "zone_ids" {
  value = {
    for i, j in azurerm_private_dns_zone.zones :
    i => j.id
  }
}
output "zone_names" {
  value = {
    for i, j in azurerm_private_dns_zone.zones :
    i => j.name
  }

}
