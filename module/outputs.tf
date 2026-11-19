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

output "zone_primary_name_server" {
  value       = var.zone != null ? module.zone[0].primary_name_server : null
  description = "The name server that created the hosted zone SOA record."
}

output "health_check_ids" {
  value       = { for key in keys(module.health_check) : key => module.health_check[key].id }
  description = "Health check IDs by logical name."
}

output "health_check_arns" {
  value       = { for key in keys(module.health_check) : key => module.health_check[key].arn }
  description = "Health check ARNs by logical name."
}

output "dnssec_ds_record" {
  value       = var.dnssec != null ? module.key_signing_key[0].ds_record : null
  description = "Delegation signer record for the hosted zone."
  depends_on  = [module.hosted_zone_dnssec]
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

output "zone_name" {
  value       = var.zone != null ? module.zone[0].name : null
  description = "The hosted zone name."
}

output "health_check_tags_all" {
  value       = { for key in keys(module.health_check) : key => module.health_check[key].tags_all }
  description = "All tags assigned to each health check."
}

output "delegation_set_ids" {
  value       = { for key in keys(module.delegation_set) : key => module.delegation_set[key].id }
  description = "The delegation set ID."
}

output "delegation_set_arns" {
  value       = { for key in keys(module.delegation_set) : key => module.delegation_set[key].arn }
  description = "The delegation set ARN."
}

output "delegation_set_name_servers" {
  value       = { for key in keys(module.delegation_set) : key => module.delegation_set[key].name_servers }
  description = "Name servers assigned to the delegation set."
}

output "vpc_association_authorization_ids" {
  value       = { for key in keys(module.vpc_association_authorization) : key => module.vpc_association_authorization[key].id }
  description = "The VPC association authorization ID."
}

output "vpc_association_authorization_zone_ids" {
  value       = { for key in keys(module.vpc_association_authorization) : key => module.vpc_association_authorization[key].zone_id }
  description = "The authorized hosted zone ID."
}

output "vpc_association_authorization_vpc_ids" {
  value       = { for key in keys(module.vpc_association_authorization) : key => module.vpc_association_authorization[key].vpc_id }
  description = "The authorized VPC ID."
}

output "vpc_association_authorization_vpc_regions" {
  value       = { for key in keys(module.vpc_association_authorization) : key => module.vpc_association_authorization[key].vpc_region }
  description = "The region of the authorized VPC."
}

output "zone_association_ids" {
  value       = { for key in keys(module.zone_association) : key => module.zone_association[key].id }
  description = "The zone association ID."
}

output "zone_association_zone_ids" {
  value       = { for key in keys(module.zone_association) : key => module.zone_association[key].zone_id }
  description = "The associated hosted zone ID."
}

output "zone_association_vpc_ids" {
  value       = { for key in keys(module.zone_association) : key => module.zone_association[key].vpc_id }
  description = "The associated VPC ID."
}

output "zone_association_vpc_regions" {
  value       = { for key in keys(module.zone_association) : key => module.zone_association[key].vpc_region }
  description = "The region of the associated VPC."
}

output "zone_association_owning_accounts" {
  value       = { for key in keys(module.zone_association) : key => module.zone_association[key].owning_account }
  description = "The account that owns the hosted zone."
}

output "cidr_collection_ids" {
  value       = { for key in keys(module.cidr_collection) : key => module.cidr_collection[key].id }
  description = "The CIDR collection ID."
}

output "cidr_collection_arns" {
  value       = { for key in keys(module.cidr_collection) : key => module.cidr_collection[key].arn }
  description = "The CIDR collection ARN."
}

output "cidr_collection_names" {
  value       = { for key in keys(module.cidr_collection) : key => module.cidr_collection[key].name }
  description = "The CIDR collection name."
}

output "cidr_collection_versions" {
  value       = { for key in keys(module.cidr_collection) : key => module.cidr_collection[key].version }
  description = "The CIDR collection version."
}

output "cidr_location_names" {
  value       = { for key in keys(module.cidr_location) : key => module.cidr_location[key].name }
  description = "The CIDR location name."
}

output "cidr_location_collection_ids" {
  value       = { for key in keys(module.cidr_location) : key => module.cidr_location[key].cidr_collection_id }
  description = "The CIDR collection ID."
}

output "cidr_location_cidr_blocks" {
  value       = { for key in keys(module.cidr_location) : key => module.cidr_location[key].cidr_blocks }
  description = "CIDR blocks assigned to the location."
}

output "dnssec_key_signing_key_id" {
  value       = var.dnssec != null ? module.key_signing_key[0].id : null
  description = "The key signing key ID."
}

output "dnssec_hosted_zone_id" {
  value       = var.dnssec != null ? module.key_signing_key[0].hosted_zone_id : null
  description = "The hosted zone ID."
}

output "dnssec_dnskey_record" {
  value       = var.dnssec != null ? module.key_signing_key[0].dnskey_record : null
  description = "The DNSKEY record value."
}

output "dnssec_digest_value" {
  value       = var.dnssec != null ? module.key_signing_key[0].digest_value : null
  description = "The delegation signer digest."
}

output "dnssec_digest_algorithm_mnemonic" {
  value       = var.dnssec != null ? module.key_signing_key[0].digest_algorithm_mnemonic : null
  description = "The delegation signer digest algorithm name."
}

output "dnssec_digest_algorithm_type" {
  value       = var.dnssec != null ? module.key_signing_key[0].digest_algorithm_type : null
  description = "The delegation signer digest algorithm number."
}

output "dnssec_flag" {
  value       = var.dnssec != null ? module.key_signing_key[0].flag : null
  description = "The DNSKEY flag."
}

output "dnssec_key_tag" {
  value       = var.dnssec != null ? module.key_signing_key[0].key_tag : null
  description = "The key tag."
}

output "dnssec_public_key" {
  value       = var.dnssec != null ? module.key_signing_key[0].public_key : null
  description = "The Base64-encoded public key."
}

output "dnssec_signing_algorithm_mnemonic" {
  value       = var.dnssec != null ? module.key_signing_key[0].signing_algorithm_mnemonic : null
  description = "The DNSSEC signing algorithm name."
}

output "dnssec_signing_algorithm_type" {
  value       = var.dnssec != null ? module.key_signing_key[0].signing_algorithm_type : null
  description = "The DNSSEC signing algorithm number."
}
