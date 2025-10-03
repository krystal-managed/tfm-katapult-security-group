resource "katapult_security_group" "sg" {
  name               = var.name
  allow_all_outbound = length(local.rules_out) > 0 ? false : true
  associations       = var.vm_ids

  dynamic "inbound_rule" {
    for_each = var.enable_krystal ? local.krystal_rules : []
    content {
      protocol = try(inbound_rule.value.protocol, "TCP")
      ports    = try(inbound_rule.value.ports, null)
      targets  = inbound_rule.value.targets
      notes    = inbound_rule.value.notes
    }
  }
  dynamic "inbound_rule" {
    for_each = var.enable_zabbix ? local.zabbix_rules : []
    content {
      protocol = try(inbound_rule.value.protocol, "TCP")
      ports    = try(inbound_rule.value.ports, null)
      targets  = inbound_rule.value.targets
      notes    = inbound_rule.value.notes
    }
  }
  dynamic "inbound_rule" {
    for_each = var.enable_web ? local.web_rules : []
    content {
      protocol = try(inbound_rule.value.protocol, "TCP")
      ports    = try(inbound_rule.value.ports, null)
      targets  = inbound_rule.value.targets
      notes    = inbound_rule.value.notes
    }
  }
  dynamic "inbound_rule" {
    for_each = length(local.rules_in) > 0 ? local.rules_in : []
    content {
      protocol = try(inbound_rule.value.protocol, "TCP")
      ports    = try(inbound_rule.value.ports, null)
      targets  = inbound_rule.value.targets
      notes    = inbound_rule.value.notes
    }
  }

  dynamic "outbound_rule" {
    for_each = length(local.rules_out) > 0 ? local.rules_out : []
    content {
      protocol = try(outbound_rule.value.protocol, "TCP")
      ports    = try(outbound_rule.value.ports, null)
      targets  = outbound_rule.value.targets
      notes    = outbound_rule.value.notes
    }
  }
}