resource "unifi_user_group" "speed_group" {
  for_each = {
    for key, value in var.user_speed_groups : key => value
    if value.name != null
  }

  name              = each.value.name
  qos_rate_max_down = try(each.value.qos_rate_max_down, -1)
  qos_rate_max_up   = try(each.value.qos_rate_max_up, -1)
}
