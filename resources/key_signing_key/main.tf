resource "aws_route53_key_signing_key" "this" {
  hosted_zone_id             = var.hosted_zone_id
  key_management_service_arn = var.key_management_service_arn
  name                       = var.name
  status                     = var.status

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }
}
