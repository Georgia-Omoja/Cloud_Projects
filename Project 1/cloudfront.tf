# Creates and configures the CloudFront distribution for our S3 Bucket
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.main_bucket.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.main_bucket.bucket_regional_domain_name

  }

  enabled         = true
  is_ipv6_enabled = true

  aliases = "georgia-omoja.tech"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.main_bucket.bucket_regional_domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  viewer_certificate {
    acm_certificate_arn     = aws_acm_certificate.my_domain_certificate.arn
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}