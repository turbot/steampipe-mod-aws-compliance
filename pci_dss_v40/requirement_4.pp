locals {
  pci_dss_v40_requirement_4_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "4"
  })
}

benchmark "pci_dss_v40_requirement_4" {
  title       = "Requirement 4: Protect Cardholder Data with Strong Cryptography During Transmission Over Open, Public Networks"
  description = "The use of strong cryptography provides greater assurance in preserving data confidentiality, integrity, and non-repudiation."

  children = [
    benchmark.pci_dss_v40_requirement_4_2
  ]

  tags = local.pci_dss_v40_requirement_4_common_tags
}

benchmark "pci_dss_v40_requirement_4_2" {
  title       = "4.2: PAN is protected with strong cryptography during transmission"
  children = [
    benchmark.pci_dss_v40_requirement_4_2_1,
  ]

  tags = merge(local.pci_dss_v40_requirement_4_common_tags, {
    pci_dss_v40_item_id = "4.2"
  })
}

benchmark "pci_dss_v40_requirement_4_2_1" {
  title       = "4.2.1: Strong cryptography and security protocols are implemented as follows to safeguard PAN during transmission"
  description = "Sensitive information must be encrypted during transmission over public networks because it is easy and common for a malicious individual to intercept and/or divert data while in transit."

  children = [
    benchmark.pci_dss_v40_requirement_4_2_1_1,
    control.cloudfront_distribution_custom_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.elasticache_replication_group_encryption_in_transit_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_kerberos_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.opensearch_domain_https_required,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
  ]

  tags = merge(local.pci_dss_v40_requirement_4_common_tags, {
    pci_dss_v40_item_id = "4.2.1"
  })
}

benchmark "pci_dss_v40_requirement_4_2_1_1" {
  title       = "4.2.1.1: An inventory of the entity's trusted keys and certificates used to protect PAN during transmission is maintained"
  description = "The inventory of trusted keys helps the entity keep track of the algorithms, protocols, key strength, key custodians, and key expiry dates. This enables the entity to respond quickly to vulnerabilities discovered in encryption software, certificates, and cryptographic algorithms."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.cloudfront_distribution_custom_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.cloudfront_distribution_use_custom_ssl_certificate,
    control.elasticache_replication_group_encryption_in_transit_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_kerberos_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.kms_key_not_pending_deletion,
    control.opensearch_domain_https_required,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
  ]

  tags = merge(local.pci_dss_v40_requirement_4_common_tags, {
    pci_dss_v40_item_id = "4.2.1.1"
  })
}
