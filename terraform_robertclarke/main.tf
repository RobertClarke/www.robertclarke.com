variable "www_domain_name" {
  default = "www.robertclarke.com"
}

resource "aws_s3_bucket" "public_html" {
    provider = "aws.rjfc_prod"
    region = "us-east-1"
    acl = "public-read"
    bucket = "${var.www_domain_name}"
    policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[ 
    {
      "Sid":"PublicReadGetObject",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.www_domain_name}/*"]
    }
  ]
}
POLICY
    website {
        index_document = "index.html"
        error_document = "404.html"
    }
}