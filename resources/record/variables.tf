variable "zone_id" {
  type        = string
  description = "(Required) The ID of the hosted zone to contain this record."
}

variable "name" {
  type        = string
  description = "(Required) The name of the record."
}

variable "type" {
  type        = string
  description = "(Required) The record type. Valid values are A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
}

variable "ttl" {
  type        = number
  default     = null
  description = "(Required for non-alias records) The TTL of the record."
}

variable "records" {
  type        = list(string)
  default     = null
  description = "(Required for non-alias records) A string list of records. To specify a single record value longer than 255 characters such as a TXT record for DKIM, \"\" inside the Terraform configuration string (e.g., \"first255characters\"\"morecharacters\")."
}

variable "set_identifier" {
  type        = string
  default     = null
  description = "(Optional) Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies."
}

variable "health_check_id" {
  type        = string
  default     = null
  description = "(Optional) The health check the record should be associated with."
}

variable "alias" {
  type = object({
    # (Required) DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone.
    name = string

    # (Required) Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone. See resource_elb.zone_id for example.
    zone_id = string

    # (Required) Set to true if you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set. Some resources have special requirements, see related part of documentation.
    evaluate_target_health = bool
  })
  default     = null
  description = "(Optional) An alias block. Conflicts with ttl & records."
}

variable "cidr_routing_policy" {
  type = object({
    collection_id = string
    # (Required) ID of the CIDR collection used for routing.
    location_name = string
    # (Required) Location name within the CIDR collection.
  })
  default     = null
  description = "(Optional) CIDR routing policy based on the IP network ranges of requestors."
}

variable "failover_routing_policy" {
  type = object({
    # (Required) PRIMARY or SECONDARY. A PRIMARY record will be served if its healthcheck is passing, otherwise the SECONDARY will be served. See http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-configuring-options.html#dns-failover-failover-rrsets
    type = string
  })
  default     = null
  description = "(Optional) A block indicating the routing behavior when associated health check fails. Conflicts with any other routing policy."
}

variable "geolocation_routing_policy" {
  type = object({
    # A two-letter continent code. Either continent or country must be specified.
    continent = optional(string)

    # A two-character country code or * to indicate a default resource record set.
    country = optional(string)

    # (Optional) A subdivision code for a country.
    subdivision = optional(string)
  })
  default     = null
  description = "(Optional) A block indicating a routing policy based on the geolocation of the requestor. Conflicts with any other routing policy."
}

variable "geoproximity_routing_policy" {
  type = object({
    aws_region = optional(string)
    # (Optional) AWS Region of the geoproximity resource.
    bias = optional(number)
    # (Optional) Bias that expands or shrinks the geographic routing area.
    local_zone_group = optional(string)
    # (Optional) Local Zone group of the geoproximity resource.
    coordinates = optional(object({
      latitude = string
      # (Required) Latitude of the geoproximity resource.
      longitude = string
      # (Required) Longitude of the geoproximity resource.
    }))
  })
  default     = null
  description = "(Optional) Geoproximity routing policy for routing traffic based on resource location."
}

variable "latency_routing_policy" {
  type = object({
    # (Required) An AWS region from which to measure latency.
    region = string
  })
  default     = null
  description = "(Optional) A block indicating a routing policy based on the latency between the requestor and an AWS region. Conflicts with any other routing policy."
}

variable "weighted_routing_policy" {
  type = object({
    # (Required) A numeric value indicating the relative weight of the record.
    weight = number
  })
  default     = null
  description = "(Optional) A block indicating a weighted routing policy. Conflicts with any other routing policy."
}

variable "multivalue_answer_routing_policy" {
  type        = bool
  default     = null
  description = "(Optional) Set to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy."
}

variable "allow_overwrite" {
  type        = bool
  default     = false
  description = "(Optional) Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments."
}
