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

output "route53_zone_primary_name_servers" {
  value       = { for zone in keys(module.route53) : zone => module.route53[zone].zone_primary_name_server }
  description = "Name server that created each hosted zone SOA record."
}

output "route53_health_check_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].health_check_ids }
  description = "Health check IDs by Route 53 group and logical name."
}

output "route53_health_check_arns" {
  value       = { for key in keys(module.route53) : key => module.route53[key].health_check_arns }
  description = "Health check ARNs by Route 53 group and logical name."
}

output "route53_dnssec_ds_records" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_ds_record }
  description = "Delegation signer records by Route 53 group."
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

output "route53_zone_names" {
  value       = { for key in keys(module.route53) : key => module.route53[key].zone_name }
  description = "The hosted zone name."
}

output "route53_health_check_tags_all" {
  value       = { for key in keys(module.route53) : key => module.route53[key].health_check_tags_all }
  description = "All tags assigned to each health check."
}

output "route53_delegation_set_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].delegation_set_ids }
  description = "The delegation set ID."
}

output "route53_delegation_set_arns" {
  value       = { for key in keys(module.route53) : key => module.route53[key].delegation_set_arns }
  description = "The delegation set ARN."
}

output "route53_delegation_set_name_servers" {
  value       = { for key in keys(module.route53) : key => module.route53[key].delegation_set_name_servers }
  description = "Name servers assigned to the delegation set."
}

output "route53_vpc_association_authorization_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].vpc_association_authorization_ids }
  description = "The VPC association authorization ID."
}

output "route53_vpc_association_authorization_zone_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].vpc_association_authorization_zone_ids }
  description = "The authorized hosted zone ID."
}

output "route53_vpc_association_authorization_vpc_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].vpc_association_authorization_vpc_ids }
  description = "The authorized VPC ID."
}

output "route53_vpc_association_authorization_vpc_regions" {
  value       = { for key in keys(module.route53) : key => module.route53[key].vpc_association_authorization_vpc_regions }
  description = "The region of the authorized VPC."
}

output "route53_zone_association_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].zone_association_ids }
  description = "The zone association ID."
}

output "route53_zone_association_zone_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].zone_association_zone_ids }
  description = "The associated hosted zone ID."
}

output "route53_zone_association_vpc_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].zone_association_vpc_ids }
  description = "The associated VPC ID."
}

output "route53_zone_association_vpc_regions" {
  value       = { for key in keys(module.route53) : key => module.route53[key].zone_association_vpc_regions }
  description = "The region of the associated VPC."
}

output "route53_zone_association_owning_accounts" {
  value       = { for key in keys(module.route53) : key => module.route53[key].zone_association_owning_accounts }
  description = "The account that owns the hosted zone."
}

output "route53_cidr_collection_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].cidr_collection_ids }
  description = "The CIDR collection ID."
}

output "route53_cidr_collection_arns" {
  value       = { for key in keys(module.route53) : key => module.route53[key].cidr_collection_arns }
  description = "The CIDR collection ARN."
}

output "route53_cidr_collection_names" {
  value       = { for key in keys(module.route53) : key => module.route53[key].cidr_collection_names }
  description = "The CIDR collection name."
}

output "route53_cidr_collection_versions" {
  value       = { for key in keys(module.route53) : key => module.route53[key].cidr_collection_versions }
  description = "The CIDR collection version."
}

output "route53_cidr_location_names" {
  value       = { for key in keys(module.route53) : key => module.route53[key].cidr_location_names }
  description = "The CIDR location name."
}

output "route53_cidr_location_collection_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].cidr_location_collection_ids }
  description = "The CIDR collection ID."
}

output "route53_cidr_location_cidr_blocks" {
  value       = { for key in keys(module.route53) : key => module.route53[key].cidr_location_cidr_blocks }
  description = "CIDR blocks assigned to the location."
}

output "route53_dnssec_key_signing_key_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_key_signing_key_id }
  description = "The key signing key ID."
}

output "route53_dnssec_hosted_zone_ids" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_hosted_zone_id }
  description = "The hosted zone ID."
}

output "route53_dnssec_dnskey_records" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_dnskey_record }
  description = "The DNSKEY record value."
}

output "route53_dnssec_digest_values" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_digest_value }
  description = "The delegation signer digest."
}

output "route53_dnssec_digest_algorithm_mnemonics" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_digest_algorithm_mnemonic }
  description = "The delegation signer digest algorithm name."
}

output "route53_dnssec_digest_algorithm_types" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_digest_algorithm_type }
  description = "The delegation signer digest algorithm number."
}

output "route53_dnssec_flags" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_flag }
  description = "The DNSKEY flag."
}

output "route53_dnssec_key_tags" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_key_tag }
  description = "The key tag."
}

output "route53_dnssec_public_keys" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_public_key }
  description = "The Base64-encoded public key."
}

output "route53_dnssec_signing_algorithm_mnemonics" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_signing_algorithm_mnemonic }
  description = "The DNSSEC signing algorithm name."
}

output "route53_dnssec_signing_algorithm_types" {
  value       = { for key in keys(module.route53) : key => module.route53[key].dnssec_signing_algorithm_type }
  description = "The DNSSEC signing algorithm number."
}
