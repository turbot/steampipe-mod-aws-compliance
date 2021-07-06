locals {
  conformance_pack_elb_common_tags = {
    service = "elb"
  }
}

control "elb_application_classic_lb_logging_enabled" {
  title       = "ELB application and classic load balancer logging should be enabled"
  description = "Elastic Load Balancing activity is a central point of communication within an environment."
  sql         = query.elb_application_classic_lb_logging_enabled.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "elb_application_lb_deletion_protection_enabled" {
  title       = "ELB application load balancer deletion protection should be enabled"
  description = "This rule ensures that Elastic Load Balancing has deletion protection enabled."
  sql         = query.elb_application_lb_deletion_protection_enabled.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    hipaa    = "true"
    nist_csf = "true"
  })
}

control "elb_application_lb_redirect_http_request_to_https" {
  title       = "ELB application load balancers should redirect HTTP requests to HTTPS"
  description = "To help protect data in transit, ensure that your Application Load Balancer automatically redirects unencrypted HTTP requests to HTTPS."
  sql         = query.elb_application_lb_redirect_http_request_to_https.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "elb_application_lb_waf_enabled" {
  title       = "ELB application load balancers should have Web Application Firewall (WAF) enabled"
  description = "Ensure AWS WAF is enabled on Elastic Load Balancers (ELB) to help protect web applications."
  sql         = query.elb_application_lb_waf_enabled.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    rbi_cyber_security = "true"
  })
}

control "elb_classic_lb_use_ssl_certificate" {
  title       = "ELB classic load balancers should use SSL certificates"
  description = "Because sensitive data can exist and to help protect data at transit, ensure encryption is enabled for your Elastic Load Balancing."
  sql         = query.elb_classic_lb_use_ssl_certificate.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    hipaa              = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
    rbi_cyber_security = "true"
  })
}

control "elb_application_lb_drop_http_headers" {
  title       = "ELB application load balancers should be drop HTTP headers"
  description = "Ensure that your Elastic Load Balancers (ELB) are configured to drop http headers."
  sql         = query.elb_application_lb_drop_http_headers.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    nist_800_53_rev_4  = "true"
    rbi_cyber_security = "true"
  })
}

control "elb_classic_lb_use_tls_https_listeners" {
  title       = "ELB classic load balancers should only use SSL or HTTPS listeners"
  description = "Ensure that your Elastic Load Balancers (ELBs) are configured with SSL or HTTPS listeners. Because sensitive data can exist, enable encryption in transit to help protect that data."
  sql         = query.elb_classic_lb_use_tls_https_listeners.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    nist_800_53_rev_4  = "true"
    rbi_cyber_security = "true"
  })
}