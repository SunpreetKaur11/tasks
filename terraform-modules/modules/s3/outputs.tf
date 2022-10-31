
# output "account_id" {
#   value = data.aws_caller_identity.current.account_id
# }
# output "S3 Bucket name" {
#   value = "${var.Environment}-${var.Project}-${var.ApplicationName}-${var.region}-${data.aws_caller_identity.current.account_id}"
# }

output "S3_bucket_name" {
  value = "${var.Environment}-${var.Project}-${var.ApplicationName}-${var.region}-${data.aws_caller_identity.current.account_id}"
}

output "S3_bucket_domain_name" {
  value = aws_s3_bucket.s3-bucket.bucket_domain_name
}

# output "S3_bucket_regional_domain_name" {
#   value = aws_s3_bucket.s3-bucket.bucket_regional_domain_name
# }

output "S3_bucket_website_endpoint" {
  value = aws_s3_bucket.s3-bucket.website_endpoint
}













