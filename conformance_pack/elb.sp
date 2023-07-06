locals {
  conformance_pack_elb_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ELB"
  })
}

control "elb_application_classic_lb_logging_enabled" {
  title       = "ELB application and classic load balancer logging should be enabled"
  description = "Elastic Load Balancing activity is a central point of communication within an environment."
  query       = query.elb_application_classic_lb_logging_enabled

  tags = merge(local.conformance_pack_elb_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "elb_application_lb_deletion_protection_enabled" {
  title       = "ELB application load balancer deletion protection should be enabled"
  description = "This rule ensures that Elastic Load Balancing has deletion protection enabled."
  query       = query.elb_application_lb_deletion_protection_enabled

  tags = merge(local.conformance_pack_elb_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
  })
}

control "elb_application_lb_redirect_http_request_to_https" {
  title       = "ELB application load balancers should redirect HTTP requests to HTTPS"
  description = "To help protect data in transit, ensure that your Application Load Balancer automatically redirects unencrypted HTTP requests to HTTPS."
  query       = query.elb_application_lb_redirect_http_request_to_https

  tags = merge(local.conformance_pack_elb_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "elb_application_lb_waf_enabled" {
  title       = "ELB application load balancers should have Web Application Firewall (WAF) enabled"
  description = "Ensure AWS WAF is enabled on Elastic Load Balancers (ELB) to help protect web applications."
  query       = query.elb_application_lb_waf_enabled

  tags = merge(local.conformance_pack_elb_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    nist_800_171_rev_2     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    pci_dss_v321           = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "elb_classic_lb_use_ssl_certificate" {
  title       = "ELB classic load balancers should use SSL certificates"
  description = "Because sensitive data can exist and to help protect data at transit, ensure encryption is enabled for your Elastic Load Balancing."
  query       = query.elb_classic_lb_use_ssl_certificate

  tags = merge(local.conformance_pack_elb_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "elb_application_lb_drop_http_headers" {
  title       = "ELB application load balancers should be drop HTTP headers"
  description = "Ensure that your Elastic Load Balancers (ELB) are configured to drop http headers."
  query       = query.elb_application_lb_drop_http_headers

  tags = merge(local.conformance_pack_elb_common_tags, {
    fedramp_low_rev_4                      = "true"
    gdpr                                   = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "elb_classic_lb_use_tls_https_listeners" {
  title       = "ELB classic load balancers should only use SSL or HTTPS listeners"
  description = "Ensure that your Elastic Load Balancers (ELBs) are configured with SSL or HTTPS listeners. Because sensitive data can exist, enable encryption in transit to help protect that data."
  query       = query.elb_classic_lb_use_tls_https_listeners

  tags = merge(local.conformance_pack_elb_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

control "elb_classic_lb_cross_zone_load_balancing_enabled" {
  title       = "ELB classic load balancers should have cross-zone load balancing enabled"
  description = "Enable cross-zone load balancing for your Elastic Load Balancers (ELBs) to help maintain adequate capacity and availability. The cross-zone load balancing reduces the need to maintain equivalent numbers of instances in each enabled availability zone."
  query       = query.elb_classic_lb_cross_zone_load_balancing_enabled

  tags = merge(local.conformance_pack_elb_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
  })
}

control "elb_application_network_lb_use_ssl_certificate" {
  title       = "ELB application and network load balancers should only use SSL or HTTPS listeners"
  description = "Ensure if Application Load Balancers and Network Load Balancers are configured to use certificates from AWS Certificate Manager (ACM). This rule is compliant if at least 1 load balancer is configured without a certificate from ACM."
  query       = query.elb_application_network_lb_use_ssl_certificate

  tags = merge(local.conformance_pack_elb_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
  })
}

control "elb_listener_use_secure_ssl_cipher" {
  title       = "ELB listeners should use secure SSL cipher"
  description = "Ensure that ELB listeners do not have any insecure SSL ciphers. Using insecure and deprecated ciphers for your ELB Predefined Security Policy or Custom Security Policy could make the SSL connection between the client and the load balancer vulnerable to exploits."
  query       = query.elb_listener_use_secure_ssl_cipher

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_application_classic_network_lb_prohibit_public_access" {
  title       = "ELB load balancers should prohibit public access"
  description = "An internet facing load balancer has a publicly resolvable DNS name, so it can route requests from clients over the internet to the EC2 instances that are registered with the load balancer."
  query       = query.elb_application_classic_network_lb_prohibit_public_access

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_application_lb_listener_certificate_expire_7_days" {
  title       = "ELB application load balancers secured listener certificate should not expire within next 7 days"
  description = "This control ensures that SSL/TLS certificates used in application load balancers are renewed 7 days before their expiration date."
  query       = query.elb_application_lb_listener_certificate_expire_7_days

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_application_lb_listener_certificate_expire_30_days" {
  title       = "ELB application load balancers secured listener certificate should not expire within next 30 days"
  description = "This control ensures that SSL/TLS certificates used in application load balancers are renewed 30 days before their expiration date."
  query       = query.elb_application_lb_listener_certificate_expire_30_days

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_application_lb_with_outbound_rule" {
  title       = "ELB application load balancers should have at least one outbound rule"
  description = "Ensure application load balancers have at least one outbound rule in all the attached security groups. A security group without any outbound rule rejects all outgoing traffic. This means that all outgoing traffic originating from your cloud assets (instances, containers, etc.) will be dropped when it reaches the ELB layer."
  query       = query.elb_application_lb_with_outbound_rule

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_application_network_lb_use_listeners" {
  title       = "ELB application and network load balancers should use listeners"
  description = "Ensure that application and network load balancer must have one or more listeners. A listener is a process that checks for connection requests, using the protocol and port that you configure. The rules that you define for a listener determine how the load balancer routes requests to its registered targets."
  query       = query.elb_application_network_lb_use_listeners

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_classic_lb_with_outbound_rule" {
  title       = "ELB classic load balancers should have at least one outbound rule"
  description = "Ensure classic load balancers have at least one outbound rule in all the attached security groups. A security group without any outbound rule rejects all outgoing traffic. This means that all outgoing traffic originating from your cloud assets (instances, containers, etc.) will be dropped when it reaches the ELB layer."
  query       = query.elb_classic_lb_with_outbound_rule

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_tls_listener_protocol_version" {
  title       = "ELB listeners SSL/TLS protocol version should be checked"
  description = "Using insecure ciphers for your ELB Predefined or Custom Security Policy, could make the SSL connection between the client and the load balancer vulnerable to exploits. TLS 1.0 was recommended to be disabled by PCI Council after June 30, 2016."
  query       = query.elb_tls_listener_protocol_version

  tags = merge(local.conformance_pack_elb_common_tags, {
    other_checks = "true"
  })
}

control "elb_application_lb_desync_mitigation_mode" {
  title       = "ELB application load balancers should be configured with defensive or strictest desync mitigation mode"
  description = "This control checks whether an Application Load Balancer is configured with defensive or strictest desync mitigation mode. The control fails if an Application Load Balancer is not configured with defensive or strictest desync mitigation mode."
  query       = query.elb_application_lb_desync_mitigation_mode

  tags = merge(local.conformance_pack_elb_common_tags, {
    nist_csf     = "true"
    pci_dss_v321 = "true"
  })
}

control "elb_classic_lb_desync_mitigation_mode" {
  title       = "ELB classic load balancers should be configured with defensive or strictest desync mitigation mode"
  description = "This control checks whether a Classic Load Balancer is configured with defensive or strictest desync mitigation mode. This control will fail if the Classic Load Balancer is not configured with defensive or strictest desync mitigation mode."
  query       = query.elb_classic_lb_desync_mitigation_mode

  tags = merge(local.conformance_pack_elb_common_tags, {
    pci_dss_v321 = "true"
  })
}

control "elb_classic_lb_multiple_az_configured" {
  title       = "ELB classic load balancers should span multiple availability zones"
  description = "This control checks whether a Classic Load Balancer has been configured to span multiple Availability Zones. The control fails if the Classic Load Balancer does not span multiple Availability Zones."
  query       = query.elb_classic_lb_multiple_az_configured

  tags = merge(local.conformance_pack_elb_common_tags, {
    nist_csf = "true"
  })
}

control "elb_application_gateway_network_lb_multiple_az_configured" {
  title       = "ELB application, network, and gateway load balancers should span multiple availability zones"
  description = "This control checks whether an Elastic Load Balancer V2 (Application, Network, or Gateway Load Balancer) has registered instances from multiple Availability Zones. The control fails if an Elastic Load Balancer V2 has instances registered in fewer than two Availability Zones."
  query       = query.elb_application_gateway_network_lb_multiple_az_configured

  tags = merge(local.foundational_security_elb_common_tags, {
    nist_csf = "true"
  })
}

query "elb_application_classic_lb_logging_enabled" {
  sql = <<-EOQ
    (
      select
        arn as resource,
        case
          when load_balancer_attributes @> '[{"Key": "access_logs.s3.enabled", "Value": "true"}]' then 'ok'
          else 'alarm'
        end as status,
        case
          when load_balancer_attributes @> '[{"Key": "access_logs.s3.enabled", "Value": "true"}]' then title || ' logging enabled.'
          else title || ' logging disabled.'
        end as reason
        ${local.tag_dimensions_sql}
        ${local.common_dimensions_sql}
      from
        aws_ec2_application_load_balancer
    )
    union
    (
      select
        'arn:' || partition || ':elasticloadbalancing:' || region || ':' || account_id || ':loadbalancer/' || title as resource,
        case
          when access_log_enabled = 'true' then 'ok'
          else 'alarm'
        end as status,
        case
          when access_log_enabled = 'true' then title || ' logging enabled.'
          else title || ' logging disabled.'
        end as reason
        ${local.tag_dimensions_sql}
        ${local.common_dimensions_sql}
      from
        aws_ec2_classic_load_balancer
    );
  EOQ
}

query "elb_application_lb_deletion_protection_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when load_balancer_attributes @> '[{"Key": "deletion_protection.enabled", "Value": "true"}]' then 'ok'
        else 'alarm'
      end as status,
      case
        when load_balancer_attributes @> '[{"Key": "deletion_protection.enabled", "Value": "true"}]' then title || ' deletion protection enabled.'
        else title || ' deletion protection disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_application_load_balancer;
  EOQ
}

query "elb_application_lb_redirect_http_request_to_https" {
  sql = <<-EOQ
    with detailed_listeners as (
      select
        arn,
        load_balancer_arn,
        protocol
      from
        aws_ec2_load_balancer_listener,
        jsonb_array_elements(default_actions) as ac
      where
        split_part(arn,'/',2) = 'app'
        and protocol = 'HTTP'
        and ac ->> 'Type' = 'redirect'
        and ac -> 'RedirectConfig' ->> 'Protocol' = 'HTTPS'
    )
    select
      a.arn as resource,
      case
        when b.load_balancer_arn is null then 'alarm'
        else 'ok'
      end as status,
      case
        when b.load_balancer_arn is not null then  a.title || ' associated with HTTP redirection.'
        else a.title || ' not associated with HTTP redirection.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      aws_ec2_application_load_balancer a
      left join detailed_listeners b on a.arn = b.load_balancer_arn;
  EOQ
}

query "elb_application_lb_waf_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when load_balancer_attributes @> '[{"Key":"waf.fail_open.enabled","Value":"true"}]' then 'ok'
        else 'alarm'
      end as status,
      case
        when load_balancer_attributes @> '[{"Key":"waf.fail_open.enabled","Value":"true"}]' then title || ' WAF enabled.'
        else title || ' WAF disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_application_load_balancer;
  EOQ
}

query "elb_classic_lb_use_ssl_certificate" {
  sql = <<-EOQ
    with detailed_classic_listeners as (
      select
        name
      from
        aws_ec2_classic_load_balancer,
        jsonb_array_elements(listener_descriptions) as listener_description
      where
        listener_description -> 'Listener' ->> 'Protocol' in ('HTTPS', 'SSL', 'TLS')
        and listener_description -> 'Listener' ->> 'SSLCertificateId' like 'arn:aws:acm%'
    )
    select
      'arn:' || a.partition || ':elasticloadbalancing:' || a.region || ':' || a.account_id || ':loadbalancer/' || a.name as resource,
      case
        when a.listener_descriptions is null then 'skip'
        when b.name is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when a.listener_descriptions is null then a.title || ' has no listener.'
        when b.name is not null then a.title || ' does not use certificates provided by ACM.'
        else a.title || ' uses certificates provided by ACM.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_classic_load_balancer as a
      left join detailed_classic_listeners as b on a.name = b.name;
  EOQ
}

query "elb_application_lb_drop_http_headers" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when load_balancer_attributes @> '[{"Key": "routing.http.drop_invalid_header_fields.enabled", "Value": "true"}]' then 'ok'
        else 'alarm'
      end as status,
      case
        when load_balancer_attributes @> '[{"Key": "routing.http.drop_invalid_header_fields.enabled", "Value": "true"}]' then title || ' configured to drop http headers.'
        else title || ' not configured to drop http headers.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_application_load_balancer;
  EOQ
}

query "elb_classic_lb_use_tls_https_listeners" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':elasticloadbalancing:' || region || ':' || account_id || ':loadbalancer/' || title as resource,
      case
        when listener_description -> 'Listener' ->> 'Protocol' in ('HTTPS', 'SSL', 'TLS') then 'ok'
        else 'alarm'
      end as status,
      case
        when listener_description -> 'Listener' ->> 'Protocol' = 'HTTPS' then title || ' configured with HTTPS protocol.'
        when listener_description -> 'Listener' ->> 'Protocol' = 'SSL' then title || ' configured with TLS protocol.'
        else title || ' configured with ' || (listener_description -> 'Listener' ->> 'Protocol') || ' protocol.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_classic_load_balancer,
      jsonb_array_elements(listener_descriptions) as listener_description;
  EOQ
}

query "elb_classic_lb_cross_zone_load_balancing_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when cross_zone_load_balancing_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when cross_zone_load_balancing_enabled then title || ' cross-zone load balancing enabled.'
        else title || ' cross-zone load balancing disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_classic_load_balancer;
  EOQ
}

query "elb_application_network_lb_use_ssl_certificate" {
  sql = <<-EOQ
     with listeners_without_certificate as (
      select
        load_balancer_arn,
        count(*) as count
      from
        aws_ec2_load_balancer_listener
      where arn not in
        ( select arn from aws_ec2_load_balancer_listener, jsonb_array_elements(certificates) as c
          where c ->> 'CertificateArn' like 'arn:aws:acm%' )
      group by load_balancer_arn
    ),
    all_application_network_load_balacer as (
      select
        arn,
        account_id,
        region,
        title,
        _ctx
      from
        aws_ec2_application_load_balancer
      union
      select
        arn,
        account_id,
        region,
        title,
        _ctx
      from
        aws_ec2_network_load_balancer
    )
    select
      a.arn as resource,
      case
        when b.load_balancer_arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.load_balancer_arn is null then a.title || ' uses certificates provided by ACM.'
        else a.title || ' has ' || b.count || ' listeners which do not use certificates provided by ACM.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      all_application_network_load_balacer as a
      left join listeners_without_certificate as b on a.arn = b.load_balancer_arn;
  EOQ
}

query "elb_listener_use_secure_ssl_cipher" {
  sql = <<-EOQ
    select
      load_balancer_arn as resource,
      case
        when ssl_policy like any(array['ELBSecurityPolicy-TLS-1-2-2017-01', 'ELBSecurityPolicy-TLS-1-1-2017-01']) then 'ok'
        else 'alarm'
      end as status,
      case
        when ssl_policy like any (array['ELBSecurityPolicy-TLS-1-2-2017-01', 'ELBSecurityPolicy-TLS-1-1-2017-01']) then title || ' uses secure SSL cipher.'
        else title || ' uses insecure SSL cipher.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_load_balancer_listener;
  EOQ
}

query "elb_application_classic_network_lb_prohibit_public_access" {
  sql = <<-EOQ
    with all_lb_details as (
      select
        arn,
        scheme,
        title,
        region,
        account_id,
        tags,
        _ctx
      from
        aws_ec2_application_load_balancer
      union
      select
        arn,
        scheme,
        title,
        region,
        account_id,
        tags,
        _ctx
      from
        aws_ec2_network_load_balancer
      union
      select
        arn,
        scheme,
        title,
        region,
        account_id,
        tags,
        _ctx
      from
      aws_ec2_classic_load_balancer
    )
    select
      arn as resource,
      case
        when scheme = 'internet-facing' then 'alarm'
        else 'ok'
      end as status,
      case
        when scheme = 'internet-facing' then title || ' publicly accessible.'
        else title|| ' not publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      all_lb_details;
  EOQ
}

query "elb_application_lb_listener_certificate_expire_7_days" {
  sql = <<-EOQ
    select
      load_balancer_arn as resource,
      case
        when date(not_after) - date(current_date) >= 7 then 'ok'
        else 'alarm'
      end as status,
      l.title || ' certificate set to expire in ' || extract(day from not_after - current_date) || ' days.' as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "l.")}
    from
      aws_ec2_load_balancer_listener as l,
      jsonb_array_elements(certificates) as c
      left join aws_acm_certificate as a on c ->> 'CertificateArn' = a.certificate_arn;
  EOQ
}

query "elb_application_lb_listener_certificate_expire_30_days" {
  sql = <<-EOQ
    select
      load_balancer_arn as resource,
      case
        when date(not_after) - date(current_date) >= 30 then 'ok'
        else 'alarm'
      end as status,
      l.title || ' certificate set to expire in ' || extract(day from not_after - current_date) || ' days.' as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "l.")}
    from
      aws_ec2_load_balancer_listener as l,
      jsonb_array_elements(certificates) as c
      left join aws_acm_certificate as a on c ->> 'CertificateArn' = a.certificate_arn;
  EOQ
}

query "elb_application_lb_with_outbound_rule" {
  sql = <<-EOQ
    with sg_with_outbound as (
      select
        arn,
        sg
      from
        aws_ec2_application_load_balancer,
        jsonb_array_elements_text(security_groups) as sg
        left join aws_vpc_security_group_rule as sgr on sg = sgr.group_id
      where
        sgr.type = 'egress'
      group by
        sg, arn
    ), application_lb_without_outbound as (
      select
        distinct arn
      from
        aws_ec2_application_load_balancer,
        jsonb_array_elements_text(security_groups) as s
      where
        s not in ( select sg from sg_with_outbound)
    )
    select
      distinct a.arn as resource,
      case
        when a.security_groups is null then 'alarm'
        when o.arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when a.security_groups is null then a.title || ' does not have security group attached.'
        when o.arn is not null then a.title || ' all attached security groups does not have outbound rule(s).'
        else a.title || ' all attached security groups have outbound rule(s).'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "a.")}
    from
      aws_ec2_application_load_balancer as a
      left join application_lb_without_outbound as o on a.arn = o.arn;
  EOQ
}

