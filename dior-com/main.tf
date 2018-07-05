# --------------------------------------------------------------- #
#                                                                 #
# Creates a ready to use environment to deploy Dior.com website   #
#                                                                 #
# --------------------------------------------------------------- #

# create mysql server and a database
module "mysql-01" {
  source                        = "github.com/terraform-scratchpad/azure-mysql"
  location                      = "${var.location}"
  resource_group_name           = "${var.resource_group_name}"
  tags                          = "${var.tags}"
  mysql_start_ip_address        = "172.168.0.0"
  mysql_end_ip_address          = "172.168.255.255"
}


data "azurerm_key_vault" "vault" {
  name                    = "tf-vault"
  resource_group_name     = "${var.resource_group_name}"
}

data "azurerm_key_vault_secret" "vm-subnet-id" {
  name        = "core-subnet-01-id"
  vault_uri   = "${data.azurerm_key_vault.vault.vault_uri}"
}

# TODO use mysql server outputs to build a template sorted into created VM
module "vm-01" {
  source                        = "github.com/terraform-scratchpad/azure-custom-image-compute"
  location                      = "${var.location}"
  resource_group_name           = "${var.resource_group_name}"
  custom-image-name             = "${var.custom-image-name}"
  custom-image-resource-group   = "${var.custom-image-resource-group}"
  subnet_id                     = "${data.azurerm_key_vault_secret.vm-subnet-id.value}"
}


#
# VM Outputs
#
output "vm-public-ip" {
  value = "${module.vm-01.vm-public-ip}"
}

output "vm-admin-username" {
  value = "${module.vm-01.vm-admin-username}"
}

output "vm-admin-password" {
  value = "${module.vm-01.vm-admin-password}"
}


#
# MySQL outputs
#
output "mysql-host" {
  value = "${module.mysql-01.mysql-server-host}"
}

output "mysql-db-name" {
  value = "${module.mysql-01.db-name}"
}

output "mysql-db-user" {
  value = "${module.mysql-01.mysql-user}"
}

output "mysql-db-password" {
  sensitive = true
  value = "${module.mysql-01.mysql-password}"
}