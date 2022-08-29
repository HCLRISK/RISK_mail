output "serveur_private_ip" {
  description = "List of ipv4 addresses of the created servers"
  value       = module.module-serveur.private_ip
}

output "serveur_public_ip" {
  description = "List of public floating ip addresses of the created servers"
  value       = module.module-serveur.public_ip
}

output "serveur_instance_id" {
  description = "list of IDs of the created servers"
  value       = module.module-serveur.id
}

output "serveur_instance_name" {
  description = "list of names of the created servers"
  value       = module.module-serveur.name
}

output "serveur_sg_id" {
  description = "list of security groups id"
  value       = module.module-serveur.sg_id
}


output "net_vpc_id" {
  description = "ID of the created vpc"
  value       = module.module-network.vpc_id
}

output "net_vpc_name" {
  description = "Name of the created vpc"
  value       = module.module-network.vpc_name
}

output "net_subnet_ids" {
  description = "list of IDs of the created subnets"
  value       = module.module-network.subnet_ids
}

output "net_gateway_id" {
  description = "id of NAT gateway"
  value       = module.module-network.gateway_id
}

output "net_network_ids" {
  description = "list of IDs of the created networks"
  value       = module.module-network.network_ids
}

output "net_snat_eip" {
  description = "The Public IP adress of the SNAT rule"
  value       = module.module-network.snat_eip
}



