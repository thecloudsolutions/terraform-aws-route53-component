<!-- markdownlint-disable -->
[![Release](https://img.shields.io/github/v/release/thecloudsolutions/terraform-aws-route53-component?style=for-the-badge&color=6150E8)](https://github.com/thecloudsolutions/terraform-aws-route53-component/releases)
[![Commit](https://img.shields.io/github/last-commit/thecloudsolutions/terraform-aws-route53-component?style=for-the-badge&color=FF9800)](https://github.com/thecloudsolutions/terraform-aws-route53-component/commits)
[![Issues](https://img.shields.io/github/issues/thecloudsolutions/terraform-aws-route53-component?style=for-the-badge&color=BB019E)](https://github.com/thecloudsolutions/terraform-aws-route53-component/issues)
[![Terraform](https://img.shields.io/badge/terraform-1.5.5-%20?style=for-the-badge&color=009FD2)](https://github.com/hashicorp/terraform/blob/v1.5/CHANGELOG.md#155-august-9-2023)
[![License](https://img.shields.io/github/license/thecloudsolutions/terraform-aws-route53-component?style=for-the-badge&color=3FB950)](https://github.com/thecloudsolutions/terraform-aws-route53-component/blob/main/LICENSE)

# terraform-aws-route53-component

[![Cloud Solutions Banner][banner]](https://thecloudsolutions.com/)

[![Sponsor Us](https://img.shields.io/badge/sponsor_us-FF9800?style=for-the-badge)](https://github.com/sponsors/thecloudsolutions)
[![Hire Us](https://img.shields.io/badge/hire_us-009FD2?style=for-the-badge)](https://thecloudsolutions.com/contact-us)
[![Maintained By](https://img.shields.io/badge/maintained_by-Cloud_Solutions-6150E8?style=for-the-badge)](https://thecloudsolutions.com/)

## Description

Terraform component that creates and manages Amazon Route 53 hosted zones and DNS records. Supports A, CNAME, MX, TXT, and alias records with configurable routing policies.

## Variable Naming

In all Cloud Solutions **components** and **modules**, we intentionally use the _map suffix for input variables that accept map(object(...)).

For example:
```hcl
variable "route53_map" {
  type        = map(object({ ... }))
  description = "Keyed collection of route53 definitions"
}
```
⚠️ This is a deliberate deviation from [Terraform Style Guide](https://developer.hashicorp.com/terraform/language/syntax/style).

We fully acknowledge that this naming convention does not follow the Terraform style guide, which recommends naming variables based on what they represent, not how they're implemented. We understand this, and want to emphasize:

1. This is a deliberate, informed decision, not an oversight.
2. Our primary goal is clarity and consistency for developers using our modules.
3. The intent is to give users immediate understanding of what kind of structure they're supplying.

### ✅ Why we made this decision (for our components and modules only)

This convention exists only within our components and modules structure. Here's why it works well for us:

1. Instant clarity for users - The _map suffix immediately signals that the variable supports multiple instances, each keyed by name. This avoids confusion around whether a variable is singular or plural.
2. Uniformity across all resources - Instead of struggling with awkward plurals (like kmses, rdses, vpcs, cloudfronts, account_managements) or inconsistent suffixes (_configs, _definitions, etc.), we use one simple, predictable pattern.
3. Avoids naming collisions - The _map suffix never conflicts with native Terraform or AWS resource types.
4. Future-proof for contributors - When contributors see _map, they can safely assume the structure is a map(object(...)) without checking variables.tf.

### 🙌 What this means for contributors

If you're contributing to Cloud Solutions components or modules, please:

1. Use the _map suffix when introducing a new map(object(...)) variable.
2. Follow the naming pattern consistently: rds_map, vpc_map, cloudfront_map, etc.
3. Don't apply this convention to Terraform projects outside components or modules - it's a local convention, not a global best practice.

If you have strong opinions or ideas for evolving this standard, you're welcome to open a discussion.

## Usage

```hcl
module "terraform-aws-route53-component" {
  source = "thecloudsolutions/terraform-aws-route53-component"
  # Cloud Solutions recommends to pin every module to a specific version
  # version = "x.x.x"

  # Required variables
  route53_map = {
    key = <value>
  }
}
```

> [!IMPORTANT]
> In our examples we don't pin modules to specific versions to keep the documentation aligned with the latest releases.
> However, for your own projects, we recommend to pin each module to the exact version you're using. This approach helps maintain the stability of your infrastructure.
> Additionally, adopting a structured process for version updates will help prevent unexpected changes.

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

## Quick Start

The project is under active development, and we welcome all contributors! 🎉
  
Before you start, please review our [Contributor Guidelines](https://github.com/thecloudsolutions/.github/blob/main/CONTRIBUTING.md) to understand the expectations and processes.
  
Follow these steps to get started:
  
---
  
### 1. **Fork the Repository**
- Click the **"Fork"** button on the repository's GitHub page to create a copy under your GitHub account.

> [!TIP]
> If you're new to GitHub, check out the [GitHub Docs](https://docs.github.com/en/get-started) to familiarize yourself with key concepts like forking, branching, and pull requests.
  
### 2. **Clone the Fork**
- Clone your fork to your local machine using:
  ```bash
  git clone https://github.com/<your-username>/<repository-name>.git
  ```
  
### 3. **Create a Branch**
- Create a new branch for your contribution:
  ```bash
  git checkout -b your-feature-name
  ```
  
### 4. **Make Changes**
- Implement your changes in the codebase.
- Ensure you follow the project's style guide and standards.
  
> [!WARNING]
> Always adhere to the project's coding standards and best practices outlined in the [CONTRIBUTING.md](https://github.com/thecloudsolutions/.github/blob/main/CONTRIBUTING.md) file.
    
### 5. **Test Your Changes**
- Run tests to verify your changes locally.
- Follow any project-specific testing instructions.
    
### 6. **Commit Your Changes**
- Stage and commit your changes with a clear and concise message:
  ```bash
  git add .
  git commit -m "Add description of the change"
  ```

> [!NOTE]
> Use meaningful commit messages in the present tense (e.g., "Add feature X" instead of "Added feature X").
  
### 7. **Push Your Branch**
- Push your branch to your fork:
  ```bash
  git push origin your-feature-name
  ```
    
### 8. **Open a Pull Request (PR)**
- Navigate to the original repository and click the **"New Pull Request"** button.
- Select your branch and submit your PR following the [Pull Request template](https://github.com/thecloudsolutions/.github/blob/main/.github/PULL_REQUEST_TEMPLATE/pull_request_template.md).
- Use keywords like `Closes #123` to link your PR to a related issue.
  
### **🎉 Congratulations, you’ve made your first contribution! 🎉**  
We appreciate your effort and look forward to reviewing your work.

## About Us

**Cloud Solutions: Innovating Open Source for AWS & DevOps**

Cloud Solutions creates and maintains free, open-source tools to help startups thrive in the AWS Cloud and DevOps space. Our mission is to make advanced technology accessible to businesses of all sizes.

With years of experience and a commitment to innovation, we design solutions that simplify workflows, encourage collaboration, and drive growth - removing cost barriers along the way. Every contribution brings us closer to a future where technology empowers all.

Your support makes everything we do possible.

Thank you for being part of our journey to empower innovation and build a stronger Open Source future!

## Contributing

The project is under active development, and we welcome all contributors! 🎉 

Before you start, please review our [Contributor Guidelines](CONTRIBUTING.md) to understand the expectations and processes.

## Blog

Link to our [blog](https://thecloudsolutions.com/blog), where you can explore in-depth articles. Gain valuable insights and expert analysis on AWS cloud solution strategies and trends.

## License

The project is 100% Open Source and licensed under the [APACHE2](LICENSE).

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## Copyrights

Copyright © 2020-2026 [Cloud Solutions](https://thecloudsolutions.com)

[banner]: https://github.com/thecloudsolutions/.github/blob/main/profile/banner.png