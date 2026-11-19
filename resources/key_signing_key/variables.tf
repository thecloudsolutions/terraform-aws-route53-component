variable "hosted_zone_id" {
  type        = string
  description = "(Required) Hosted zone ID."
}

variable "key_management_service_arn" {
  type        = string
  description = "(Required) ARN of a DNSSEC-compatible KMS key in us-east-1."
}

variable "name" {
  type        = string
  description = "(Required) Key signing key name."
}

variable "status" {
  type        = string
  default     = null
  description = "(Optional) ACTIVE or INACTIVE."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default     = null
  description = "(Optional) Operation timeouts."
}
