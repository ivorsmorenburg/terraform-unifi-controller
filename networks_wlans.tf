resource "unifi_network" "network_configuration" {
  for_each = var.network_configuration

  name                = each.value.name
  purpose             = each.value.purpose
  dhcp_enabled        = each.value.dhcp_enabled
  dhcp_lease          = each.value.dhcp_lease
  ipv6_interface_type = each.value.ipv6_interface_type
  network_group       = each.value.network_group
  subnet              = each.value.subnet
  wan_egress_qos      = each.value.wan_egress_qos
  vlan_id             = each.value.vlan_id
  dhcp_start          = each.value.dhcp_start
  dhcp_stop           = each.value.dhcp_stop


  domain_name       = each.value.domain_name
  /* ipv6_pd_interface = each.value.ipv6_pd_interface */

  dhcp_dns = try(each.value.dhcp_dns, [])
}

resource "unifi_wlan" "wlan_configuration" {
  for_each = {
    for key, value in var.wlan_configuration : key => value
    if value.ssid != null
  }

  name       = each.value.ssid
  passphrase = each.value.passphrase
  security   = each.value.security

  ap_group_ids       = try(each.value.ap_group_ids, [data.unifi_ap_group.default.id])
  hide_ssid          = each.value.hide_ssid
  is_guest           = each.value.is_guest
  mac_filter_enabled = each.value.mac_filter_enabled
  mac_filter_list    = each.value.mac_filter_list
  mac_filter_policy  = each.value.mac_filter_policy
  multicast_enhance  = each.value.multicast_enhance
  network_id         = each.value.network_id
  no2ghz_oui         = each.value.no2ghz_oui
  radius_profile_id  = each.value.radius_profile_id
  /* schedule           = each.value.schedule */
  site               = each.value.site
  wlan_band          = try(each.value.wlan_bands, "both")
 
  user_group_id =  each.value.user_group_id
}
