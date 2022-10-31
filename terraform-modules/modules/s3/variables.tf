variable "Environment" {
    description = "Select Environment"
    type = string
    # default=["int","stg","preprod","prd"]
    # default = "int"
}

variable "Project" {
    description = "Select Project"
    type = string
}
 
variable "Owner" {
    description = "Select Owner"
    type = string
}
  
variable "ApplicationName" {
  description = "Name of the applicaton to host in s3.  eg:- storybook, uilab, cra, mp, cra-something, mp-something..etc    Should be meaningful so that we can identify the bucket's usage from the name."
  type = string
  default = "cra"
}  
  
variable "S3canonicaUserId" {
  type = string
  description = "S3 canonical user id from the cloudfront origin access identity."
}

  variable "S3ServerAccessBucket" {
    description = "Server access log bucket"
    type = string   
    default = "/cloudformation/serversccesslog/s3-bucket-name"
  }

variable "RootDomain" {
    type = map(object({
    origin     = string
    yubiorigin = string
  }))
      default = {
          "int"= {
              "origin"="*.credavenue.in"
              "yubiorigin"= "*.go-yubi.in"
          },
          "stg"={
              "origin"= "*.credavenue.in"
              "yubiorigin"= "*.go-yubi.in"
          },
          "prd"={
               "origin"= "*.credavenue.com"
               "yubiorigin"= "*.go-yubi.com"
          }
      }
}
variable "region" {
  type=string
}