query "elb_application_network_lb_use_listeners" {
  sql = <<-EOQ
    with load_balancers as (
      select
        n.arn,
        n.title,
        n.region,
        n.account_id,
        tags,
        _ctx
      from
        aws_ec2_network_load_balancer as n
      union
      select
        a.arn,
        a.title,
        a.region,
        a.account_id,
        tags,
        _ctx
      from
        aws_ec2_application_load_balancer as a
    )
    select
      distinct lb.arn as resource,
      case
        when l.load_balancer_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when l.load_balancer_arn is not null then lb.title || ' uses listener.'
        else lb.title || ' does not uses listener.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "lb.")}
    from
      load_balancers as lb
      left join aws_ec2_load_balancer_listener as l on lb.arn = l.load_balancer_arn;
  EOQ
}

query "elb_classic_lb_with_outbound_rule" {
  sql = <<-EOQ
    with sg_with_outbound as (
      select
        arn,
        sg
      from
        aws_ec2_classic_load_balancer,
        jsonb_array_elements_text(security_groups) as sg
        left join aws_vpc_security_group_rule as sgr on sg = sgr.group_id
      where
        sgr.type = 'egress'
      group by
        sg, arn
    ), classic_lb_without_outbound as (
      select
        distinct arn
      from
        aws_ec2_classic_load_balancer,
        jsonb_array_elements_text(security_groups) as s
      where
        s not in ( select sg from sg_with_outbound)
    )
    select
      distinct c.arn as resource,
      case
        when c.security_groups is null then 'alarm'
        when o.arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when c.security_groups is null then c.title || ' does not have security group attached.'
        when o.arn is not null then c.title || ' all attached security groups do not have outbound rule(s).'
        else c.title || ' all attached security groups have outbound rule(s).'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_ec2_classic_load_balancer as c
      left join classic_lb_without_outbound as o on c.arn = o.arn;
  EOQ
}

