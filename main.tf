data "aws_route53_zone" "zone" {
  name   = var.tld
  vpc_id = var.vpc_id
}

locals {
  route53_records = {
    for key, record in var.records :
    (endswith(key, "|${record.type}") ? key : "${key}|${record.type}") => {
      name    = endswith(key, "|${record.type}") ? trimsuffix(key, "|${record.type}") : key
      type    = record.type
      ttl     = try(record.ttl, "60")
      records = record.value
    }
  }
}

resource "aws_route53_record" "records" {
  for_each = local.route53_records
  zone_id  = data.aws_route53_zone.zone.id
  name     = "${regex("^.", each.value.name) != "@" ? "${each.value.name}." : ""}${var.tld}."
  type     = each.value.type
  ttl      = each.value.ttl
  records  = each.value.records
}
