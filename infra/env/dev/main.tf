locals {
  tags ={
    project = "Azure POC"
    owner = "acme"
    environment = "dev"
    costcenter = "Platform"
  }
}
module "rg" {
  source   = "../../modules/resourcegroup"
  rg_name = var.rg_name
  location = var.location
  tags = local.tags
}

module "vnet" {
  source   = "../../modules/vnet"
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space
  rg_name  = module.rg.name
  location = var.location
  subnets = var.subnets
}

module "nsg" {
  source   = "../../modules/nsg"
  rg_name  = module.rg.name
  location = var.location
  web_nsg_name = var.web_nsg_name
  mw_nsg_name = var.mw_nsg_name
  pe_nsg_name = var.pe_nsg_name
  web_cidr = var.web_cidr
  mw_cidr = var.mw_cidr
  pe_cidr = var.pe_cidr
  web_subnet_id = module.vnet.subnet_ids["web-subnet"]
  mw_subnet_id = module.vnet.subnet_ids["mw-subnet"]
  pe_subnet_id = module.vnet.subnet_ids["pe-subnet"]
}

module "keyvault" {
  source   = "../../modules/keyvault"
  rg_name  = module.rg.name
  location = var.location
  kv_name  = var.kv_name
}


resource "random_password" "sql_admin" {
  length           = 16
  special          = true
  override_special = "_%@"
}

module "sql" {
  source             = "../../modules/sql"
  sql_name  = var.sql_name
  sql_admin = var.sql_admin
  rg_name   = module.rg.name
  location  = var.location
  sql_password = random_password.sql_admin.result
  key_vault_key_id   = module.keyvault.key_id
  key_vault_id = module.keyvault.id
}

module "app_webapi" {
  source   = "../../modules/appservice"
  app_name = "webapi"
  rg_name  = module.rg.name
  location = var.location
  public_network_access_enabled = true
}
module "vault_pe" {
  source             = "../../modules/privateendpoint"
  pe_name            = var.kv_pe_name
  rg_name            = module.rg.name
  location           = var.location
  subnet_id          = module.vnet.subnet_ids["pe-subnet"]
  resource_id        = module.keyvault.id
  subresource_names  = var.subresource_names_vault
  private_dns_zone_id = module.dns.zone_ids["vault"]
}

module "app_mw" {
  source   = "../../modules/appservice"
  app_name = "middleware"
  rg_name  = module.rg.name
  location = var.location
  public_network_access_enabled = false
}

module "dns" {
  source   = "../../modules/privatedns"
  rg_name  = module.rg.name
  vnet_id  = module.vnet.vnet_id
  dns_zones = var.dns_zones
}

module "sql_pe" {
  source             = "../../modules/privateendpoint"
  pe_name            = var.sql_pe_name
  rg_name            = module.rg.name
  location           = var.location
  subnet_id          = module.vnet.subnet_ids["pe-subnet"]
  resource_id        = module.sql.sql_server_id
  subresource_names  = var.subresource_names_sql
  private_dns_zone_id = module.dns.zone_ids["sql"]
}
module "publicip" {
  source = "../../modules/publicip"
  pip_name = var.public_ip_name
  rg_name = module.rg.name
  location = var.location
}

module "appgw" {
  source       = "../../modules/appgateway"
  appgw_name = var.appgw_name
  rg_name    = module.rg.name
  location   = var.location
  subnet_id  = module.vnet.subnet_ids["gw-subnet"]
  public_ip_id = module.publicip.pip_id
  fqdns_names = [module.app_webapi.default_hostname]
}
