locals {
  krystal_rules = [
    {
      protocol = "TCP"
      ports    = "22"
      targets  = [katapult_address_list.krystal.id]
      notes    = "Krystal SSH"
    }
  ]
  zabbix_rules = [
    {
      protocol = "TCP"
      ports    = "10050,10051"
      targets  = [katapult_address_list.zabbix.id]
      notes    = "Zabbix"
    },
    {
      protocol = "ICMP"
      ports    = null
      targets  = [katapult_address_list.zabbix.id]
      notes    = "Zabbix Ping"
    }
  ]
  web_rules = [
    {
      protocol = "TCP"
      ports    = "80,443"
      targets = [
        "all:ipv4",
        "all:ipv6"
      ]
      notes = "HTTP(s)"
    }
  ]

  rules_in = [for k, v in var.rules_in : {
    protocol = try(v.protocol, "TCP")
    ports    = try(v.ports, null)
    targets  = v.targets
    notes    = v.notes
  }]
  rules_out = [for k, v in var.rules_out : {
    protocol = try(v.protocol, "TCP")
    ports    = try(v.ports, null)
    targets  = v.targets
    notes    = v.notes
  }]
}