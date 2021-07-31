resource "unifi_firewall_rule" "rule" {
  for_each = {
    for key, value in var.firewall_rules : key => value
    if value.name != null
  }

  name                   = each.value.name
  action                 = each.value.action
  ruleset                = each.value.ruleset
  rule_index             = each.value.rule_index
  protocol               = each.value.protocol
  dst_address            = each.value.dst_address
  dst_firewall_group_ids = each.value.dst_firewall_group_ids
  dst_network_id         = each.value.dst_network_id
  dst_network_type       = each.value.dst_network_type
  dst_port               = each.value.dst_port
  icmp_typename          = each.value.icmp_typename
  ip_sec                 = each.value.ip_sec
  logging                = each.value.logging
  site                   = each.value.site
  src_address            = each.value.src_address
  src_firewall_group_ids = each.value.src_firewall_group_ids
  src_mac                = each.value.src_mac
  src_network_id         = each.value.src_network_id
  src_network_type       = each.value.src_network_type
  state_established      = each.value.state_established
  state_invalid          = each.value.state_invalid
  state_new              = each.value.state_new
  state_related          = each.value.state_related
}
