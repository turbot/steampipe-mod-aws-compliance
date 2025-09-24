locals {
  foundational_security_elb_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/ELB"
  })
}

benchmark "foundational_security_elb" {
  title         = "ELB"
  documentation = file("./foundational_security/docs/foundational_security_elb.md")
  children = [
    control.foundational_security_elb_1,
    control.foundational_security_elb_2,
    control.foundational_security_elb_3,
    control.foundational_security_elb_4,
    control.foundational_security_elb_5,
    control.foundational_security_elb_6,
    control.foundational_security_elb_7,
    control.foundational_security_elb_9,
    control.foundational_security_elb_10,
    control.foundational_security_elb_12,
    control.foundational_security_elb_13,
    control.foundational_security_elb_14,
    control.foundational_security_elb_17,
    control.foundational_security_elb_18
  ]

  tags = merge(local.foundational_security_elb_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_elb_1" {
  title         = "1 Application Load Balancer should be configured to redirect all HTTP requests to HTTPS"
  description   = "This control checks whether HTTP to HTTPS redirection is configured on all HTTP listeners of Application Load Balancers. The control fails if any of the HTTP listeners of Application Load Balancers do not have HTTP to HTTPS redirection configured."
  severity      = "medium"
  query         = query.elb_application_lb_redirect_http_request_to_https
  documentation = file("./foundational_security/docs/foundational_security_elb_1.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_1"
  })
}

control "foundational_security_elb_2" {
  title         = "2 Classic Load Balancers with SSL/HTTPS listeners should use a certificate provided by AWS Certificate Manager"
  description   = "This control checks whether the Classic Load Balancer uses HTTPS/SSL certificates provided by AWS Certificate Manager (ACM). The control fails if the Classic Load Balancer configured with HTTPS/SSL listener does not use a certificate provided by ACM."
  severity      = "medium"
  query         = query.elb_classic_lb_use_ssl_certificate
  documentation = file("./foundational_security/docs/foundational_security_elb_2.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_2"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_elb_3" {
  title         = "3 Classic Load Balancer listeners should be configured with HTTPS or TLS termination"
  description   = "This control checks whether your Classic Load Balancer listeners are configured with HTTPS or TLS protocol for front-end (client to load balancer) connections. The control is applicable if a Classic Load Balancer has listeners. If your Classic Load Balancer does not have a listener configured, then the control does not report any findings. The control passes if the Classic Load Balancer listeners are configured with TLS or HTTPS for front-end connections. The control fails if the listener is not configured with TLS or HTTPS for front-end connections."
  severity      = "medium"
  query         = query.elb_classic_lb_use_tls_https_listeners
  documentation = file("./foundational_security/docs/foundational_security_elb_3.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_3"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_elb_4" {
  title         = "4 Application Load Balancer should be configured to drop invalid http headers"
  description   = "This control evaluates AWS Application Load Balancers (ALB) to ensure they are configured to drop invalid HTTP headers. The control fails if the value of routing.http.drop_invalid_header_fields.enabled is set to false. By default, ALBs are not configured to drop invalid HTTP header values. Removing these header values prevents HTTP desync attacks."
  severity      = "medium"
  query         = query.elb_application_lb_http_drop_invalid_header_enabled
  documentation = file("./foundational_security/docs/foundational_security_elb_4.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_4"
    foundational_security_category = "network_security"
  })
}

control "foundational_security_elb_5" {
  title         = "5 Application and Classic Load Balancers logging should be enabled"
  description   = "This control checks whether the Application Load Balancer and the Classic Load Balancer have logging enabled. The control fails if access_logs.s3.enabled is false."
  severity      = "medium"
  query         = query.elb_application_classic_lb_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_elb_5.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_5"
    foundational_security_category = "logging"
  })
}

control "foundational_security_elb_6" {
  title         = "6 Application Load Balancer deletion protection should be enabled"
  description   = "This control checks whether an Application Load Balancer has deletion protection enabled. The control fails if deletion protection is not configured. Enable deletion protection to protect your Application Load Balancer from deletion."
  severity      = "medium"
  query         = query.elb_application_lb_deletion_protection_enabled
  documentation = file("./foundational_security/docs/foundational_security_elb_6.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_6"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_elb_7" {
  title         = "7 Classic Load Balancers should have connection draining enabled"
  description   = "This control checks whether Classic Load Balancers have connection draining enabled."
  severity      = "medium"
  query         = query.ec2_classic_lb_connection_draining_enabled
  documentation = file("./foundational_security/docs/foundational_security_elb_7.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_7"
    foundational_security_category = "resilience"
  })
}

