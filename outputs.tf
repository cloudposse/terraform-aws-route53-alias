output "hostnames" {
  value       = aws_route53_record.default.*.fqdn
  description = "List of DNS records"
}

output "parent_zone_id" {
  value       = join("", data.aws_route53_zone.default.*.zone_id)
  description = "ID of the hosted zone to contain the records"
}

output "parent_zone_name" {
  value       = join("", data.aws_route53_zone.default.*.name)
  description = "Name of the hosted zone to contain the records"
}
