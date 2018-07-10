# --------------------------------------------------------------- #
#                                                                 #
# Creates a ready to use environment to deploy Dior.com website   #
#                                                                 #
# --------------------------------------------------------------- #

provider "azurerm" {

}

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

module "vm-01" {
  source                        = "github.com/terraform-scratchpad/azure-custom-image-compute"
  location                      = "${var.location}"
  resource_group_name           = "${var.resource_group_name}"
  custom-image-name             = "${var.custom-image-name}"
  custom-image-resource-group   = "${var.custom-image-resource-group}"
  subnet_id                     = "${data.azurerm_key_vault_secret.vm-subnet-id.value}"
}



