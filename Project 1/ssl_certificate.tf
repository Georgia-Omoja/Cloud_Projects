# Request Certificate
 resource "aws_acm_certificate" "my_domain_certificate" {
  domain_name       = "georgia-omoja.tech"
  validation_method = "DNS"
}

# Create DNS validation records required for ACM certificate validation
resource "aws_route53_record" "my_domain_validation_record" {
  for_each = {
    for dvo in aws_acm_certificate.my_domain_certificate.domain_validation_options : dvo.domain_name => {
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
  zone_id         = aws_route53_zone.my_domain_hosted_zone.zone_id
}

# Certificate Validation
resource "aws_acm_certificate_validation" "validation" {
  certificate_arn         = aws_acm_certificate.my_domain_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.my_domain_validation_record : record.fqdn]
}
