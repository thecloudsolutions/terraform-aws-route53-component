## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.60.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_route53"></a> [route53](#module\_route53) | ./module | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_route53_map"></a> [route53\_map](#input\_route53\_map) | Keyed collection of route53 definitions | <pre>map(object({<br/>    zone = optional(object({<br/>      name                        = string<br/>      comment                     = optional(string)<br/>      delegation_set_id           = optional(string)<br/>      enable_accelerated_recovery = optional(bool)<br/>      force_destroy               = optional(bool)<br/><br/>      vpc = optional(set(object({<br/>        vpc_id     = string<br/>        vpc_region = optional(string)<br/>      })))<br/><br/>      tags = optional(map(string))<br/>    }))<br/><br/>    records = optional(map(object({<br/>      name            = string<br/>      type            = string<br/>      zone_id         = optional(string)<br/>      ttl             = optional(number)<br/>      records         = optional(list(string))<br/>      dns_records     = optional(string)<br/>      set_identifier  = optional(string)<br/>      health_check_id = optional(string)<br/><br/>      alias = optional(object({<br/>        name                   = string<br/>        zone_id                = optional(string)<br/>        evaluate_target_health = bool<br/>      }))<br/><br/>      cidr_routing_policy = optional(object({<br/>        collection_id = string<br/>        location_name = string<br/>      }))<br/><br/>      failover_routing_policy = optional(object({<br/>        type = string<br/>      }))<br/><br/>      geolocation_routing_policy = optional(object({<br/>        continent   = optional(string)<br/>        country     = optional(string)<br/>        subdivision = optional(string)<br/>      }))<br/><br/>      geoproximity_routing_policy = optional(object({<br/>        aws_region       = optional(string)<br/>        bias             = optional(number)<br/>        local_zone_group = optional(string)<br/>        coordinates = optional(object({<br/>          latitude  = string<br/>          longitude = string<br/>        }))<br/>      }))<br/><br/>      latency_routing_policy = optional(object({<br/>        region = string<br/>      }))<br/><br/>      weighted_routing_policy = optional(object({<br/>        weight = number<br/>      }))<br/><br/>      multivalue_answer_routing_policy = optional(bool)<br/>      allow_overwrite                  = optional(bool)<br/>    })), {})<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route53_zone_arns"></a> [route53\_zone\_arns](#output\_route53\_zone\_arns) | The Amazon Resource Name (ARN) of the Hosted Zone. |
| <a name="output_route53_zone_ids"></a> [route53\_zone\_ids](#output\_route53\_zone\_ids) | The Hosted Zone ID. This can be referenced by zone records. |
| <a name="output_route53_zone_name_servers"></a> [route53\_zone\_name\_servers](#output\_route53\_zone\_name\_servers) | A list of name servers in associated (or default) delegation set. |
| <a name="output_route53_zone_tags_all"></a> [route53\_zone\_tags\_all](#output\_route53\_zone\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block. |
| <a name="output_route53_record_names"></a> [route53\_record\_names](#output\_route53\_record\_names) | The name of the record. |
| <a name="output_route53_record_fqdns"></a> [route53\_record\_fqdns](#output\_route53\_record\_fqdns) | FQDN built using the zone domain and name. |
