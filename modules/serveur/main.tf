# data "flexibleengine_vpc_subnet_v1" "networks" {
#   count = var.network_id != null ? 1 : 0
#   name  = var.network_name
# }



resource "flexibleengine_compute_instance_v2" "instances" {
  availability_zone = var.availability_zone
  count             = var.instance_count
  name              = var.instance_count > 1 ? format("%s-%d", var.instance_name, count.index + 1) : var.instance_name
  flavor_name       = var.flavor_name
  key_pair          = var.key_name
  user_data         = var.user_data
  security_groups = [flexibleengine_networking_secgroup_v2.sg-instances.name]

  network {
    uuid = var.network_id.0
  }


  dynamic "block_device" {
    for_each = var.block_devices
    content {
      uuid                  = block_device.value.uuid != "" ? block_device.value.uuid : null
      source_type           = block_device.value.source_type      # image/volume/snapshot/blank(ephemeral)
      destination_type      = block_device.value.destination_type # volume/local(epheremal)/blank
      volume_size           = block_device.value.volume_size
      volume_type           = block_device.value.volume_type
      boot_index            = block_device.value.boot_index #-1 : local/0: Boot disk/1: Data disk
      delete_on_termination = block_device.value.delete_on_termination ? block_device.value.delete_on_termination : null
    }
  }


  metadata = merge(
    var.metadata,
    {
      "Name" = var.instance_count > 1 ? format("%s-%d", var.instance_name, count.index + 1) : var.instance_name
    },
  )
}


resource "flexibleengine_vpc_eip_v1" "instances_new_eip" {
  count = var.new_eip == true ? var.instance_count : 0
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = var.instance_count > 1 ? format("%s-%d", "bandwidth-${var.instance_name}", count.index + 1) : "bandwidth-${var.instance_name}"
    size        = var.eip_bandwidth
    share_type  = "PER"
    charge_mode = "traffic"
  }
  depends_on = [flexibleengine_compute_instance_v2.instances]
}


resource "flexibleengine_compute_floatingip_associate_v2" "instances-fip" {
  count           = var.new_eip == true ? var.instance_count : 0
  floating_ip = flexibleengine_vpc_eip_v1.instances_new_eip[count.index].publicip[count.index].ip_address
  instance_id = flexibleengine_compute_instance_v2.instances[count.index].id
}

resource "flexibleengine_dns_recordset_v2" "recordset" {
  count       = var.dns_record ? var.instance_count : 0
  zone_id     = var.domain_id
  name        = "${var.instance_count > 1 ? format("%s-%d", var.instance_name, count.index + 1) : var.instance_name}.${var.domain_name}."
  description = "DNS record for instance ${var.instance_count > 1 ? format("%s-%d", var.instance_name, count.index + 1) : var.instance_name}"
  ttl         = var.record_ttl
  type        = "A"
  records     = [flexibleengine_compute_instance_v2.instances[count.index].access_ip_v4]
}