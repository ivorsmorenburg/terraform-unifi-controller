locals {
  userscsv = csvdecode(file("${path.cwd}/unifi_users.csv"))
  users    = { for user in local.userscsv : user.mac => user }
}

resource "unifi_user" "client" {
  for_each = local.users

  mac                    = each.key
  name                   = each.value.name
  allow_existing         = try(each.value.allow_existing,true)
  blocked                = try(each.value.blocked,false)
  dev_id_override        = try(each.value.dev_id_override,0)
  fixed_ip               = each.value.fixed_ip
  network_id             = each.value.network_id
  note                   = trimspace("${each.value.note}\n\n - Managed by TerraForm")
  site                   = try(each.value.site, "default")
  skip_forget_on_destroy = try(each.value.skip_forget_on_destroy, true)
  user_group_id          = each.value.user_group_id
}
