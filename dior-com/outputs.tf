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
  value = "${module.mysql-01.mysql-password}"
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