variable "location" {
  default = "westeurope"
}
variable "rg_name" {
  default = "acme-we-dev-rg"
}
variable "tags" {
  type    = map(string)
  default = {}
}
