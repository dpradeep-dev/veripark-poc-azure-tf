variable "app_name" {
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
variable "public_network_access_enabled" {
  type = bool
  default = false
}
