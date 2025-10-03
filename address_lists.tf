resource "katapult_address_list" "krystal" {
  name = "Krystal VPN"
}

resource "katapult_address_list" "zabbix" {
  name = "Monitoring"
}

resource "katapult_address_list_entry" "krystal" {
  for_each = {
    for key, value in var.krystal_vpns : value.name => value
  }

  address_list_id = katapult_address_list.krystal.id
  address         = each.value.address
  name            = each.value.name
}

resource "katapult_address_list_entry" "zabbix" {
  for_each = {
    for key, value in var.zabbix_ips : value.name => value
  }

  address_list_id = katapult_address_list.zabbix.id
  address         = each.value.address
  name            = each.value.name
}