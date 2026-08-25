variable "name" {
  type        = string
  description = "(Required) This is the name of the hosted zone."
}

variable "comment" {
  type        = string
  default     = "Managed by Terraform"
  description = "(Optional) A comment for the hosted zone. Defaults to 'Managed by Terraform'."
}

variable "delegation_set_id" {
  type        = string
  default     = null
  description = "(Optional) The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Conflicts with vpc as delegation sets can only be used for public zones."
}

variable "enable_accelerated_recovery" {
  type        = bool
  default     = null
  description = "(Optional) Whether to enable accelerated recovery for the hosted zone. Defaults to false."
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "(Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
}

variable "vpc" {
  type = set(object({
    # (Required) ID of the VPC to associate.
    vpc_id = string

    # (Optional) Region of the VPC to associate. Defaults to AWS provider region.
    vpc_region = optional(string)
  }))
  default     = null
  description = "(Optional) Configuration block(s) specifying VPC(s) to associate with a private hosted zone. Conflicts with the delegation_set_id argument in this resource and any aws_route53_zone_association resource specifying the same zone ID. Detailed below."
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A map of tags assigned to all modules."
}
