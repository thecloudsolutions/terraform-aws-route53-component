resource "aws_route53_zone_association" "this" {
  zone_id    = var.zone_id
  vpc_id     = var.vpc_id
  vpc_region = var.vpc_region

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }
}
