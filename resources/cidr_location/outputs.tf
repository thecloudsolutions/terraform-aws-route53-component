output "name" {
  value       = aws_route53_cidr_location.this.name
  description = "The CIDR location name."
}

output "cidr_collection_id" {
  value       = aws_route53_cidr_location.this.cidr_collection_id
  description = "The CIDR collection ID."
}

output "cidr_blocks" {
  value       = aws_route53_cidr_location.this.cidr_blocks
  description = "CIDR blocks assigned to the location."
}
