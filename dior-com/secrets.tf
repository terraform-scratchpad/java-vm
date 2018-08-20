
resource "azurerm_key_vault_secret" "store-vm-admin-username" {
  name        = "${terraform.workspace}--username"
  value       = "${module.vm.vm-admin-username}"
  vault_uri   = "${data.azurerm_key_vault.vault.vault_uri}"
}

resource "azurerm_key_vault_secret" "store-vm-admin-password" {
  name        = "${terraform.workspace}--password"
  value       = "${module.vm.vm-admin-password}"
  vault_uri   = "${data.azurerm_key_vault.vault.vault_uri}"
}

resource "azurerm_key_vault_secret" "mysql-server-host" {
  name        = "${terraform.workspace}--mysql-server-host"
  value       = "$(module.mysql-instance.mysql-server-host}"
  vault_uri   = "${data.azurerm_key_vault.vault.vault_uri}"
}

resource "azurerm_key_vault_secret" "mysql-db-user" {
  name        = "${terraform.workspace}--mysql-db-user"
  value       = "$(module.mysql-instance.mysql-user}"
  vault_uri   = "${data.azurerm_key_vault.vault.vault_uri}"
}

resource "azurerm_key_vault_secret" "mysql-db-password" {
  name        = "${terraform.workspace}--mysql-db-password"
  value       = "$(module.mysql-instance.mysql-password}"
  vault_uri   = "${data.azurerm_key_vault.vault.vault_uri}"
}

resource "azurerm_key_vault_secret" "mysql-db-name" {
  name        = "${terraform.workspace}--mysql-db-name"
  value       = "$(module.mysql-instance.db-name}"
  vault_uri   = "${data.azurerm_key_vault.vault.vault_uri}"
}