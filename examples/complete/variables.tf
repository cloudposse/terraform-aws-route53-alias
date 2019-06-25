variable "region" {
  type = string
}

variable "aliases" {
  type        = list(string)
  description = "List of aliases"
}

variable "parent_zone_id" {
  type        = string
  description = "ID of the hosted zone to contain this record  (or specify `parent_zone_name`)"
}

variable "target_zone_id" {
  type        = string
  description = "ID of target resource (e.g. ALB, ELB)"
}

variable "target_dns_name" {
  type        = string
  description = "DNS name of target resource (e.g. ALB, ELB)"
}