query "elb_tls_listener_protocol_version" {
  sql = <<-EOQ
    select
      load_balancer_arn as resource,
      case
        when protocol <> 'HTTPS' then 'skip'
        when protocol = 'HTTPS' and ssl_policy like any(array['Protocol-SSLv3', 'Protocol-TLSv1']) then 'alarm'
        else 'ok'
      end as status,
      case
        when protocol <> 'HTTPS' then title || ' uses protocol ' || protocol || '.'
        when ssl_policy like any (array['Protocol-SSLv3', 'Protocol-TLSv1']) then title || ' uses insecure SSL or TLS cipher.'
        else title || ' uses secure SSL or TLS cipher.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_load_balancer_listener;
  EOQ
}

query "elb_application_lb_desync_mitigation_mode" {
  sql = <<-EOQ
    with app_lb_desync_mitigation_mode as (
      select
        arn,
        l ->> 'Key',
        l ->> 'Value' as v
      from
        aws_ec2_application_load_balancer,
        jsonb_array_elements(load_balancer_attributes) as l
      where
        l ->> 'Key' = 'routing.http.desync_mitigation_mode'
    )
    select
      a.arn as resource,
      case
        when m.v = any(array['defensive', 'strictest']) then 'ok'
        else 'alarm'
      end as status,
        title || ' has ' || m.v || ' desync mitigation mode.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_application_load_balancer as a
      left join app_lb_desync_mitigation_mode as m on a.arn = m.arn;
  EOQ
}

