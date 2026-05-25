data "aws_route53_zone" "zone" {
  name   = var.tld
  vpc_id = var.vpc_id
}

locals {
  # Wartość w mapie records to albo pojedynczy rekord { type, value, ... },
  # albo lista rekordów tej samej nazwy DNS (np. A + TXT pod kluczem "old").
  record_entries = flatten([
    for map_key, entry in var.records : (
      contains(keys(entry), "type") ? [
        {
          map_key = map_key
          type    = entry.type
          ttl     = try(entry.ttl, "60")
          records = entry.value
          name    = try(entry.name, null)
        }
        ] : [
        for rec in entry : {
          map_key = map_key
          type    = rec.type
          ttl     = try(rec.ttl, "60")
          records = rec.value
          name    = try(rec.name, null)
        }
      ]
    )
  ])

  route53_records = {
    for e in local.record_entries : "${e.map_key}|${e.type}" => {
      name = coalesce(
        e.name,
        endswith(e.map_key, "|${e.type}") ? trimsuffix(e.map_key, "|${e.type}") : e.map_key
      )
      type    = e.type
      ttl     = e.ttl
      records = e.records
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
