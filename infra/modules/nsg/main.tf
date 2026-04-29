resource "azurerm_network_security_group" "web_nsg" {
  name                = var.web_nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_group" "mw_nsg" {
  name                = var.mw_nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_group" "pe_nsg" {
  name                = var.pe_nsg_name
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_security_rule" "deny_web_to_pe" {
  name                        = "Deny-Web-To-PE"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_address_prefix       = var.web_cidr
  destination_address_prefix  = var.pe_cidr
  destination_port_range      = "*"
  source_port_range           = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

resource "azurerm_network_security_rule" "mw_to_pe" {
  name                        = "Allow-MW-To-PE"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = var.mw_cidr
  destination_address_prefix  = var.pe_cidr
  destination_port_range      = "1433"
  source_port_range           = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.mw_nsg.name
}

resource "azurerm_network_security_rule" "allow_mw_inbound" {
  name                        = "Allow-MW-To-PE"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = var.mw_cidr
  destination_address_prefix  = var.pe_cidr
  destination_port_range      = "1433"
  source_port_range           = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.pe_nsg.name
}

resource "azurerm_network_security_rule" "deny_all" {
  name                        = "Deny-All"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.pe_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "web_assoc" {
  subnet_id                 = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "mw_assoc" {
  subnet_id                 = var.mw_subnet_id
  network_security_group_id = azurerm_network_security_group.mw_nsg.id
}

resource "azurerm_subnet_network_security_group_association" "pe_assoc" {
  subnet_id                 = var.pe_subnet_id
  network_security_group_id = azurerm_network_security_group.pe_nsg.id
}
