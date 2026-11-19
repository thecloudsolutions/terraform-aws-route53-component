resource "aws_route53_zone" "this" {
  name                        = var.name
  comment                     = var.comment
  delegation_set_id           = var.delegation_set_id
  enable_accelerated_recovery = var.enable_accelerated_recovery
  force_destroy               = var.force_destroy

  dynamic "vpc" {
    for_each = var.vpc != null ? var.vpc : []

    content {
      vpc_id     = vpc.value.vpc_id
      vpc_region = lookup(vpc.value, "vpc_region", null)
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      update = lookup(timeouts.value, "update", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }

  tags = var.tags
}
