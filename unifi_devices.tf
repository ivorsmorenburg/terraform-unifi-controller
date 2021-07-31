resource "unifi_device" "ubn_network_device" {
  for_each = {
    for key, value in var.ubnt_devices : key => value
  }

  mac  = each.value.device.mac
  name = each.value.device.name

  lifecycle {
    create_before_destroy = true
  }

  dynamic "port_override" {
    for_each = {
      for key, port_conf in each.value.device.ports_override != null ? each.value.device.ports_override : {} : key => port_conf
    }
    content {
      number          = port_override.value["port_number"]
      name            = port_override.value["name"]
      port_profile_id = port_override.value["port_profile_id"]
    }
  }
}
