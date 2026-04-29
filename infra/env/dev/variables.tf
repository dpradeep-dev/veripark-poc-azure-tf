variable "location" {
  type = string
  default = "westeurope"
}
variable "rg_name" {
  default = "acme-we-dev-rg"
}
variable "vnet_name" {
  type = string
  default = "acme-we-dev-vnet"
}
variable "vnet_address_space" {
    type = list(string)
  default = ["10.0.0.0/16"]
}
variable "subnets" {
  type        = map(string)
  default = {
    "web-subnet" = "10.0.1.0/24"
    "mw-subnet" = "10.0.2.0/24"
    "pe-subnet" = "10.0.3.0/24"
    "gw-subnet" = "10.0.4.0/24"
  }
}
variable "web_nsg_name" {
    type = string
  default = "acme-we-dev-web-nsg"
}
variable "mw_nsg_name" {
      type = string
  default = "acme-we-dev-mw-nsg"
}
variable "pe_nsg_name" {
      type = string
  default = "acme-we-dev-pe-nsg"
}
variable "web_cidr" {
    type = string
  default = "10.0.1.0/24"
}
variable "mw_cidr" {
      type = string
  default = "10.0.2.0/24"
}
variable "pe_cidr" {
      type = string
  default = "10.0.3.0/24"
}
variable "kv_name" {
      type = string
  default = "acme-we-dev-kv"
}
variable "sql_name" {
      type = string
  default = "acme-we-dev-sql"
}
variable "sql_admin" {
      type = string
  default = "acmesqladmin"
}
variable "subresource_names_sql" {
    type = list(string)
  default = ["sqlServer"]
}
variable "subresource_names_vault" {
    type = list(string)
  default = ["vault"]
}
variable "kv_pe_name" {
      type = string
  default = "acme-we-dev-kv"
}
variable "sql_pe_name" {
      type = string
  default = "acme-we-dev-sql"
}
variable "dns_zones" {
  type        = map(string)
  default = {
    sql = "privatelink.database.windows.net"
    vault = "privatelink.vaultcore.azure.net"
  }
}
variable "appgw_name" {
    type = string
    default = "acme-we-dev-appgw"
}
variable "public_ip_name" {
    type = string
    default = "acme-we-dev-appgw-pip"
}
