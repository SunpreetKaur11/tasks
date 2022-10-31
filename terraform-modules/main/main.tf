module "s3_module" {
    source = "../modules/s3"
    
    Environment="devops"
    Project="devops"
    Owner="devops"
    ApplicationName="devops"
    S3canonicaUserId="devops"
    S3ServerAccessBucket="devops"
    region="ap-south-1"
    
}

