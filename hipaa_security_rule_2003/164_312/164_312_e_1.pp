benchmark "hipaa_security_rule_2003_164_312_e_1" {
  title       = "164.312(e)(1) Transmission security"
  description = "Implement technical security measures to guard against unauthorized access to electronic protected health information that is being transmitted over an electronic communications network."
  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.elb_application_lb_http_drop_invalid_header_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled
  ]

  tags = merge(local.hipaa_security_rule_2003_164_312_common_tags, {
    hipaa_security_rule_2003_item_id = "164_312_e_1"
  })
}
