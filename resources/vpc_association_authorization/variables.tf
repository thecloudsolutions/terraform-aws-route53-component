variable "zone_id" {
  type        = string
  description = "(Required) Private hosted zone ID. Authorization is managed by the account that owns the zone."
}

variable "vpc_id" {
  type        = string
  description = "(Required) VPC ID to authorize for association."
}

variable "vpc_region" {
  type        = string
  default     = null
  description = "(Optional) Region of the VPC. Defaults to the AWS provider region."
}

variable "timeouts" {
  type = object({
    create = optional(string)
    read   = optional(string)
    delete = optional(string)
  })
  default     = null
  description = "(Optional) Operation timeouts. Defaults to 20m for create and delete, and 5m for read."
}
