output "id" {
  value       = aws_route53_cidr_collection.this.id
  description = "The CIDR collection ID."
}

output "arn" {
  value       = aws_route53_cidr_collection.this.arn
  description = "The CIDR collection ARN."
}

output "name" {
  value       = aws_route53_cidr_collection.this.name
  description = "The CIDR collection name."
}

output "version" {
  value       = aws_route53_cidr_collection.this.version
  description = "The CIDR collection version."
}
