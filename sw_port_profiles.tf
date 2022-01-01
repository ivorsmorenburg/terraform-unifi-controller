resource "unifi_port_profile" "profile" {
  for_each = {
    for key, value in var.port_profiles : key => value
  }

  autoneg                        = try(each.value.autoneg, true)
  dot1x_ctrl                     = try(each.value.dot1x_ctrl, "force_authorized")
  dot1x_idle_timeout             = each.value.dot1x_idle_timeout
  egress_rate_limit_kbps_enabled = each.value.egress_rate_limit_kbps_enabled
  isolation                      = each.value.isolation
  native_networkconf_id          = each.value.native_networkconf_id
  lldpmed_enabled                = each.value.lldpmed_enabled
  full_duplex                    = each.value.full_duplex
  name                           = each.value.name
  op_mode                        = each.value.op_mode
  poe_mode                       = each.value.poe_mode
  port_security_enabled          = each.value.port_security_enabled
  forward                        = each.value.forward
  stormctrl_bcast_enabled        = each.value.stormctrl_bcast_enabled
  stormctrl_mcast_enabled        = each.value.stormctrl_mcast_enabled
  stormctrl_ucast_enabled        = each.value.stormctrl_ucast_enabled
  stp_port_mode                  = each.value.stp_port_mode
  egress_rate_limit_kbps         = each.value.egress_rate_limit_kbps
  lldpmed_notify_enabled         = each.value.lldpmed_notify_enabled
  port_security_mac_address      = each.value.port_security_mac_address
  priority_queue1_level          = each.value.priority_queue1_level
  priority_queue2_level          = each.value.priority_queue2_level
  priority_queue3_level          = each.value.priority_queue3_level
  priority_queue4_level          = each.value.priority_queue4_level
  speed                          = each.value.speed
  stormctrl_bcast_level          = each.value.stormctrl_bcast_level
  stormctrl_bcast_rate           = each.value.stormctrl_bcast_rate
  stormctrl_mcast_level          = each.value.stormctrl_mcast_level
  stormctrl_mcast_rate           = each.value.stormctrl_mcast_rate
  stormctrl_ucast_level          = each.value.stormctrl_ucast_level
  stormctrl_ucast_rate           = each.value.stormctrl_ucast_rate
  tagged_networkconf_ids         = each.value.tagged_networkconf_ids
}
