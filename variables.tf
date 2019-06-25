variable "aliases" {
  type        = list(string)
  description = "List of aliases"
}

variable "parent_zone_id" {
  type        = string
  default     = ""
  description = "ID of the hosted zone to contain this record  (or specify `parent_zone_name`)"
}

variable "parent_zone_name" {
  type        = string
  default     = ""
  description = "Name of the hosted zone to contain this record (or specify `parent_zone_id`)"
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

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}
