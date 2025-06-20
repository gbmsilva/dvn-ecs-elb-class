# data "aws_route53_zone" "this" {
#   name     = "devopsnanuvem.com"
#   provider = aws.root_account
# }

# resource "aws_acm_certificate_validation" "this" {
#   certificate_arn         = aws_acm_certificate.this.arn
#   validation_record_fqdns = [for record in aws_route53_record.certificate_validation : record.fqdn]
# }

# resource "aws_route53_record" "certificate_validation" {
#   for_each = {
#     for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name => {
#       name   = dvo.resource_record_name
#       record = dvo.resource_record_value
#       type   = dvo.resource_record_type
#     }
#   }
#   provider = aws.root_account
#   allow_overwrite = true
#   name            = each.value.name
#   records         = [each.value.record]
#   ttl             = 60
#   type            = each.value.type
#   zone_id         = data.aws_route53_zone.this.zone_id
# }

