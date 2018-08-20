data "azurerm_key_vault" "vault" {
  name                    = "core-vault"
  resource_group_name     = "${var.resource_group_name}"
}

data "azurerm_key_vault_secret" "vm-subnet-id" {
  name        = "core-subnet-id"
  vault_uri   = "${data.azurerm_key_vault.vault.vault_uri}"
}

data "azurerm_key_vault_secret" "nsg-id" {
  name        = "core-nsg-id"
  vault_uri   = "${data.azurerm_key_vault.vault.vault_uri}"
}