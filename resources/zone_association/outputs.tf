output "id" {
  value       = aws_route53_zone_association.this.id
  description = "The zone association ID."
}

output "zone_id" {
  value       = aws_route53_zone_association.this.zone_id
  description = "The associated hosted zone ID."
}

output "vpc_id" {
  value       = aws_route53_zone_association.this.vpc_id
  description = "The associated VPC ID."
}

output "vpc_region" {
  value       = aws_route53_zone_association.this.vpc_region
  description = "The region of the associated VPC."
}

output "owning_account" {
  value       = aws_route53_zone_association.this.owning_account
  description = "The account that owns the hosted zone."
}
