variable "sg_name" {
    description = "Name of the security group apply to serveur instance"
    type = string
}

variable "access_protocol" {
    description = "UDP or TCP protocol use to access to serveur"
    type = string
}

variable "port_ssh" {
    description = "Open ssh port (22) on serveur"
    type = number
}

variable "access_address" {
    description = "IP address which can join serveur instance"
    type = string
}

variable "instance_name" {
  description = "Name of the ECS instance and the associated volume"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to launch"
  default     = 1
  type        = number
}

variable "new_eip" {
  description = "Whether or not attach new Elastic IP (public IP) to ECS"
  default     = false
  type        = bool
}


variable "eip_bandwidth" {
  description = "Bandwidth size for eip"
  type        = string
}

variable "flavor_name" {
  description = "The flavor type of instance to start"
  type        = string
}

variable "network_id" {
  description = "The network ID to launch in"
  type        = list(string)

}

variable "network_name" {
  description = "The network ID to launch in"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The subnet ID to launch in"
  type        = list(string)

}

variable "security_groups" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}

variable "key_name" {
  description = "The key pair name"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to launch where"
  type        = string
}

variable "metadata" {
  description = "A mapping of metadata to assign to the resource"
  default     = {}
  type        = map(string)
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
  type        = string
}

variable "dns_record" {
  description = "Whether or not create a DNS record for these instances"
  default     = false
  type        = bool
}

variable "domain_id" {
  description = "ID of the domain if dns_record is set to true"
  default     = ""
  type        = string
}

variable "domain_name" {
  description = "Name of the domain if dns_record is set to true"
  default     = ""
  type        = string
}

variable "record_ttl" {
  description = "TTL of the A record if dns_record is set to true"
  default     = "300"
  type        = number
}


variable "block_devices" {
  description = "List of block devices to attach/create to the ECS instance(s)"
  type = list(object({
    uuid                  = string
    source_type           = string
    destination_type      = string
    volume_size           = number
    volume_type           = string
    boot_index            = number
    delete_on_termination = bool
  }))
}



