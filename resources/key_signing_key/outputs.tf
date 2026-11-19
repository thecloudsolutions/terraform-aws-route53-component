output "id" {
  value       = aws_route53_key_signing_key.this.id
  description = "The key signing key ID."
}

output "hosted_zone_id" {
  value       = aws_route53_key_signing_key.this.hosted_zone_id
  description = "The hosted zone ID."
}

output "ds_record" {
  value       = aws_route53_key_signing_key.this.ds_record
  description = "The delegation signer record value."
}

output "dnskey_record" {
  value       = aws_route53_key_signing_key.this.dnskey_record
  description = "The DNSKEY record value."
}

output "digest_value" {
  value       = aws_route53_key_signing_key.this.digest_value
  description = "The delegation signer digest."
}

output "digest_algorithm_mnemonic" {
  value       = aws_route53_key_signing_key.this.digest_algorithm_mnemonic
  description = "The delegation signer digest algorithm name."
}

output "digest_algorithm_type" {
  value       = aws_route53_key_signing_key.this.digest_algorithm_type
  description = "The delegation signer digest algorithm number."
}

output "flag" {
  value       = aws_route53_key_signing_key.this.flag
  description = "The DNSKEY flag."
}

output "key_tag" {
  value       = aws_route53_key_signing_key.this.key_tag
  description = "The key tag."
}

output "public_key" {
  value       = aws_route53_key_signing_key.this.public_key
  description = "The Base64-encoded public key."
}

output "signing_algorithm_mnemonic" {
  value       = aws_route53_key_signing_key.this.signing_algorithm_mnemonic
  description = "The DNSSEC signing algorithm name."
}

output "signing_algorithm_type" {
  value       = aws_route53_key_signing_key.this.signing_algorithm_type
  description = "The DNSSEC signing algorithm number."
}