query "elb_classic_lb_desync_mitigation_mode" {
  sql = <<-EOQ
    with app_lb_desync_mitigation_mode as (
      select
        arn,
        a ->> 'Key',
        a ->> 'Value' as v
      from
        aws_ec2_classic_load_balancer,
        jsonb_array_elements(additional_attributes) as a
      where
        a ->> 'Key' = 'elb.http.desyncmitigationmode'
    )
    select
      c.arn as resource,
      case
        when m.v = any(array['defensive', 'strictest']) then 'ok'
        else 'alarm'
      end as status,
        title || ' has ' || m.v || ' desync mitigation mode.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_classic_load_balancer as c
      left join app_lb_desync_mitigation_mode as m on c.arn = m.arn;
  EOQ
}

query "elb_classic_lb_multiple_az_configured" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when jsonb_array_length(availability_zones) < 2 then 'alarm'
        else 'ok'
      end as status,
      title || ' has ' || jsonb_array_length(availability_zones) || ' availability zone(s).' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_classic_load_balancer;
  EOQ
}

query "elb_application_gateway_network_lb_multiple_az_configured" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when jsonb_array_length(availability_zones) < 2 then 'alarm'
        else 'ok'
      end as status,
      title || ' has ' || jsonb_array_length(availability_zones) || ' availability zone(s).' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_application_load_balancer
    union
    select
      arn as resource,
      case
        when jsonb_array_length(availability_zones) < 2 then 'alarm'
        else 'ok'
      end as status,
      title || ' has ' || jsonb_array_length(availability_zones) || ' availability zone(s).' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_network_load_balancer
    union
    select
      arn as resource,
      case
        when jsonb_array_length(availability_zones) < 2 then 'alarm'
        else 'ok'
      end as status,
      title || ' has ' || jsonb_array_length(availability_zones) || ' availability zone(s).' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_gateway_load_balancer;
  EOQ
}

