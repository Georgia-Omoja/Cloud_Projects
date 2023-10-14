# **HOSTING A STATIC WEBSITE ON AWS**
In this project, I am setting up a static website on AWS via Terraform. In this case, the website serves as my Portfolio site. Throughout the project, I'll be using terraform configuration files to achieve the following tasks:

1. Develop S3 Buckets for effectively hosting the website's pages.
2. Establish a hosted zone and take charge of its DNS record management.
3. Configure Route 53 to establish a connection between the domain name and the website.
4. Generate an SSL certificate for the website using AWS Certificate Manager (ACM).
5. Create CloudFront distributions to enhance website security through HTTPS encryption.

The website's page files that will be utilized and hosted on the S3 Bucket are already available within the repository.

## CLOUD SERVICES USED
- AWS ROUTE 53
- AWS S3 BUCKETS
- AWS Certificate Manager
- AWS CloudFront

## PRE-REQUISITES
- Terraform installed in your machine
- AWS CLI installed and cloud credentials configured.
- Registered domain  (You can get a free domain by signing up for github education and its student developer)
- Website templates/files