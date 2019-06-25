provider "aws" {
  region = var.region
}

module "route53_alias" {
  source = "../../"

  aliases         = var.aliases
  parent_zone_id  = var.parent_zone_id
  target_zone_id  = var.target_zone_id
  target_dns_name = var.target_dns_name
}
