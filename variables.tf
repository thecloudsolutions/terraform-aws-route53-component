variable "route53_map" {
  type = map(object({
    zone = optional(object({
      name                        = string
      comment                     = optional(string)
      delegation_set_id           = optional(string)
      enable_accelerated_recovery = optional(bool)
      force_destroy               = optional(bool)

      vpc = optional(set(object({
        vpc_id     = string
        vpc_region = optional(string)
      })))

      tags = optional(map(string))
    }))

    records = optional(map(object({
      name            = string
      type            = string
      zone_id         = optional(string)
      ttl             = optional(number)
      records         = optional(list(string))
      dns_records     = optional(string)
      set_identifier  = optional(string)
      health_check_id = optional(string)

      alias = optional(object({
        name                   = string
        zone_id                = optional(string)
        evaluate_target_health = bool
      }))

      cidr_routing_policy = optional(object({
        collection_id = string
        location_name = string
      }))

      failover_routing_policy = optional(object({
        type = string
      }))

      geolocation_routing_policy = optional(object({
        continent   = optional(string)
        country     = optional(string)
        subdivision = optional(string)
      }))

      geoproximity_routing_policy = optional(object({
        aws_region       = optional(string)
        bias             = optional(number)
        local_zone_group = optional(string)
        coordinates = optional(object({
          latitude  = string
          longitude = string
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
    })), {})
  }))

  description = "Keyed collection of route53 definitions"
}
