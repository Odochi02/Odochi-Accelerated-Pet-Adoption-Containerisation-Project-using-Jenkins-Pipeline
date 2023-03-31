#certificate
/*resource "aws_acm_certificate" "OAPACPUJPcert" {
  domain_name       = "odoo.lol"
  validation_method = "DNS"

  tags = {
    Environment = "OAPACPUJPcert"
  }

  lifecycle {
    create_before_destroy = true
  }
}





# get details about a route 53 hosted zone
data "aws_route53_zone" "OAPACPUJProute53_zone" {
  name         = "mowadola.com"
  private_zone = false
}

# create a record set in route 53 for domain validatation
resource "aws_route53_record" "OAPACPUJP_record" {
  for_each = {
    for dvo in aws_acm_certificate.sskeu1cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.OAPACPUJProute53_zone.zone_id
}

# validate acm certificates
resource "aws_acm_certificate_validation" "acm_certificate_validation" {
  certificate_arn         = aws_acm_certificate.OAPACPUJPcert.arn
  validation_record_fqdns = [for record in aws_route53_record.OAPACPUJP_record : record.fqdn]
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.OAPACPUJProute53_zone.zone_id
  name    = "odoo.lol"
  type    = "A"

  alias {
    name                   = aws_lb.OAPACPUJP-lb.dns_name
    zone_id                = aws_lb.OAPACPUJP-lb.zone_id
    evaluate_target_health = true
  }
}*/


