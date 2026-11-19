variable "hosted_zone_id" {
  type        = string
  description = "(Required) Hosted zone ID."
}

variable "signing_status" {
  type        = string
  default     = null
  description = "(Optional) SIGNING or NOT_SIGNING."
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
