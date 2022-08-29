# Client & contexte
variable "client" {
    description = "Nom du client"
    type = string
}

variable "contexte" {
    description = "contexte du deploiment"
    type = string
}

variable "keypair_name" {
    description = "ssh keypair name"
    type = string
}

variable "keypair_key" {
    description = "ssh keypair folder location"
    type = string
}

variable "availability_zone" {
  description = "The availability zone to launch in"
  type        = string
}

variable "serveur_os_name" {
  description = "OS image name"
  type        = string
}

variable "serveur_os_region" {
  description = "Region where the OS image is"
  type        = string
}

variable "serveur_access_protocol" {
  description = "UDP or TCP protocol use to access to serveur"
  type        = string
}

variable "serveur_port_ssh" {
  description = "Open ssh port (22) on serveur"
  type        = string
}

variable "serveur_access_address" {
  description = "IP address which can join serveur instance"
  type        = string
}

variable "serveur_instance_count" {
  description = "Number of instances to launch"
  type        = number
}

variable "serveur_availability_zone" {
  description = "The availability zone to launch in"
  type        = string
}

variable "serveur_flavor_name" {
  description = "The flavor type of instance to start"
  type        = string
}

variable "serveur_new_eip" {
  description = "Whether or not create an eip these instances"
  type        = bool
}

variable "serveur_eip_bandwidth" {
  description = "Bandwidth size for eip"
  type        = string
}

variable "serveur_dns_record" {
  description = "Whether or not create a DNS record for these instances"
  type        = bool
}

variable "serveur_domain_id" {
  description = "ID of the domain if dns_record is set to true"
  type        = string
}

variable "serveur_domain_name" {
  description = "Name of the domain if dns_record is set to true"
  type        = string
}

variable "serveur_os_volume_size" {
  description = "Size of the OS volume"
  type        = number
}

variable "serveur_os_volume_delete_on_termination" {
  description = "Whether or not delete on termination OS volume"
  type        = bool
}

variable "serveur_os_volume_type" {
  description = "Type of OS volume"
  type        = string
}

variable "serveur_metadata_terraform" {
  description = "Metadata terraform"
  type        = string
}

variable "serveur_metadata_environment" {
  description = "environment metadata"
  type        = string
}

# -------- network -----------

variable "net_vpc_cidr" {
  description = "The CIDR for the VPC. Default value is a valid CIDR, but not acceptable by FlexibleEngine and should be overridden"
  type        = string
}

variable "net_subnet_cidr" {
  description = "CIDR of subnet"
  type        = string
}

variable "net_subnet_gateway_ip" {
  description = "Subnet gateway"
  type        = string
}

variable "net_subnet_prim_dns" {
  description = "Primary DNS of subnet"
  type        = string
}

variable "net_subnet_sec_dns" {
  description = "Secondary DNS of subnet"
  type        = string
}

variable "net_enable_nat_gateway" {
  description = "Whether or not create nat gateway"
  type        = bool
}

variable "net_new_eip" {
  description = "Whether or not creat new eip"
  type        = bool
}

variable "net_eip_bandwidth" {
  description = "Bandwidth allowed for eip"
  type        = number
}

variable "net_nat_gateway_type" {
  description = "Gateway type"
  type        = string
}