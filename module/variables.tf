variable "zone" {
  type = object({
    name                        = string
    comment                     = optional(string)
    delegation_set_id           = optional(string)
    enable_accelerated_recovery = optional(bool)
    # (Optional) Whether to enable accelerated recovery for the hosted zone.
    force_destroy = optional(bool)

    vpc = optional(set(object({
      vpc_id     = string
      vpc_region = optional(string)
    })))

    tags = optional(map(string))
  })

  default = null
}

variable "records" {
  type = map(object({
    name    = string
    type    = string
    zone_id = optional(string)
    ttl     = optional(number)
    # (Required for non-alias records) The TTL of the record.
    records = optional(list(string))
    # (Required for non-alias records) A string list of records.
    set_identifier  = optional(string)
    health_check_id = optional(string)

    alias = optional(object({
      name                   = string
      zone_id                = optional(string)
      evaluate_target_health = bool
    }))

    cidr_routing_policy = optional(object({
      collection_id = string
      # (Required) ID of the CIDR collection used for routing.
      location_name = string
      # (Required) Location name within the CIDR collection.
    }))

    failover_routing_policy = optional(object({
      type = string
    }))

    geolocation_routing_policy = optional(object({
      continent = optional(string)
      # (Optional) Two-letter continent code used for geolocation routing.
      country = optional(string)
      # (Optional) Two-letter country code used for geolocation routing.
      subdivision = optional(string)
      # (Optional) Subdivision code used with a country geolocation.
    }))

    geoproximity_routing_policy = optional(object({
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
    }))

    latency_routing_policy = optional(object({
      region = string
    }))

    weighted_routing_policy = optional(object({
      weight = number
    }))

    multivalue_answer_routing_policy = optional(bool)
    allow_overwrite                  = optional(bool)
  }))

  default = {}
}
