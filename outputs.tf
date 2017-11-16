output "hostnames" {
  value = "${aws_route53_record.default.*.fqdn}"
}

output "parent_zone_id" {
  value = "${data.aws_route53_zone.default.*.zone_id}"
}

output "parent_zone_name" {
  value = "${data.aws_route53_zone.default.*.name}"
}
