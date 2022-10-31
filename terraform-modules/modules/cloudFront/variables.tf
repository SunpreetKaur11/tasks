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
 
variable "Domain Name" {
     type = string
     description = "Enter the domain name for the website you are going to host. Eg:- uilab, cra, mp, storybook ..etc  NOTE:- Adding root domain (for eg- vivriti.in, vivriticapital.com) to the name you provide here is automatically handled.   So don't include it here."
 }


variable "Origin S3 Bucket Domain Name" {
    description = "S3 bucket domain name."
    type = string
}
 

variable "Cloud Front Origin Access Identity Id" {
    description = "CloudFront Origin Access Identity ID."
    type = string
}

# variable "Ssl Acm ertificate" {
#     description = "ACM certificate arn for ssl config."
#     type = string
#     default = "/cloudformation/devops/acm/us-east-1/yubi-domain"
# }

# variable "Web Acl Arn" {
#     type = string
#     description = "Arn for web acl waf"
# }