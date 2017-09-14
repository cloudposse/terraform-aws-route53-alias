# tf_vanity

Terraform Module to that implements "vanity" host names (e.g. `brand.com`) as `ALIAS` records to a another Route53 DNS resource record (e.g. ELB/ALB, or CloudFront Distribution).

## Usage

This will define a `A` resource record for `www.example.com` as an alias of the `aws_elb.example.dns_name`. 

```
module "production_www" {
  source          = "git::https://github.com/cloudposse/tf_vanity?ref=tags/0.2.0"
  name            = "www.example.com."
  zone_id         = "${var.parent_zone_id}"
  target_dns_name = "${aws_elb.example.dns_name}"
  target_zone_id  = "${aws_elb.example.zone_id}"
}
```
