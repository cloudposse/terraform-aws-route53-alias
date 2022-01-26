data "aws_route53_zone" "default" {
  count        = module.this.enabled && length(compact(var.aliases)) > 0 ? 1 : 0
  zone_id      = var.parent_zone_id
  name         = var.parent_zone_name
  private_zone = var.private_zone
}

resource "aws_route53_record" "default" {
  for_each        = module.this.enabled ? toset(compact(var.aliases)) : []
  zone_id         = try(data.aws_route53_zone.default[0].zone_id, "")
  name            = each.key
  allow_overwrite = var.allow_overwrite
  type            = "A"

  alias {
    name                   = var.target_dns_name
    zone_id                = var.target_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}

resource "aws_route53_record" "ipv6" {
  for_each        = module.this.enabled && var.ipv6_enabled ? toset(compact(var.aliases)) : []
  zone_id         = try(data.aws_route53_zone.default[0].zone_id, "")
  name            = each.key
  allow_overwrite = var.allow_overwrite
  type            = "AAAA"

  alias {
    name                   = var.target_dns_name
    zone_id                = var.target_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}
