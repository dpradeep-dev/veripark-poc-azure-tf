variable "sql_name" {
  default = "acme-we-dev-sql"
}
variable "sql_admin" {
  default = "sqladmin"
}
variable "sql_password" {
}
variable "location" {
  default = "westeurope"
}
variable "rg_name" {
  default = "acme-we-dev-rg"
}
variable "key_vault_key_id" {
  default = "sql-key"
}
variable "key_vault_id" {
type=string
}
