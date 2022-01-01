## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_unifi"></a> [unifi](#requirement\_unifi) | >=0.34.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_unifi"></a> [unifi](#provider\_unifi) | >=0.34.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [unifi_device.ubn_network_device](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/resources/device) | resource |
| [unifi_firewall_group.fw_group](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/resources/firewall_group) | resource |
| [unifi_firewall_rule.rule](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/resources/firewall_rule) | resource |
| [unifi_network.network_configuration](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/resources/network) | resource |
| [unifi_port_forward.forward](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/resources/port_forward) | resource |
| [unifi_port_profile.profile](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/resources/port_profile) | resource |
| [unifi_user.client](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/resources/user) | resource |
| [unifi_user_group.speed_group](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/resources/user_group) | resource |
| [unifi_wlan.wlan_configuration](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/resources/wlan) | resource |
| [unifi_ap_group.default](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/data-sources/ap_group) | data source |
| [unifi_port_profile.all](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/data-sources/port_profile) | data source |
| [unifi_port_profile.disabled](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/data-sources/port_profile) | data source |
| [unifi_radius_profile.default](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/data-sources/radius_profile) | data source |
| [unifi_user_group.default](https://registry.terraform.io/providers/paultyng/unifi/latest/docs/data-sources/user_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_groups"></a> [firewall\_groups](#input\_firewall\_groups) | UniFi Firewall Groups | <pre>map(object({<br>    name    = string<br>    type    = string<br>    members = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | UniFi Firewall Rules | <pre>map(object({<br>    name                   = string<br>    action                 = string<br>    ruleset                = string<br>    rule_index             = number<br>    protocol               = string<br>    dst_address            = optional(string)<br>    dst_firewall_group_ids = optional(list(string))<br>    dst_network_id         = optional(string)<br>    dst_network_type       = optional(string)<br>    dst_port               = optional(string)<br>    icmp_typename          = optional(string)<br>    ip_sec                 = optional(string)<br>    logging                = optional(bool)<br>    site                   = optional(string)<br>    src_address            = optional(string)<br>    src_firewall_group_ids = optional(list(string))<br>    src_mac                = optional(string)<br>    src_network_id         = optional(string)<br>    src_network_type       = optional(string)<br>    state_established      = optional(bool)<br>    state_invalid          = optional(bool)<br>    state_new              = optional(bool)<br>    state_related          = optional(bool)<br>  }))</pre> | n/a | yes |
| <a name="input_network_configuration"></a> [network\_configuration](#input\_network\_configuration) | Controller Networks & vLAN'S | <pre>map(object({<br>    network_key = optional(string)<br><br>    name                = string<br>    purpose             = string<br>    dhcp_enabled        = optional(bool)<br>    dhcp_lease          = optional(number)<br>    network_group       = optional(string)<br>    ipv6_interface_type = optional(string)<br>    subnet              = optional(string)<br>    domain_name         = optional(string)<br>    ipv6_pd_interface   = optional(string)<br>    wan_egress_qos      = optional(number)<br>    vlan_id             = optional(number)<br>    dhcp_start          = optional(string)<br>    dhcp_stop           = optional(string)<br>    dhcp_dns            = optional(set(string))<br>  }))</pre> | n/a | yes |
| <a name="input_port_forwards"></a> [port\_forwards](#input\_port\_forwards) | UniFi Port fowarding | <pre>map(object({<br>    name                   = string<br>    dst_port               = optional(string)<br>    enabled                = optional(bool)<br>    fwd_ip                 = optional(string)<br>    fwd_port               = optional(string)<br>    log                    = optional(bool)<br>    port_forward_interface = optional(string)<br>    protocol               = optional(string)<br>    site                   = optional(string)<br>    src_ip                 = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_port_profiles"></a> [port\_profiles](#input\_port\_profiles) | Switch Port Profiles | <pre>map(object({<br><br>    name = string<br><br>    autoneg                        = optional(string)<br>    dot1x_ctrl                     = optional(string)<br>    dot1x_idle_timeout             = optional(number)<br>    egress_rate_limit_kbps_enabled = optional(bool)<br>    isolation                      = optional(string)<br>    native_networkconf_id          = optional(string)<br>    lldpmed_enabled                = optional(bool)<br>    full_duplex                    = optional(bool)<br>    op_mode                        = optional(string)<br>    poe_mode                       = optional(string)<br>    port_security_enabled          = optional(bool)<br>    forward                        = optional(string)<br>    stormctrl_bcast_enabled        = optional(bool)<br>    stormctrl_mcast_enabled        = optional(bool)<br>    stormctrl_ucast_enabled        = optional(bool)<br>    stp_port_mode                  = optional(bool)<br>    egress_rate_limit_kbps         = optional(number)<br>    lldpmed_notify_enabled         = optional(bool)<br>    port_security_mac_address      = optional(list(string))<br>    priority_queue1_level          = optional(number)<br>    priority_queue2_level          = optional(number)<br>    priority_queue3_level          = optional(number)<br>    priority_queue4_level          = optional(number)<br>    speed                          = optional(number)<br>    stormctrl_bcast_level          = optional(number)<br>    stormctrl_bcast_rate           = optional(number)<br>    stormctrl_mcast_level          = optional(number)<br>    stormctrl_mcast_rate           = optional(number)<br>    stormctrl_ucast_level          = optional(number)<br>    stormctrl_ucast_rate           = optional(number)<br>    tagged_networkconf_ids         = optional(list(string))<br>  }))</pre> | n/a | yes |
| <a name="input_ubnt_devices"></a> [ubnt\_devices](#input\_ubnt\_devices) | UniFi Devices | <pre>map(object({<br>    device = object({<br>      name = string<br>      mac  = string<br>      ports_override = optional(map(object({<br>        name            = string<br>        port_number     = number<br>        port_profile_id = string<br>      })))<br>    })<br>  }))</pre> | n/a | yes |
| <a name="input_unifi_credentials"></a> [unifi\_credentials](#input\_unifi\_credentials) | Unifi Controller Credentials & Host | <pre>object({<br>    username = string<br>    password = string<br>    host     = string<br>    insecure = bool<br>  })</pre> | n/a | yes |
| <a name="input_unifi_site"></a> [unifi\_site](#input\_unifi\_site) | UniFi Site name and Description and others... | `map(string)` | n/a | yes |
| <a name="input_user_speed_groups"></a> [user\_speed\_groups](#input\_user\_speed\_groups) | UniFi Site name and Description and others... | <pre>map(object({<br>    name              = string<br>    qos_rate_max_down = optional(number)<br>    qos_rate_max_up   = optional(number)<br>  }))</pre> | n/a | yes |
| <a name="input_wlan_configuration"></a> [wlan\_configuration](#input\_wlan\_configuration) | Controller WiFi | <pre>map(object({<br>    network_key = optional(string)<br><br>    ssid               = string<br>    security           = string<br>    user_group_id      = string<br>    passphrase         = optional(string)<br>    ap_group_ids       = optional(list(string))<br>    hide_ssid          = optional(bool)<br>    is_guest           = optional(bool)<br>    mac_filter_enabled = optional(bool)<br>    mac_filter_list    = optional(list(string))<br>    mac_filter_policy  = optional(string)<br>    multicast_enhance  = optional(bool)<br>    network_id         = optional(string)<br>    no2ghz_oui         = bool<br>    radius_profile_id  = optional(string)<br>    schedule           = optional(string)<br>    site               = optional(string)<br>    wlan_band          = optional(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_user_speed_group"></a> [default\_user\_speed\_group](#output\_default\_user\_speed\_group) | Default Speed WiFi Group |
| <a name="output_firewall_groups"></a> [firewall\_groups](#output\_firewall\_groups) | Map of UniFi FW Groups firewall\_groups['key'] |
| <a name="output_firewall_rules"></a> [firewall\_rules](#output\_firewall\_rules) | Map of UniFi FW Groups firewall\_groups['key'] |
| <a name="output_fowarding_ports"></a> [fowarding\_ports](#output\_fowarding\_ports) | Fowarding ports port\_fowards['key'] |
| <a name="output_port_profiles"></a> [port\_profiles](#output\_port\_profiles) | Map of UniFi SW Profiles |
| <a name="output_speed_groups"></a> [speed\_groups](#output\_speed\_groups) | Map of UniFi Networks network\_configuration['key'] |
| <a name="output_unifi_all_port_profile"></a> [unifi\_all\_port\_profile](#output\_unifi\_all\_port\_profile) | Default All Networks profile |
| <a name="output_unifi_ap_group_default"></a> [unifi\_ap\_group\_default](#output\_unifi\_ap\_group\_default) | AP Default Group |
| <a name="output_unifi_disabled_port_profile"></a> [unifi\_disabled\_port\_profile](#output\_unifi\_disabled\_port\_profile) | Look-Up the built-in disabled port profile |
| <a name="output_unifi_networks"></a> [unifi\_networks](#output\_unifi\_networks) | Map of UniFi Networks network\_configuration['key'] |
