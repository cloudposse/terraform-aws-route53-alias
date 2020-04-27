## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aliases | List of aliases | list(string) | - | yes |
| allow_overwrite | Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments | bool | `false` | no |
| enabled | Set to false to prevent the module from creating any resources | bool | `true` | no |
| evaluate_target_health | Set to true if you want Route 53 to determine whether to respond to DNS queries | bool | `false` | no |
| ipv6_enabled | Set to true to enable an AAAA DNS record to be set as well as the A record | bool | `false` | no |
| parent_zone_id | ID of the hosted zone to contain this record  (or specify `parent_zone_name`) | string | `` | no |
| parent_zone_name | Name of the hosted zone to contain this record (or specify `parent_zone_id`) | string | `` | no |
| private_zone | Is this a private hosted zone? | bool | `false` | no |
| target_dns_name | DNS name of target resource (e.g. ALB, ELB) | string | - | yes |
| target_zone_id | ID of target resource (e.g. ALB, ELB) | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| hostnames | List of DNS records |
| parent_zone_id | ID of the hosted zone to contain the records |
| parent_zone_name | Name of the hosted zone to contain the records |

