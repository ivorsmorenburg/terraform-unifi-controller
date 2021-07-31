data "unifi_ap_group" "default" {
  # UniFi Default AP (All AP's)
}

data "unifi_user_group" "default" {
  # UniFi Default Speed Group (Default Unlimited D/U)
}

data "unifi_port_profile" "all" {
    # UniFi Default Profile ALL Networks
      name = "All"  
}

data "unifi_radius_profile" "default" {
    # UniFi Default Radius Profile  
      name = "Default"  
}

data "unifi_port_profile" "disabled" {
  # Look-Up the built-in disabled port profile
  name = "Disabled"
}
