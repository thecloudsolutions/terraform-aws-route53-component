module "route53" {
  source = "./module"

  for_each = var.route53_map

  zone    = lookup(each.value, "zone", null)
  records = lookup(each.value, "records", null)
}
