locals {
  conformance_pack_elb_common_tags = {
    service = "elb"
  }
}

control "elb_application_classic_lb_logging_enabled" {
  title       = "ELB application and classic load balancer logging should be enabled"
  description = "Elastic Load Balancing activity is a central point of communication within an environment."
  sql         = query.elb_application_classic_lb_logging_enabled.sql
  tags        = local.conformance_pack_elb_common_tags
}

control "elb_application_lb_deletion_protection_enabled" {
  title       = "ELB application load balancer deletion protection should be enabled"
  description = "This rule ensures that Elastic Load Balancing has deletion protection enabled."
  sql         = query.elb_application_lb_deletion_protection_enabled.sql
  tags        = local.conformance_pack_elb_common_tags
}

control "elb_application_lb_redirect_http_request_to_https" {
  title       = "ELB application load balancers should redirect HTTP requests to HTTPS"
  description = "To help protect data in transit, ensure that your Application Load Balancer automatically redirects unencrypted HTTP requests to HTTPS."
  sql         = query.elb_application_lb_redirect_http_request_to_https.sql
  tags        = local.conformance_pack_elb_common_tags
}

control "elb_application_waf_enabled" {
  title       = "Web Application Firewall (WAF) should be enabled on Application Load Balancers"
  description = "Ensure AWS WAF is enabled on Elastic Load Balancers (ELB) to help protect web applications."
  sql         = query.elb_application_waf_enabled.sql
  tags        = local.conformance_pack_elb_common_tags
}

control "elb_classic_lb_use_ssl_certificate" {
  title       = "ELB classic load balancers should use SSL certificates"
  description = "Because sensitive data can exist and to help protect data at transit, ensure encryption is enabled for your Elastic Load Balancing."
  sql         = query.elb_classic_lb_use_ssl_certificate.sql
  tags        = local.conformance_pack_elb_common_tags
}