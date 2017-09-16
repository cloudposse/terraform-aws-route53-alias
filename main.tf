resource "null_resource" "parent" {
  triggers = {
    zone_id   = "${format("%v", length(var.parent_zone_id) > 0 ? join(" ", data.aws_route53_zone.parent_by_zone_id.*.zone_id) : join(" ", data.aws_route53_zone.parent_by_zone_name.*.zone_id) )}"
    zone_name = "${format("%v", length(var.parent_zone_id) > 0 ? join(" ", data.aws_route53_zone.parent_by_zone_id.*.name) : join(" ", data.aws_route53_zone.parent_by_zone_name.*.name) )}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_route53_zone" "parent_by_zone_id" {
  count   = "${signum(length(var.parent_zone_id))}"
  zone_id = "${var.parent_zone_id}"
}

data "aws_route53_zone" "parent_by_zone_name" {
  count = "${signum(length(var.parent_zone_name))}"
  name  = "${var.parent_zone_name}"
}

resource "aws_route53_record" "default" {
  count   = "${length(var.aliases)}"
  zone_id = "${null_resource.parent.triggers.zone_id}"
  name    = "${var.aliases[count.index]}"
  type    = "A"

  alias {
    name                   = "${var.target_dns_name}"
    zone_id                = "${var.target_zone_id}"
    evaluate_target_health = "${var.evaluate_target_health}"
  }
}
