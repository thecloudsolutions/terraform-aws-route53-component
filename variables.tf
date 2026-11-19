variable "route53_map" {
  type = map(object({
    zone = optional(object({
      name                        = string
      comment                     = optional(string)
      delegation_set_id           = optional(string)
      delegation_set_custom_name  = optional(string)
      enable_accelerated_recovery = optional(bool)
      force_destroy               = optional(bool)

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
    }))

    delegation_sets = optional(map(object({
      reference_name = optional(string)
    })), {})

    vpc_association_authorizations = optional(map(object({
      zone_id    = optional(string)
      vpc_id     = string
      vpc_region = optional(string)
      timeouts = optional(object({
        create = optional(string)
        read   = optional(string)
        delete = optional(string)
      }))
    })), {})

    zone_associations = optional(map(object({
      zone_id    = string
      vpc_id     = string
      vpc_region = optional(string)
      timeouts = optional(object({
        create = optional(string)
        delete = optional(string)
      }))
    })), {})

    cidr_collections = optional(map(object({
      name = string
    })), {})

    cidr_locations = optional(map(object({
      name                        = string
      cidr_blocks                 = set(string)
      cidr_collection_id          = optional(string)
      cidr_collection_custom_name = optional(string)
    })), {})

    health_checks = optional(map(object({
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
    })), {})

    dnssec = optional(object({
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
    }))

    records = optional(map(object({
      name                     = string
      type                     = string
      zone_id                  = optional(string)
      ttl                      = optional(number)
      records                  = optional(list(string))
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
      timeouts = optional(object({
        create = optional(string)
        update = optional(string)
        delete = optional(string)
      }))
    })), {})
  }))

  description = "Keyed collection of route53 definitions"
}
