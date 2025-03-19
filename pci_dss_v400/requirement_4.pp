locals {
  pci_dss_v400_requirement_4_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "4"
  })
}

benchmark "pci_dss_v400_requirement_4" {
  title = "Requirement 4: Protect Cardholder Data with Strong Cryptography During Transmission Over Open, Public Networks"

  children = [
    benchmark.pci_dss_v400_requirement_4_2
  ]

  tags = local.pci_dss_v400_requirement_4_common_tags
}

benchmark "pci_dss_v400_requirement_4_2" {
  title = "4.2: Protect Cardholder Data with Strong Cryptography During Transmission Over Open, Public Networks"
  children = [
    benchmark.pci_dss_v400_requirement_4_2_1,
  ]

  tags = merge(local.pci_dss_v400_requirement_4_common_tags, {
    pci_dss_v400_item_id = "4.2"
  })
}

benchmark "pci_dss_v400_requirement_4_2_1" {
  title       = "4.2.1: PAN is protected with strong cryptography during transmission."
  description = "Strong cryptography and security protocols are implemented as follows to safeguard PAN during transmission over open, public networks: Only trusted keys and certificates are accepted. Certificates used to safeguard PAN during transmission over open, public networks are confirmed as valid and are not expired or revoked. This bullet is a best practice until its effective date; refer to applicability notes below for details. The protocol in use supports only secure versions or configurations and does not support fallback to, or use of insecure versions, algorithms, key sizes, or implementations. The encryption strength is appropriate for the encryption methodology in use. Applicability Notes There could be occurrences where an entity receives cardholder data unsolicited via an insecure communication channel that was not intended for the purpose of receiving sensitive data. In this situation, the entity can choose to either include the channel in the scope of their CDE and secure it according to PCI DSS or implement measures to prevent the channel from being used for cardholder data. A self-signed certificate may also be acceptable if the certificate is issued by an internal CA within the organization, the certificates author is confirmed, and the certificate is verified, for example, via hash or signature and has not expired. Note that self-signed certificates where the Distinguished Name (DN) field in the issued by and issued to field is the same are not acceptable. The bullet above (for confirming that certificates used to safeguard PAN during transmission over open, public networks are valid and are not expired or revoked) is a best practice until 31 March 2025, after which it will be required as part of Requirement 4.2.1 and must be fully considered during a PCI DSS assessment."

  children = [
    benchmark.pci_dss_v400_requirement_4_2_1_1,
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

  tags = merge(local.pci_dss_v400_requirement_4_common_tags, {
    pci_dss_v400_item_id = "4.2.1"
  })
}

benchmark "pci_dss_v400_requirement_4_2_1_1" {
  title       = "4.2.1.1: PAN is protected with strong cryptography during transmission."
  description = "An inventory of the entity's trusted keys and certificates is maintained. Applicability Notes This requirement is a best practice until 31 March 2025, after which it will be required and must be fully considered during a PCI DSS assessment."

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

  tags = merge(local.pci_dss_v400_requirement_4_common_tags, {
    pci_dss_v400_item_id = "4.2.1.1"
  })
}
