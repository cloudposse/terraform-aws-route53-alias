data "aws_route53_zone" "default" {
  count   = var.enabled == "true" ? signum(length(compact(var.aliases))) : 0
  zone_id = var.parent_zone_id
  name    = var.parent_zone_name
}

resource "aws_route53_record" "default" {
  count   = var.enabled == "true" ? length(compact(var.aliases)) : 0
  zone_id = data.aws_route53_zone.default[0].zone_id
  name    = element(compact(var.aliases), count.index)
  type    = "A"

  alias {
    name                   = var.target_dns_name
    zone_id                = var.target_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}

