module "route53" {
  source = "./module"

  for_each = var.route53_map

  zone                           = lookup(each.value, "zone", null)
  records                        = lookup(each.value, "records", null)
  delegation_sets                = lookup(each.value, "delegation_sets", {})
  vpc_association_authorizations = lookup(each.value, "vpc_association_authorizations", {})
  zone_associations              = lookup(each.value, "zone_associations", {})
  cidr_collections               = lookup(each.value, "cidr_collections", {})
  cidr_locations                 = lookup(each.value, "cidr_locations", {})
  health_checks                  = lookup(each.value, "health_checks", null)
  dnssec                         = lookup(each.value, "dnssec", null)
}
