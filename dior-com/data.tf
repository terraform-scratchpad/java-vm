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

data "azurerm_image" "custom-image" {
  resource_group_name = "${var.resource_group_name}"
  name_regex          = "^full-ecom-\\d{4,4}-\\d{2,2}-\\d{2,2}T\\d{6,6}"
  sort_descending     = true
}