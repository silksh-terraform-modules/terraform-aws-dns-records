data "aws_route53_zone" "zone" {
  name         = var.tld
  private_zone = var.is_private_zone
}

resource "aws_route53_record" "records" {

  for_each = var.records
  zone_id  = data.aws_route53_zone.zone.id
  name     = "${regex("^.", each.key) != "@" ? "${each.key}." : ""}${var.tld}."
  type     = each.value.type
  ttl      = "60"
  records  = each.value.value

}