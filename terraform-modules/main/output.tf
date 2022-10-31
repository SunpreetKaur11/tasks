#output "S3_bucket_name" {
#value = "${var.Environment}-${var.Project}-${var.ApplicationName}-${var.region}-${data.aws_caller_identity.current.account_id}"
#}

#output "S3_bucket_domain_name" {
#value = aws_s3_bucket.s3-bucket.bucket_domain_name
#}

output "S3_bucket_name" {
  value = module.s3_module.S3_bucket_name
}

output "S3_bucket_domain_name" {
  value = module.s3_module.S3_bucket_domain_name
}

output "S3_bucket_regional_domain_name" {
  value = module.s3_module.S3_bucket_domain_name
}

output "S3_bucket_website_endpoint" {
  value = module.s3_module.S3_bucket_website_endpoint
}