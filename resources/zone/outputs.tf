output "arn" {
  value       = aws_route53_zone.this.arn
  description = "The Amazon Resource Name (ARN) of the Hosted Zone."
}

output "zone_id" {
  value       = aws_route53_zone.this.zone_id
  description = "The Hosted Zone ID. This can be referenced by zone records."
}

output "name_servers" {
  value       = aws_route53_zone.this.name_servers
  description = "A list of name servers in associated (or default) delegation set."
}

output "tags_all" {
  value       = aws_route53_zone.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}