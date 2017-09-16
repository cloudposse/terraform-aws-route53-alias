output "hostname" {
  value = "${aws_route53_record.default.*.fqdn}"
}

output "parent_zone_id" {
  value = "${null_resource.parent.triggers.zone_id}"
}

output "parent_zone_name" {
  value = "${null_resource.parent.triggers.zone_name}"
}
