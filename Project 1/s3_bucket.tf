# Create Bucket with the name set to domain name created
resource "aws_s3_bucket" "main_bucket" {
  bucket = "georgia-omoja.tech"

}

# Allow Public Access
resource "aws_s3_bucket_public_access_block" "main_bucket_public_access_block" {
  bucket = aws_s3_bucket.main_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Upload Files/Folder into bucket
resource "aws_s3_object" "portfolio" {
  for_each = fileset("./portfolio/", "**")
  bucket = aws_s3_bucket.main_bucket.id
  key = each.value
  source = "./portfolio/${each.value}"
  etag = filemd5("./portfolio/${each.value}")
}

# Allow read rights to objects in the buckets
resource "aws_s3_bucket_policy" "main_bucket_policy" {  
  bucket = aws_s3_bucket.main_bucket.id   
policy = <<POLICY
{    
    "Version": "2012-10-17",    
    "Statement": [        
      {            
          "Sid": "PublicReadGetObject",            
          "Effect": "Allow",            
          "Principal": "*",            
          "Action": [                
             "s3:GetObject"            
          ],            
          "Resource": [
             "arn:aws:s3:::${aws_s3_bucket.main_bucket.id}/*"            
          ]        
      }    
    ]
}
POLICY
}

# Enable static website hosting
resource "aws_s3_bucket_website_configuration" "main_bucket_website_configuration" {
  bucket = aws_s3_bucket.main_bucket.id

  index_document {
    suffix = "index.html"
  }

}