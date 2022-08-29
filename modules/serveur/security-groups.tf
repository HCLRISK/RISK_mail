resource "flexibleengine_networking_secgroup_v2" "sg-instances" {
  name        = var.sg_name
  
}

resource "flexibleengine_networking_secgroup_rule_v2" "sg-rule-instances-ip1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = var.access_protocol
  port_range_min    = var.port_ssh
  port_range_max    = var.port_ssh
  remote_ip_prefix  = var.access_address
  security_group_id = flexibleengine_networking_secgroup_v2.sg-instances.id
} 
