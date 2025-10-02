locals {
  all_controls_elb_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/ELB"
  })
}

benchmark "all_controls_elb" {
  title       = "ELB"
  description = "This section contains recommendations for configuring ELB resources."
  children = [
    control.ec2_classic_lb_connection_draining_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.elb_application_classic_network_lb_prohibit_public_access,
    control.elb_application_gateway_network_lb_multiple_az_configured,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_application_lb_desync_mitigation_mode,
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_http_drop_invalid_header_enabled,
    control.elb_application_lb_listener_certificate_expire_30_days,
    control.elb_application_lb_listener_certificate_expire_7_days,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_lb_waf_enabled,
    control.elb_application_lb_with_outbound_rule,
    control.elb_application_network_lb_https_tls_listener_recommended_security_policy,
    control.elb_application_network_lb_use_listeners,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_application_network_listener_uses_secure_protocol,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.elb_classic_lb_multiple_az_configured,
    control.elb_classic_lb_no_registered_instance,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.elb_classic_lb_with_inbound_rule,
    control.elb_classic_lb_with_outbound_rule,
    control.elb_listener_use_secure_ssl_cipher,
    control.elb_network_lb_tls_listener_security_policy_configured,
    control.elb_tls_listener_protocol_version
  ]

  tags = merge(local.all_controls_elb_common_tags, {
    type = "Benchmark"
  })
}
