output "id" {
  value       = aws_route53_vpc_association_authorization.this.id
  description = "The VPC association authorization ID."
}

output "zone_id" {
  value       = aws_route53_vpc_association_authorization.this.zone_id
  description = "The authorized hosted zone ID."
}

output "vpc_id" {
  value       = aws_route53_vpc_association_authorization.this.vpc_id
  description = "The authorized VPC ID."
}

output "vpc_region" {
  value       = aws_route53_vpc_association_authorization.this.vpc_region
  description = "The region of the authorized VPC."
}
