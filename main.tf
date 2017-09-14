resource "aws_route53_record" "default" {
  zone_id = "${var.zone_id}"
  name    = "${var.name}"
  type    = "A"

  alias {
    name                   = "${var.target_dns_name}"
    zone_id                = "${var.target_zone_id}"
    evaluate_target_health = "${var.evaluate_target_health}"
  }
}
