variable "name" {
  default = "dns"
}

variable "zone_id" {}

variable "elb_dns_name" {}

variable "elb_zone_id" {}

variable "evaluate_target_health" {
  default = "false"
}
