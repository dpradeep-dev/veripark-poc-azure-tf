variable "location" {
  default = "westeurope"
}
variable "web_nsg_name" {
  default = "acme-we-dev-web-nsg"
}
variable "mw_nsg_name" {
  default = "acme-we-dev-mw-nsg"
}
variable "pe_nsg_name" {
  default = "acme-we-dev-pe-nsg"
}
variable "rg_name" {
  default = "acme-we-dev-rg"
}
variable "web_cidr" {
}
variable "mw_cidr" {
}
variable "pe_cidr" {
}
variable "web_subnet_id" {
}
variable "mw_subnet_id" {
}
variable "pe_subnet_id" {
}
