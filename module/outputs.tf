output "zone_arn" {
  value       = var.zone != null ? module.zone[0].arn : null
  description = "The Amazon Resource Name (ARN) of the Hosted Zone."
}

output "zone_id" {
  value       = var.zone != null ? module.zone[0].zone_id : null
  description = "The Hosted Zone ID. This can be referenced by zone records."
}

output "zone_name_servers" {
  value       = var.zone != null ? module.zone[0].name_servers : null
  description = "A list of name servers in associated (or default) delegation set."
}

output "zone_tags_all" {
  value       = var.zone != null ? module.zone[0].tags_all : null
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "record_names" {
  value       = { for record in keys(module.record) : record => module.record[record].name }
  description = "The name of the record."
}

output "record_fqdns" {
  value       = { for record in keys(module.record) : record => module.record[record].fqdn }
  description = "FQDN built using the zone domain and name."
}
