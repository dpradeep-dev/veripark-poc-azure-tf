variable "appgw_name" {
  type = string
  default = "acme-we-dev-appgw"
}
variable "location" {
  type = string
  default = "westeurope"
}
variable "rg_name" {
  type = string
  default = "acme-we-dev-rg"
}
variable "subnet_id" {
  type = string
}
variable "public_ip_id" {
  type = string
}
variable "fqdns_names" {
  type = list(string)
}
