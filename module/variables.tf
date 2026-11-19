variable "zone" {
  type = object({
    name                        = string
    comment                     = optional(string)
    delegation_set_id           = optional(string)
    delegation_set_custom_name  = optional(string)
    enable_accelerated_recovery = optional(bool)
    # (Optional) Whether to enable accelerated recovery for the hosted zone.
    force_destroy = optional(bool)

    vpc = optional(set(object({
      vpc_id     = string
      vpc_region = optional(string)
    })))

    tags = optional(map(string))
    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
      delete = optional(string)
    }))
  })

  default = null
}

variable "delegation_sets" {
  type = map(object({
    reference_name = optional(string)
  }))
  default = {}
}

variable "vpc_association_authorizations" {
  type = map(object({
    zone_id    = optional(string)
    vpc_id     = string
    vpc_region = optional(string)
    timeouts = optional(object({
      create = optional(string)
      read   = optional(string)
      delete = optional(string)
    }))
  }))
  default = {}
}

variable "zone_associations" {
  type = map(object({
    zone_id = string
    # (Required) Existing private hosted zone ID. Use zone.vpc for a zone created by this unit.
    vpc_id     = string
    vpc_region = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  default = {}
}

variable "cidr_collections" {
  type = map(object({
    name = string
  }))
  default = {}
}

variable "cidr_locations" {
  type = map(object({
    name                        = string
    cidr_blocks                 = set(string)
    cidr_collection_id          = optional(string)
    cidr_collection_custom_name = optional(string)
  }))
  default = {}
}

variable "health_checks" {
  type = map(object({
    type                            = string
    reference_name                  = optional(string)
    fqdn                            = optional(string)
    ip_address                      = optional(string)
    port                            = optional(number)
    failure_threshold               = optional(number)
    request_interval                = optional(number)
    resource_path                   = optional(string)
    search_string                   = optional(string)
    measure_latency                 = optional(bool)
    invert_healthcheck              = optional(bool)
    disabled                        = optional(bool)
    enable_sni                      = optional(bool)
    child_healthchecks              = optional(set(string))
    child_health_threshold          = optional(number)
    cloudwatch_alarm_name           = optional(string)
    cloudwatch_alarm_region         = optional(string)
    insufficient_data_health_status = optional(string)
    regions                         = optional(set(string))
    routing_control_arn             = optional(string)
    triggers                        = optional(map(string))
    tags                            = optional(map(string))
  }))
  default = {}
}

variable "dnssec" {
  type = object({
    hosted_zone_id             = optional(string)
    key_management_service_arn = string
    name                       = string
    status                     = optional(string)
    signing_status             = optional(string)
    key_signing_key_timeouts = optional(object({
      create = optional(string)
      update = optional(string)
      delete = optional(string)
    }))
    hosted_zone_dnssec_timeouts = optional(object({
      create = optional(string)
      update = optional(string)
      delete = optional(string)
    }))
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
    set_identifier           = optional(string)
    health_check_id          = optional(string)
    health_check_custom_name = optional(string)

    alias = optional(object({
      name                   = string
      zone_id                = optional(string)
      evaluate_target_health = bool
    }))

    cidr_routing_policy = optional(object({
      collection_id          = optional(string)
      collection_custom_name = optional(string)
      location_name          = optional(string)
      location_custom_name   = optional(string)
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
    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
      delete = optional(string)
    }))
  }))

  default = {}
}
