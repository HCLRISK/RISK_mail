module "module-serveur" {
  source = "../modules/serveur"

  access_protocol  = var.serveur_access_protocol
  port_ssh         = var.serveur_port_ssh
  access_address   = var.serveur_access_address
  sg_name          = "sg-${var.client}-${var.contexte}-serveur"

  instance_name    = "ecs-${var.client}-${var.contexte}-serveur"
  instance_count   = var.serveur_instance_count
  availability_zone = var.serveur_availability_zone

  flavor_name        = var.serveur_flavor_name
  key_name           = var.keypair_name
  security_groups    = ["sg-${var.client}-${var.contexte}-serveur"]
  subnet_id          = module.module-network.subnet_ids
  network_id         = module.module-network.network_ids

  new_eip = var.serveur_new_eip
  eip_bandwidth = var.serveur_eip_bandwidth


  dns_record  = var.serveur_dns_record
  domain_id   = var.serveur_domain_id
  domain_name = var.serveur_domain_name

  block_devices = [
    {
      uuid = "c2280a5f-159f-4489-a107-7cf0c7efdb21"
      source_type = "image"
      destination_type = "volume"
      volume_size = var.serveur_os_volume_size
      boot_index = 0
      delete_on_termination = var.serveur_os_volume_delete_on_termination
      volume_type = var.serveur_os_volume_type
    }
  ]

  metadata = {
    Terraform = var.serveur_metadata_terraform
    Environment = var.serveur_metadata_environment
  }
}
