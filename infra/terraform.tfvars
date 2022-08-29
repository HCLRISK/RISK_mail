client                = "RISK"
contexte              = "prod"


keypair_name          = "Lucien_key"
keypair_key           = ""
availability_zone     = "eu-west-0a"

serveur_os_name         = "OBS Ubuntu 20.04"
serveur_os_region       = "eu-west-0"
serveur_access_protocol = "tcp"
serveur_port_ssh        = "22"
serveur_access_address  = "0.0.0.0/0"
serveur_instance_count  = 1
serveur_availability_zone = "eu-west-0a"
serveur_flavor_name     = "s6.medium.4"     
serveur_dns_record      = false
serveur_domain_id       = "my-domain-id"
serveur_domain_name     = "my-domain-name"
serveur_os_volume_size  = 40
serveur_os_volume_delete_on_termination = true
serveur_os_volume_type  = "SATA" #SATA/SSD
serveur_metadata_terraform = "true"
serveur_metadata_environment = "prod"
serveur_eip_bandwidth = "5"
serveur_new_eip= "true"

#Network

net_vpc_cidr          = "192.168.0.0/16"
net_subnet_cidr       = "192.168.1.0/24"
net_subnet_gateway_ip = "192.168.1.1"
net_subnet_prim_dns   = "8.8.8.8"
net_subnet_sec_dns    = "1.1.1.1"
net_enable_nat_gateway  = true
net_new_eip           = true
net_eip_bandwidth     = 500
net_nat_gateway_type  = "1"