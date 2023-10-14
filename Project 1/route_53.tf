# Create Public Hosted Zone
resource "aws_route53_zone" "my_domain_hosted_zone" {
  name = "georgia-omoja.tech"
}

# Create record for s3 bucket
resource "aws_route53_record" "main_bucket_record" {
  zone_id = aws_route53_zone.my_domain_hosted_zone.zone_id
  name    = "georgia-omoja.tech"
  type    = "A"

  alias {
    name                   = aws_s3_bucket.main_bucket.website_endpoint
    zone_id                = aws_s3_bucket.main_bucket.hosted_zone_id
    evaluate_target_health = false
  }

}