# Non-Config rule query

query "elb_network_lb_tls_listener_security_policy_configured" {
  sql = <<-EOQ
    with tls_listeners as (
      select
        distinct load_balancer_arn
      from
        aws_ec2_load_balancer_listener
      where
        protocol = 'TLS'
        and ssl_policy not in ('ELBSecurityPolicy-2016-08', 'ELBSecurityPolicy-FS-2018-0', 'ELBSecurityPolicy-TLS13-1-2-Ext1-2021-06', 'ELBSecurityPolicy-TLS13-1-2-2021-06')
      group by
        load_balancer_arn
    ), nwl_without_tls_listener as (
        select
          load_balancer_arn,
          count(*)
        from
          aws_ec2_load_balancer_listener
        where
          protocol = 'TLS'
        group by
          load_balancer_arn
    )
    select
      lb.arn as resource,
      case
        when l.load_balancer_arn is not null and lb.arn in (select load_balancer_arn from tls_listeners) then 'alarm'
        when l.load_balancer_arn is not null then 'ok'
        else 'info'
      end as status,
      case
        when l.load_balancer_arn is not null and lb.arn in (select load_balancer_arn from tls_listeners) then lb.title || ' TLS listener security policy not updated.'
        when l.load_balancer_arn is not null then lb.title || ' TLS listener security policy updated.'
        else lb.title || ' does not use TLS listener.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "lb.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "lb.")}
    from
      aws_ec2_network_load_balancer as lb
      left join nwl_without_tls_listener as l on l.load_balancer_arn = lb.arn;
  EOQ
}