control "foundational_security_elb_9" {
  title         = "9 Classic Load Balancers should have cross-zone load balancing enabled"
  description   = "This control checks if cross-zone load balancing is enabled for the Classic Load Balancers (CLBs). This control fails if cross-zone load balancing is not enabled for a CLB."
  severity      = "medium"
  query         = query.elb_classic_lb_cross_zone_load_balancing_enabled
  documentation = file("./foundational_security/docs/foundational_security_elb_9.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_9"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_elb_10" {
  title         = "10 Classic Load Balancers should span multiple Availability Zones"
  description   = "This control checks whether a Classic Load Balancer has been configured to span multiple Availability Zones. The control fails if the Classic Load Balancer does not span multiple Availability Zones."
  severity      = "medium"
  query         = query.elb_classic_lb_multiple_az_configured
  documentation = file("./foundational_security/docs/foundational_security_elb_10.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_10"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_elb_12" {
  title         = "12 Application Load Balancers should be configured with defensive or strictest desync mitigation mode"
  description   = "This control checks whether an Application Load Balancer is configured with defensive or strictest desync mitigation mode. The control fails if an Application Load Balancer is not configured with defensive or strictest desync mitigation mode."
  severity      = "medium"
  query         = query.elb_application_lb_desync_mitigation_mode
  documentation = file("./foundational_security/docs/foundational_security_elb_12.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_12"
    foundational_security_category = "data_integrity"
  })
}

control "foundational_security_elb_13" {
  title         = "13 Application, Network, and Gateway Load Balancers should span multiple Availability Zones"
  description   = "This control checks whether an Elastic Load Balancer V2 (Application, Network, or Gateway Load Balancer) has registered instances from multiple Availability Zones. The control fails if an Elastic Load Balancer V2 has instances registered in fewer than two Availability Zones."
  severity      = "medium"
  query         = query.elb_application_gateway_network_lb_multiple_az_configured
  documentation = file("./foundational_security/docs/foundational_security_elb_13.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_13"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_elb_14" {
  title         = "14 Classic Load Balancers should be configured with defensive or strictest desync mitigation mode"
  description   = "This control checks whether a Classic Load Balancer is configured with defensive or strictest desync mitigation mode. This control will fail if the Classic Load Balancer is not configured with defensive or strictest desync mitigation mode."
  severity      = "medium"
  query         = query.elb_classic_lb_desync_mitigation_mode
  documentation = file("./foundational_security/docs/foundational_security_elb_14.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_14"
    foundational_security_category = "data_integrity"
  })
}

control "foundational_security_elb_17" {
  title         = "17 Application and Network Load Balancers with listeners should use recommended security policies"
  description   = "This control checks whether the HTTPS listener for an Application Load Balancer or the TLS listener for a Network Load Balancer is configured to encrypt data in transit by using a recommended security policy. The control fails if the HTTPS or TLS listener for a load balancer isn't configured to use a recommended security policy."
  severity      = "medium"
  query         = query.elb_application_network_lb_https_tls_listener_recommended_security_policy
  documentation = file("./foundational_security/docs/foundational_security_elb_17.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_17"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_elb_18" {
  title         = "18 Application and Network Load Balancer listeners should use secure protocols to encrypt data in transit"
  description   = "This control checks whether the listener for an Application Load Balancer or Network Load Balancer is configured to use a secure protocol for encryption of data in transit. The control fails if an Application Load Balancer listener isn't configured to use the HTTPS protocol, or a Network Load Balancer listener isn't configured to use the TLS protocol."
  severity      = "medium"
  query         = query.elb_application_network_listener_uses_secure_protocol
  documentation = file("./foundational_security/docs/foundational_security_elb_18.md")

  tags = merge(local.foundational_security_elb_common_tags, {
    foundational_security_item_id  = "elb_18"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}
