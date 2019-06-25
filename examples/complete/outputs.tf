output "hostnames" {
  value       = module.route53_alias.hostnames
  description = "List of DNS records"
}

output "parent_zone_id" {
  value       = module.route53_alias.parent_zone_id
  description = "ID of the hosted zone to contain the records"
}

output "parent_zone_name" {
  value       = module.route53_alias.parent_zone_name
  description = "Name of the hosted zone to contain the records"
}
