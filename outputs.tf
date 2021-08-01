output "unifi_all_port_profile" {
  value       = data.unifi_port_profile.all
  description = "Default All Networks profile"
}
output "unifi_disabled_port_profile" {
  value       = data.unifi_port_profile.disabled
  description = "Look-Up the built-in disabled port profile"
}

output "unifi_networks" {
  value       = unifi_network.network_configuration
  description = "Map of UniFi Networks network_configuration['key']"
}

output "port_profiles" {
  value       = unifi_port_profile.profile
  description = "Map of UniFi SW Profiles"
}

output "speed_groups" {
  value       = unifi_user_group.speed_group
  description = "Map of UniFi Networks network_configuration['key']"
}

output "default_user_speed_group" {
  value       = data.unifi_user_group.default.id
  description = "Default Speed WiFi Group"
}

output "firewall_groups" {
  value       = unifi_firewall_group.fw_group
  description = "Map of UniFi FW Groups firewall_groups['key']"
}

output "firewall_rules" {
  value       = unifi_firewall_rule.rule
  description = "Map of UniFi FW Groups firewall_groups['key']"
}
output "unifi_ap_group_default" {
  value       = data.unifi_ap_group.default.id
  description = "AP Default Group"
}

output "fowarding_ports" {
  value       = unifi_port_forward.forward
  description = "Fowarding ports port_fowards['key']"
}
