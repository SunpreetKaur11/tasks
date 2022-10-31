resource "aws_s3_bucket" "s3-bucket" {
bucket="${var.Environment}-${var.Project}-${var.ApplicationName}-${var.region}-${data.aws_caller_identity.current.account_id}"
acl    = "public-read"

  website {
    index_document = "index.html"                                   
  }                                                                                                                             
tags = {
  Project = var.Project
  Environment = var.Environment
  Owner = var.Owner
}     
}

# resource "aws_s3_bucket_acl" "example_bucket_acl" {
# bucket  = aws_s3_bucket.s3-bucket.id
# acl    = "public-read"
# }

   resource "aws_s3_bucket_server_side_encryption_configuration" "s3-encryption" {
     bucket = aws_s3_bucket.s3-bucket.id
     
               rule {                                                                  
       apply_server_side_encryption_by_default {
         sse_algorithm     = "AES256"
       }
     }
   }
          
resource "aws_s3_bucket_lifecycle_configuration" "s3-lifecycle-config" {
  bucket = aws_s3_bucket.s3-bucket.id

  rule {
    id = "NoncurrentVersionToGlacierAfter90Days"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER"
    }                                        
}
}


 resource "aws_s3_bucket_versioning" "s3-versioning" {

   bucket = aws_s3_bucket.s3-bucket.id
   versioning_configuration {
  
   status = "Enabled"
  }
  
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:*"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.s3-bucket.id}/*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.origin_access_identity.id}"]
    }
  }
}
 

resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.s3-bucket.id
  policy = data.aws_iam_policy_document.s3_policy.json
}
 
resource "aws_s3_bucket_logging" "s3-logging" {
  
  bucket = aws_s3_bucket.s3-bucket.id
  target_bucket = "poc-s3-access-log"
  target_prefix = "logs/${var.Environment}-${var.Project}-${var.ApplicationName}-${var.region}-${data.aws_caller_identity.current.account_id}"
}
 
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
 
}
 
resource "aws_s3_bucket_public_access_block" "s3-Public" {
bucket = "${aws_s3_bucket.s3-bucket.id}"
block_public_acls = true
block_public_policy = true
ignore_public_acls      = true
restrict_public_buckets = true
}                                                                                                                     
 
data "aws_caller_identity" "current" {

}
 







