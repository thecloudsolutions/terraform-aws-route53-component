module "zone" {
  source = "../resources/zone"

  count = var.zone != null ? 1 : 0

  name                        = var.zone.name
  comment                     = lookup(var.zone, "comment", null)
  delegation_set_id           = lookup(var.zone, "delegation_set_id", null)
  enable_accelerated_recovery = lookup(var.zone, "enable_accelerated_recovery", null)
  force_destroy               = lookup(var.zone, "force_destroy", null)
  vpc                         = lookup(var.zone, "vpc", null)

  tags = lookup(var.zone, "tags", null)
}

module "record" {
  source = "../resources/record"

  for_each = var.records

  zone_id = try(each.value.zone_id, null) != null ? each.value.zone_id : module.zone[0].zone_id

  name                             = each.value.name
  type                             = each.value.type
  alias                            = each.value.alias != null ? (each.value.alias.zone_id != null ? each.value.alias : merge(each.value.alias, { zone_id = try(each.value.zone_id, null) != null ? each.value.zone_id : module.zone[0].zone_id })) : null
  cidr_routing_policy              = lookup(each.value, "cidr_routing_policy", null)
  ttl                              = lookup(each.value, "ttl", null)
  records                          = lookup(each.value, "records", null)
  set_identifier                   = lookup(each.value, "set_identifier", null)
  health_check_id                  = lookup(each.value, "health_check_id", null)
  failover_routing_policy          = lookup(each.value, "failover_routing_policy", null)
  geolocation_routing_policy       = lookup(each.value, "geolocation_routing_policy", null)
  geoproximity_routing_policy      = lookup(each.value, "geoproximity_routing_policy", null)
  latency_routing_policy           = lookup(each.value, "latency_routing_policy", null)
  weighted_routing_policy          = lookup(each.value, "weighted_routing_policy", null)
  multivalue_answer_routing_policy = lookup(each.value, "multivalue_answer_routing_policy", null)
  allow_overwrite                  = lookup(each.value, "allow_overwrite", null)
}
