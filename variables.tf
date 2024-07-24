variable "aliases" {
  type        = list(string)
  description = "List of aliases"
}

variable "parent_zone_id" {
  type        = string
  default     = null
  description = "ID of the hosted zone to contain this record  (or specify `parent_zone_name`)"
}

variable "parent_zone_name" {
  type        = string
  default     = null
  description = "Name of the hosted zone to contain this record (or specify `parent_zone_id`)"
}

variable "private_zone" {
  type        = bool
  default     = false
  description = "Is this a private hosted zone?"
}

variable "target_dns_name" {
  type        = string
  description = "DNS name of target resource (e.g. ALB, ELB)"
}

variable "target_zone_id" {
  type        = string
  description = "ID of target resource (e.g. ALB, ELB)"
}

variable "evaluate_target_health" {
  type        = bool
  default     = false
  description = "Set to true if you want Route 53 to determine whether to respond to DNS queries"
}

variable "ipv6_enabled" {
  type        = bool
  default     = false
  description = "Set to true to enable an AAAA DNS record to be set as well as the A record"
}

variable "allow_overwrite" {
  type        = bool
  default     = false
  description = "Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments"
}
