variable "dns_zones" {
  type        = map(string)
  default = {
    sql = "privatelink.database.windows.net"
    vault = "privatelink.vaultcore.azure.net"
  }
}
variable "rg_name" {
  default = "acme-we-dev-rg"
}
variable "vnet_id" {
  type = string
}
