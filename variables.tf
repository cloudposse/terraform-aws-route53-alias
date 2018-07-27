variable "aliases" {
  type = "list"
}

variable "parent_zone_id" {
  default = ""
}

variable "parent_zone_name" {
  default = ""
}

variable "target_dns_name" {}

variable "target_zone_id" {}

variable "evaluate_target_health" {
  default = "false"
}

variable "enabled" {
  type        = "string"
  default     = "true"
  description = "Set to false to prevent the module from creating any resources"
}
