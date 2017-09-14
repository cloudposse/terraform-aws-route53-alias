variable "aliases" {
  type = "list"
}

variable "zone_id" {}

variable "target_dns_name" {}

variable "target_zone_id" {}

variable "evaluate_target_health" {
  default = "false"
}
