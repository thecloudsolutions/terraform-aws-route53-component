variable "cidr_blocks" {
  type        = set(string)
  description = "(Required) CIDR blocks for the location."
}

variable "cidr_collection_id" {
  type        = string
  description = "(Required) CIDR collection ID."
}

variable "name" {
  type        = string
  description = "(Required) Name of the CIDR location."
}
