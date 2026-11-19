resource "aws_route53_hosted_zone_dnssec" "this" {
  hosted_zone_id = var.hosted_zone_id
  signing_status = var.signing_status

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }
}
