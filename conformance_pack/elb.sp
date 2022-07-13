locals {
  conformance_pack_elb_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ELB"
  })
}

control "elb_application_classic_lb_logging_enabled" {
  title       = "ELB application and classic load balancer logging should be enabled"
  description = "Elastic Load Balancing activity is a central point of communication within an environment."
  sql         = query.elb_application_classic_lb_logging_enabled.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    nist_800_171_rev_2     = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "elb_application_lb_deletion_protection_enabled" {
  title       = "ELB application load balancer deletion protection should be enabled"
  description = "This rule ensures that Elastic Load Balancing has deletion protection enabled."
  sql         = query.elb_application_lb_deletion_protection_enabled.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    nist_800_171_rev_2     = "true"
  })
}

control "elb_application_lb_redirect_http_request_to_https" {
  title       = "ELB application load balancers should redirect HTTP requests to HTTPS"
  description = "To help protect data in transit, ensure that your Application Load Balancer automatically redirects unencrypted HTTP requests to HTTPS."
  sql         = query.elb_application_lb_redirect_http_request_to_https.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    nist_800_171_rev_2     = "true"
    rbi_cyber_security     = "true"
  })
}

control "elb_application_lb_waf_enabled" {
  title       = "ELB application load balancers should have Web Application Firewall (WAF) enabled"
  description = "Ensure AWS WAF is enabled on Elastic Load Balancers (ELB) to help protect web applications."
  sql         = query.elb_application_lb_waf_enabled.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    nist_800_171_rev_2     = "true"
    rbi_cyber_security     = "true"
  })
}

control "elb_classic_lb_use_ssl_certificate" {
  title       = "ELB classic load balancers should use SSL certificates"
  description = "Because sensitive data can exist and to help protect data at transit, ensure encryption is enabled for your Elastic Load Balancing."
  sql         = query.elb_classic_lb_use_ssl_certificate.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    nist_800_171_rev_2     = "true"
    rbi_cyber_security     = "true"
  })
}

control "elb_application_lb_drop_http_headers" {
  title       = "ELB application load balancers should be drop HTTP headers"
  description = "Ensure that your Elastic Load Balancers (ELB) are configured to drop http headers."
  sql         = query.elb_application_lb_drop_http_headers.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_low_rev_4  = "true"
    hipaa              = "true"
    gdpr               = "true"
    nist_800_53_rev_4  = "true"
    nist_800_171_rev_2 = "true"
    rbi_cyber_security = "true"
  })
}

control "elb_classic_lb_use_tls_https_listeners" {
  title       = "ELB classic load balancers should only use SSL or HTTPS listeners"
  description = "Ensure that your Elastic Load Balancers (ELBs) are configured with SSL or HTTPS listeners. Because sensitive data can exist, enable encryption in transit to help protect that data."
  sql         = query.elb_classic_lb_use_tls_https_listeners.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gdpr                   = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_800_171_rev_2     = "true"
    rbi_cyber_security     = "true"
  })
}

control "elb_classic_lb_cross_zone_load_balancing_enabled" {
  title       = "ELB classic load balancers should have cross-zone load balancing enabled"
  description = "Enable cross-zone load balancing for your Elastic Load Balancers (ELBs) to help maintain adequate capacity and availability. The cross-zone load balancing reduces the need to maintain equivalent numbers of instances in each enabled availability zone."
  sql         = query.elb_classic_lb_cross_zone_load_balancing_enabled.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    nist_800_171_rev_2     = "true"
  })
}

control "elb_application_network_lb_use_ssl_certificate" {
  title       = "ELB application and network load balancers should only use SSL or HTTPS listeners"
  description = "Ensure if Application Load Balancers and Network Load Balancers are configured to use certificates from AWS Certificate Manager (ACM). This rule is complaint if at least 1 load balancer is configured without a certificate from ACM."
  sql         = query.elb_application_network_lb_use_ssl_certificate.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_53_rev_5      = "true"
    nist_800_171_rev_2     = "true"
    rbi_cyber_security     = "true"
  })
}

control "elb_listener_use_secure_ssl_cipher" {
  title       = "ELB listeners should use secure SSL cipher"
  description = "Ensure that ELB listeners do not have any insecure SSL ciphers. Using insecure and deprecated ciphers for your ELB Predefined Security Policy or Custom Security Policy could make the SSL connection between the client and the load balancer vulnerable to exploits."
  sql         = query.elb_listener_use_secure_ssl_cipher.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_application_classic_network_lb_prohibit_public_access" {
  title       = "ELB load balancers should prohibit public access"
  description = "An internet facing load balancer has a publicly resolvable DNS name, so it can route requests from clients over the internet to the EC2 instances that are registered with the load balancer."
  sql         = query.elb_application_classic_network_lb_prohibit_public_access.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_application_lb_with_outbound_rule" {
  title       = "ELB application load balancers should have at least one outbound rule"
  description = "Ensure application load balancers have at least one outbound rule in all the attached security groups. A security group without any outbound rule rejects all outgoing traffic. This means that all outgoing traffic originating from your cloud assets (instances, containers, etc.) will be dropped when it reaches the ELB layer."
  sql         = query.elb_application_lb_with_outbound_rule.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_classic_lb_with_outbound_rule" {
  title       = "ELB classic load balancers should have at least one outbound rule"
  description = "Ensure classic load balancers have at least one outbound rule in all the attached security groups. A security group without any outbound rule rejects all outgoing traffic. This means that all outgoing traffic originating from your cloud assets (instances, containers, etc.) will be dropped when it reaches the ELB layer."
  sql         = query.elb_classic_lb_with_outbound_rule.sql

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

