output "id" {
  value       = aws_route53_health_check.this.id
  description = "The health check ID."
}

output "arn" {
  value       = aws_route53_health_check.this.arn
  description = "The health check ARN."
}

output "tags_all" {
  value       = aws_route53_health_check.this.tags_all
  description = "All tags assigned to the health check."
}
