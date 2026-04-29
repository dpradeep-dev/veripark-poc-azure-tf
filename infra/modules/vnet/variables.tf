variable "vnet_name" {
  default = "acme-we-dev-vnet"
}
variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}
variable "location" {
  default = "westeurope"
}
variable "rg_name" {
  default = "acme-we-dev-rg"
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
