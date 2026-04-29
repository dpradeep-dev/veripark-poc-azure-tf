terraform {
  backend "azurerm" {   
    resource_group_name = "acme-poc-vp-tfstate"
    storage_account_name = "acmevptfstate"
    container_name = "acme-we-dev-tfstate"
    key = "dev.terraform.tfstate"
  }
}
