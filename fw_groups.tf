resource "unifi_firewall_group" "fw_group" {
  for_each = var.firewall_groups

  name = each.value.name
  type = each.value.type

  members = each.value.members
}