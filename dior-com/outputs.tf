#
# MySQL outputs
#


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