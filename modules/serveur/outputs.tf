
output "private_ip" {
  description = "List of ipv4 addresses of the created servers"
  value       = flexibleengine_compute_instance_v2.instances.*.access_ip_v4
}

output "public_ip" {
  description = "List of public floating ip addresses of the created servers"
  value       = flexibleengine_compute_floatingip_associate_v2.instances-fip.*.floating_ip
}


output "id" {
  description = "list of IDs of the created servers"
  value       = flexibleengine_compute_instance_v2.instances.*.id
}

output "name" {
  description = "list of names of the created servers"
  value       = flexibleengine_compute_instance_v2.instances.*.name
}

output "sg_id" {
  description = "list of id of the created security groups"
  value       = flexibleengine_networking_secgroup_v2.sg-instances.id
}