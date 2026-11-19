variable "zone_id" {
  type        = string
  description = "(Required) Private hosted zone ID."
}

variable "vpc_id" {
  type        = string
  description = "(Required) VPC ID to associate. The association is managed by the account that owns the VPC."
}

variable "vpc_region" {
  type        = string
  default     = null
  description = "(Optional) Region of the VPC. Defaults to the AWS provider region."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    delete = optional(string)
  })
  default     = null
  description = "(Optional) Operation timeouts. Defaults to 30m for create and delete."
}
