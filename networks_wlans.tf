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
  dhcpd_boot_enabled  = each.value.dhcpd_boot_enabled
  dhcpd_boot_filename = each.value.dhcpd_boot_filename
  dhcpd_boot_server   = each.value.dhcpd_boot_server
  igmp_snooping       = each.value.igmp_snooping
  ipv6_pd_interface   = each.value.ipv6_pd_interface
  ipv6_pd_prefixid    = each.value.ipv6_pd_prefixid
  ipv6_ra_enable      = each.value.ipv6_ra_enable
  ipv6_static_subnet  = each.value.ipv6_static_subnet
  wan_dns             = each.value.wan_dns
  wan_gateway         = try(each.value.wan_gateway, "0.0.0.0")
  wan_ip              = each.value.wan_ip
  wan_netmask         = each.value.wan_netmask
  wan_networkgroup    = each.value.wan_networkgroup
  wan_type            = each.value.wan_type
  wan_username        = each.value.wan_username
  x_wan_password      = each.value.x_wan_password

  domain_name = each.value.domain_name
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

  ap_group_ids              = try(each.value.ap_group_ids, [data.unifi_ap_group.default.id])
  hide_ssid                 = each.value.hide_ssid
  is_guest                  = each.value.is_guest
  l2_isolation              = try(each.value.l2_isolation, false)
  mac_filter_enabled        = each.value.mac_filter_enabled
  mac_filter_list           = each.value.mac_filter_list
  mac_filter_policy         = each.value.mac_filter_policy
  minimum_data_rate_2g_kbps = each.value.minimum_data_rate_2g_kbps
  minimum_data_rate_5g_kbps = each.value.minimum_data_rate_5g_kbps
  multicast_enhance         = each.value.multicast_enhance
  network_id                = each.value.network_id
  no2ghz_oui                = each.value.no2ghz_oui
  radius_profile_id         = each.value.radius_profile_id
  /* schedule           = each.value.schedule */
  site      = each.value.site
  wlan_band = try(each.value.wlan_bands, "both")
  # enable WPA2/WPA3 support
  wpa3_support    = try(each.value.wpa3_support, true)
  wpa3_transition = try(each.value.wpa3_transition, true)
  pmf_mode        = try(each.value.pmf_mode, "optional")

  uapsd = try(each.value.uapsd, false)

  user_group_id = each.value.user_group_id
}
