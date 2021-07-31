
resource "unifi_port_forward" "forward" {
  for_each = var.port_forwards

  name                   = each.value.name
  dst_port               = each.value.dst_port
  enabled                = true # Deprecated but needed
  fwd_ip                 = each.value.fwd_ip
  fwd_port               = each.value.fwd_port
  log                    = each.value.log
  port_forward_interface = each.value.port_forward_interface
  protocol               = each.value.protocol
  site                   = each.value.site
  src_ip                 = each.value.src_ip
}
