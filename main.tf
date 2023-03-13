data "aws_route53_zone" "zone" {
  name         = var.tld
  vpc_id       = var.vpc_id
}

resource "aws_route53_record" "records" {

  for_each = var.records
  zone_id  = data.aws_route53_zone.zone.id
  name     = "${regex("^.", each.key) != "@" ? "${each.key}." : ""}${var.tld}."
  type     = each.value.type
  ttl      = "60"
  records  = each.value.value

}