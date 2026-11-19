module "zone" {
  source = "../resources/zone"

  count = var.zone != null ? 1 : 0

  name                        = var.zone.name
  comment                     = lookup(var.zone, "comment", null)
  delegation_set_id           = var.zone.delegation_set_id != null ? var.zone.delegation_set_id : var.zone.delegation_set_custom_name != null ? module.delegation_set[var.zone.delegation_set_custom_name].id : null
  enable_accelerated_recovery = lookup(var.zone, "enable_accelerated_recovery", null)
  force_destroy               = lookup(var.zone, "force_destroy", null)
  vpc                         = lookup(var.zone, "vpc", null)
  timeouts                    = lookup(var.zone, "timeouts", null)

  tags = lookup(var.zone, "tags", null)
}

module "delegation_set" {
  source = "../resources/delegation_set"

  for_each = var.delegation_sets

  reference_name = lookup(each.value, "reference_name", null)
}

module "vpc_association_authorization" {
  source = "../resources/vpc_association_authorization"

  for_each = var.vpc_association_authorizations

  zone_id    = each.value.zone_id != null ? each.value.zone_id : try(module.zone[0].zone_id, null)
  vpc_id     = each.value.vpc_id
  vpc_region = lookup(each.value, "vpc_region", null)
  timeouts   = lookup(each.value, "timeouts", null)
}

module "zone_association" {
  source = "../resources/zone_association"

  for_each = var.zone_associations

  zone_id    = each.value.zone_id
  vpc_id     = each.value.vpc_id
  vpc_region = lookup(each.value, "vpc_region", null)
  timeouts   = lookup(each.value, "timeouts", null)
}

module "cidr_collection" {
  source = "../resources/cidr_collection"

  for_each = var.cidr_collections

  name = each.value.name
}

module "cidr_location" {
  source = "../resources/cidr_location"

  for_each = var.cidr_locations

  cidr_blocks        = each.value.cidr_blocks
  cidr_collection_id = each.value.cidr_collection_id != null ? each.value.cidr_collection_id : each.value.cidr_collection_custom_name != null ? module.cidr_collection[each.value.cidr_collection_custom_name].id : null
  name               = each.value.name
}

module "health_check" {
  source = "../resources/health_check"

  for_each = var.health_checks

  type                            = each.value.type
  reference_name                  = lookup(each.value, "reference_name", null)
  fqdn                            = lookup(each.value, "fqdn", null)
  ip_address                      = lookup(each.value, "ip_address", null)
  port                            = lookup(each.value, "port", null)
  failure_threshold               = lookup(each.value, "failure_threshold", null)
  request_interval                = lookup(each.value, "request_interval", null)
  resource_path                   = lookup(each.value, "resource_path", null)
  search_string                   = lookup(each.value, "search_string", null)
  measure_latency                 = lookup(each.value, "measure_latency", null)
  invert_healthcheck              = lookup(each.value, "invert_healthcheck", null)
  disabled                        = lookup(each.value, "disabled", null)
  enable_sni                      = lookup(each.value, "enable_sni", null)
  child_healthchecks              = lookup(each.value, "child_healthchecks", null)
  child_health_threshold          = lookup(each.value, "child_health_threshold", null)
  cloudwatch_alarm_name           = lookup(each.value, "cloudwatch_alarm_name", null)
  cloudwatch_alarm_region         = lookup(each.value, "cloudwatch_alarm_region", null)
  insufficient_data_health_status = lookup(each.value, "insufficient_data_health_status", null)
  regions                         = lookup(each.value, "regions", null)
  routing_control_arn             = lookup(each.value, "routing_control_arn", null)
  triggers                        = lookup(each.value, "triggers", null)

  tags = lookup(each.value, "tags", null)
}

module "key_signing_key" {
  source = "../resources/key_signing_key"

  count = var.dnssec != null ? 1 : 0

  hosted_zone_id             = var.dnssec.hosted_zone_id != null ? var.dnssec.hosted_zone_id : try(module.zone[0].zone_id, null)
  key_management_service_arn = var.dnssec.key_management_service_arn
  name                       = var.dnssec.name
  status                     = lookup(var.dnssec, "status", null)
  timeouts                   = lookup(var.dnssec, "key_signing_key_timeouts", null)
}

module "hosted_zone_dnssec" {
  source = "../resources/hosted_zone_dnssec"

  count = var.dnssec != null ? 1 : 0

  hosted_zone_id = module.key_signing_key[0].hosted_zone_id
  signing_status = lookup(var.dnssec, "signing_status", null)
  timeouts       = lookup(var.dnssec, "hosted_zone_dnssec_timeouts", null)
}

module "record" {
  source = "../resources/record"

  for_each = var.records

  zone_id = try(each.value.zone_id, null) != null ? each.value.zone_id : try(module.zone[0].zone_id, null)

  name  = each.value.name
  type  = each.value.type
  alias = each.value.alias != null ? (each.value.alias.zone_id != null ? each.value.alias : merge(each.value.alias, { zone_id = try(each.value.zone_id, null) != null ? each.value.zone_id : module.zone[0].zone_id })) : null
  cidr_routing_policy = each.value.cidr_routing_policy != null ? {
    collection_id = each.value.cidr_routing_policy.collection_id != null ? each.value.cidr_routing_policy.collection_id : each.value.cidr_routing_policy.collection_custom_name != null ? module.cidr_collection[each.value.cidr_routing_policy.collection_custom_name].id : each.value.cidr_routing_policy.location_custom_name != null ? module.cidr_location[each.value.cidr_routing_policy.location_custom_name].cidr_collection_id : null
    location_name = each.value.cidr_routing_policy.location_name != null ? each.value.cidr_routing_policy.location_name : each.value.cidr_routing_policy.location_custom_name != null ? module.cidr_location[each.value.cidr_routing_policy.location_custom_name].name : null
  } : null
  ttl                              = lookup(each.value, "ttl", null)
  records                          = lookup(each.value, "records", null)
  set_identifier                   = lookup(each.value, "set_identifier", null)
  health_check_id                  = try(each.value.health_check_id, null) != null ? each.value.health_check_id : (try(each.value.health_check_custom_name, null) != null ? module.health_check[each.value.health_check_custom_name].id : null)
  failover_routing_policy          = lookup(each.value, "failover_routing_policy", null)
  geolocation_routing_policy       = lookup(each.value, "geolocation_routing_policy", null)
  geoproximity_routing_policy      = lookup(each.value, "geoproximity_routing_policy", null)
  latency_routing_policy           = lookup(each.value, "latency_routing_policy", null)
  weighted_routing_policy          = lookup(each.value, "weighted_routing_policy", null)
  multivalue_answer_routing_policy = lookup(each.value, "multivalue_answer_routing_policy", null)
  allow_overwrite                  = lookup(each.value, "allow_overwrite", null)
  timeouts                         = lookup(each.value, "timeouts", null)
}
