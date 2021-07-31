locals {
  userscsv = csvdecode(file("${path.cwd}/unifi_users.csv"))
  users    = { for user in local.userscsv : user.mac => user }
}

resource "unifi_user" "client" {
  for_each = local.users

  mac  = each.key
  name = each.value.name
  # append an optional additional note
  note = trimspace("${each.value.note}\n\n - Managed by TerraForm")

  allow_existing         = true
  skip_forget_on_destroy = true
}