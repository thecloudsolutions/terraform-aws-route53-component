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

output "primary_name_server" {
  value       = aws_route53_zone.this.primary_name_server
  description = "The Route 53 name server that created the SOA record."
}

output "tags_all" {
  value       = aws_route53_zone.this.tags_all
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
}

output "name" {
  value       = aws_route53_zone.this.name
  description = "The hosted zone name."
}
