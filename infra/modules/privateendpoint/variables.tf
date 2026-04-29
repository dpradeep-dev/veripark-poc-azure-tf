variable "pe_name" {
  type = string
  default = "acme-we-dev-app"
}
variable "location" {
  type = string
  default = "westeurope"
}
variable "rg_name" {
  type = string
  default = "acme-we-dev-rg"
}
variable "resource_id" {
  type = string
}
variable "subresource_names" {
  type = list(string)
}
variable "private_dns_zone_id" {
  type = string
}
variable "subnet_id" {
  type = string
}
