output "frontend_bucket_regional_domain_name" {
  value = aws_s3_bucket.frontend.bucket_regional_domain_name
  description = "The regional domain name of the S3 bucket"
}
