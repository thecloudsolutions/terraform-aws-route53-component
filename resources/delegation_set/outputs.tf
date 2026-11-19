output "id" {
  value       = aws_route53_delegation_set.this.id
  description = "The delegation set ID."
}

output "arn" {
  value       = aws_route53_delegation_set.this.arn
  description = "The delegation set ARN."
}

output "name_servers" {
  value       = aws_route53_delegation_set.this.name_servers
  description = "Name servers assigned to the delegation set."
}
