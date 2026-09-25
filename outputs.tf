output "route53_zone_arns" {
  value       = { for zone in keys(module.route53) : zone => module.route53[zone].zone_arn }
  description = "The Amazon Resource Name (ARN) of the Hosted Zone."
}

output "route53_zone_ids" {
  value       = { for zone in keys(module.route53) : zone => module.route53[zone].zone_id }
  description = "The Hosted Zone ID. This can be referenced by zone records."
}

output "route53_zone_name_servers" {
  value       = { for zone in keys(module.route53) : zone => module.route53[zone].zone_name_servers }
  description = "A list of name servers in associated (or default) delegation set."
}

output "route53_zone_tags_all" {
  value       = { for zone in keys(module.route53) : zone => module.route53[zone].zone_tags_all }
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "route53_record_names" {
  value       = { for record in keys(module.route53) : record => module.route53[record].record_names }
  description = "The name of the record."
}

output "route53_record_fqdns" {
  value       = { for record in keys(module.route53) : record => module.route53[record].record_fqdns }
  description = "FQDN built using the zone domain and name."
}
