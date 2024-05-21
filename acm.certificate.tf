resource "aws_acm_certificate" "this" {
  domain_name       = "devopsnanuvem.com"
  validation_method = "DNS"

  tags = {
    Name = "devops-na-nuvem-certificate"
  }
}
