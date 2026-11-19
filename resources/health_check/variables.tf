variable "type" {
  type        = string
  description = "(Required) Health check type."
}

variable "reference_name" {
  type        = string
  default     = null
  description = "(Optional) Reference name used in the caller reference."
}

variable "fqdn" {
  type        = string
  default     = null
  description = "(Optional) Fully qualified domain name of the endpoint."
}

variable "ip_address" {
  type        = string
  default     = null
  description = "(Optional) IP address of the endpoint."
}

variable "port" {
  type        = number
  default     = null
  description = "(Optional) Port of the endpoint."
}

variable "failure_threshold" {
  type        = number
  default     = null
  description = "(Optional) Consecutive successes or failures needed to change health status."
}

variable "request_interval" {
  type        = number
  default     = null
  description = "(Optional) Seconds between endpoint checks."
}

variable "resource_path" {
  type        = string
  default     = null
  description = "(Optional) HTTP path to request."
}

variable "search_string" {
  type        = string
  default     = null
  description = "(Optional) String to find in the response body."
}

variable "measure_latency" {
  type        = bool
  default     = null
  description = "(Optional) Whether to measure endpoint latency."
}

variable "invert_healthcheck" {
  type        = bool
  default     = null
  description = "(Optional) Whether to invert the health status."
}

variable "disabled" {
  type        = bool
  default     = null
  description = "(Optional) Whether to disable the health check."
}

variable "enable_sni" {
  type        = bool
  default     = null
  description = "(Optional) Whether to send the FQDN using SNI."
}

variable "child_healthchecks" {
  type        = set(string)
  default     = null
  description = "(Optional) Health check IDs included in a calculated check."
}

variable "child_health_threshold" {
  type        = number
  default     = null
  description = "(Optional) Minimum healthy child checks for a calculated check."
}

variable "cloudwatch_alarm_name" {
  type        = string
  default     = null
  description = "(Optional) CloudWatch alarm name."
}

variable "cloudwatch_alarm_region" {
  type        = string
  default     = null
  description = "(Optional) Region of the CloudWatch alarm."
}

variable "insufficient_data_health_status" {
  type        = string
  default     = null
  description = "(Optional) Health status when the CloudWatch alarm has insufficient data."
}

variable "regions" {
  type        = set(string)
  default     = null
  description = "(Optional) Regions from which Route 53 checks the endpoint."
}

variable "routing_control_arn" {
  type        = string
  default     = null
  description = "(Optional) ARC routing control ARN."
}

variable "triggers" {
  type        = map(string)
  default     = null
  description = "(Optional) Values that trigger an in-place alarm check update."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) Tags assigned to the health check."
}
