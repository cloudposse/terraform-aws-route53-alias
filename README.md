# tf_vanity

Terraform Module to that implements "vanity" host names (e.g. `brand.com`) as `ALIAS` records to a another Route53 DNS resource record (e.g. ELB/ALB, or CloudFront Distribution).

## Usage

This will define a `A` resource record for `www.example.com` as an alias of the `aws_elb.example.dns_name`.

```terraform
module "production_www" {
  source          = "git::https://github.com/cloudposse/tf_vanity?ref=master"
  aliases         = ["www.example.com.", "static1.cdn.example.com.", "static2.cdn.example.com"]
  zone_id         = "${var.parent_zone_id}"
  target_dns_name = "${aws_elb.example.dns_name}"
  target_zone_id  = "${aws_elb.example.zone_id}"
}
```



## Variables
|  Name                     |  Default   |  Description                                                                            | Required |
|:--------------------------|:----------:|:----------------------------------------------------------------------------------------|:--------:|
| `aliases`                 | `[]`       | List of aliases                                                                         | Yes      |
| `zone_id`                 | ``         | ID of the hosted zone to contain this record                                            | Yes      |
| `target_dns_name`         | ``         | DNS-name of target resource (e.g. ALB,ELB)                                              | Yes      |
| `target_zone_id`          | ``         | ID of target resource (e.g. ALB,ELB)                                                    | Yes      |
| `evaluate_target_health`  | `false`    | Set to true if you want Route 53 to determine whether to respond to DNS queries         | No       |

## Outputs

| Name       | Description               |
|:---------- |:--------------------------|
| `hostname` | List of DNS-records       |
