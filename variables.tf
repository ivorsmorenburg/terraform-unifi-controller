# UniFi Controller Variables
variable "unifi_credentials" {
  description = "Unifi Controller Credentials & Host"
  type = object({
    username = string
    password = string
    host     = string
    insecure = bool
  })
}

# UniFi Arguments & Options
variable "unifi_site" {
  description = "UniFi Site name and Description and others..."
  type        = map(string)
}
variable "radius_profile_name" {
  description = "LookUp Radius Id by Name"
  type        = string
  default     = "Default"
}
# UniFi Arguments & Options
variable "user_speed_groups" {
  description = "UniFi Site name and Description and others..."
  type = map(object({
    name              = string
    qos_rate_max_down = optional(number)
    qos_rate_max_up   = optional(number)
  }))
}

variable "network_configuration" {
  description = "Controller Networks & vLAN'S"
  type = map(object({
    network_key = optional(string)

    name                = string
    purpose             = string
    dhcp_enabled        = optional(bool)
    dhcp_lease          = optional(number)
    network_group       = optional(string)
    ipv6_interface_type = optional(string)
    subnet              = optional(string)
    domain_name         = optional(string)
    ipv6_pd_interface   = optional(string)
    wan_egress_qos      = optional(number)
    vlan_id             = optional(number)
    dhcp_start          = optional(string)
    dhcp_stop           = optional(string)
    dhcp_dns            = optional(set(string))
    dhcpd_boot_enabled  = optional(bool)
    dhcpd_boot_filename = optional(string)
    dhcpd_boot_server   = optional(string)
    igmp_snooping       = optional(bool)
    ipv6_pd_interface   = optional(string)
    ipv6_pd_prefixid    = optional(string)
    ipv6_ra_enable      = optional(bool)
    ipv6_static_subnet  = optional(string)
    wan_dns             = optional(set(string))
    wan_gateway         = optional(string)
    wan_ip              = optional(string)
    wan_netmask         = optional(string)
    wan_networkgroup    = optional(string)
    wan_type            = optional(string)
    wan_username        = optional(string)
    x_wan_password      = optional(string)
  }))
}
variable "unifi_client" {
  description = "UniFi Client"
  type = map(object({
    mac                    = optional(string)
    name                   = optional(string)
    allow_existing         = optional(string)
    blocked                = optional(string)
    dev_id_override        = optional(string)
    fixed_ip               = optional(string)
    network_id             = optional(string)
    note                   = optional(string)
    site                   = optional(string)
    skip_forget_on_destroy = optional(string)
    user_group_id          = optional(string)
  }))
}
variable "wlan_configuration" {
  description = "Controller WiFi"
  type = map(object({
    network_key = optional(string)

    ssid                      = string
    security                  = string
    user_group_id             = string
    l2_isolation              = optional(bool)
    minimum_data_rate_2g_kbps = optional(number)
    minimum_data_rate_5g_kbps = optional(number)
    passphrase                = optional(string)
    ap_group_ids              = optional(list(string))
    hide_ssid                 = optional(bool)
    is_guest                  = optional(bool)
    mac_filter_enabled        = optional(bool)
    mac_filter_list           = optional(list(string))
    mac_filter_policy         = optional(string)
    multicast_enhance         = optional(bool)
    network_id                = optional(string)
    no2ghz_oui                = bool
    radius_profile_id         = optional(string)
    schedule                  = optional(string)
    site                      = optional(string)
    wlan_band                 = optional(string)
  }))
}

variable "ubnt_devices" {
  description = "UniFi Devices"
  type = map(object({
    device = object({
      name = string
      mac  = string
      ports_override = optional(map(object({
        name            = string
        port_number     = number
        port_profile_id = string
      })))
    })
  }))
}

variable "firewall_groups" {
  description = "UniFi Firewall Groups"
  type = map(object({
    name    = string
    type    = string
    members = list(string)
  }))
}

variable "firewall_rules" {
  description = "UniFi Firewall Rules"
  type = map(object({
    name                   = string
    action                 = string
    ruleset                = string
    rule_index             = number
    protocol               = string
    dst_address            = optional(string)
    dst_firewall_group_ids = optional(list(string))
    dst_network_id         = optional(string)
    dst_network_type       = optional(string)
    dst_port               = optional(string)
    icmp_typename          = optional(string)
    ip_sec                 = optional(string)
    logging                = optional(bool)
    site                   = optional(string)
    src_address            = optional(string)
    src_firewall_group_ids = optional(list(string))
    src_mac                = optional(string)
    src_network_id         = optional(string)
    src_network_type       = optional(string)
    state_established      = optional(bool)
    state_invalid          = optional(bool)
    state_new              = optional(bool)
    state_related          = optional(bool)
  }))
}

variable "port_profiles" {
  description = "Switch Port Profiles"
  type = map(object({

    name = string

    autoneg                        = optional(string)
    dot1x_ctrl                     = optional(string)
    dot1x_idle_timeout             = optional(number)
    egress_rate_limit_kbps_enabled = optional(bool)
    isolation                      = optional(string)
    native_networkconf_id          = optional(string)
    lldpmed_enabled                = optional(bool)
    full_duplex                    = optional(bool)
    op_mode                        = optional(string)
    poe_mode                       = optional(string)
    port_security_enabled          = optional(bool)
    forward                        = optional(string)
    stormctrl_bcast_enabled        = optional(bool)
    stormctrl_mcast_enabled        = optional(bool)
    stormctrl_ucast_enabled        = optional(bool)
    stp_port_mode                  = optional(bool)
    egress_rate_limit_kbps         = optional(number)
    lldpmed_notify_enabled         = optional(bool)
    port_security_mac_address      = optional(list(string))
    priority_queue1_level          = optional(number)
    priority_queue2_level          = optional(number)
    priority_queue3_level          = optional(number)
    priority_queue4_level          = optional(number)
    speed                          = optional(number)
    stormctrl_bcast_level          = optional(number)
    stormctrl_bcast_rate           = optional(number)
    stormctrl_mcast_level          = optional(number)
    stormctrl_mcast_rate           = optional(number)
    stormctrl_ucast_level          = optional(number)
    stormctrl_ucast_rate           = optional(number)
    tagged_networkconf_ids         = optional(list(string))
  }))
}

variable "port_forwards" {
  description = "UniFi Port fowarding"
  type = map(object({
    name                   = string
    dst_port               = optional(string)
    enabled                = optional(bool)
    fwd_ip                 = optional(string)
    fwd_port               = optional(string)
    log                    = optional(bool)
    port_forward_interface = optional(string)
    protocol               = optional(string)
    site                   = optional(string)
    src_ip                 = optional(string)
  }))
}
