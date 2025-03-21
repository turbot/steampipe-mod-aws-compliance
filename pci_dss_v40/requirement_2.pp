locals {
  pci_dss_v40_requirement_2_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "2"
  })
}

benchmark "pci_dss_v40_requirement_2" {
  title       = "Requirement 2: Apply Secure Configurations to All System Components"
  description = "Malicious individuals, both external and internal to an entity, often use default passwords and other vendor default settings to compromise systems. These passwords and settings are well known and are easily determined via public information."

  children = [
    benchmark.pci_dss_v40_requirement_2_2
  ]

  tags = local.pci_dss_v40_requirement_2_common_tags
}

benchmark "pci_dss_v40_requirement_2_2" {
  title       = "2.2 System components are configured and managed securely"

  children = [
    benchmark.pci_dss_v40_requirement_2_2_5,
    benchmark.pci_dss_v40_requirement_2_2_7
  ]

  tags = merge(local.pci_dss_v40_requirement_2_common_tags, {
    pci_dss_v40_item_id = "2.2"
  })
}

benchmark "pci_dss_v40_requirement_2_2_5" {
  title       = "2.2.5: System components cannot be compromised by exploiting insecure services, protocols, or daemons"
  description = "Ensuring that all insecure services, protocols, and daemons are adequately secured with appropriate security features makes it more difficult for malicious individuals to exploit common points of compromise within a network."

  children = [
    control.cloudfront_distribution_custom_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.cloudfront_distribution_sni_enabled,
    control.cloudfront_distribution_use_secure_cipher,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_tls_https_listeners,
    control.emr_cluster_kerberos_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.opensearch_domain_https_required,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = merge(local.pci_dss_v40_requirement_2_common_tags, {
    pci_dss_v40_item_id = "2.2.5"
  })
}

benchmark "pci_dss_v40_requirement_2_2_7" {
  title       = "2.2.7: All non-console administrative access is encrypted using strong cryptography"
  description = "If non-console (including remote) administration does not use encrypted communications, administrative authorization factors (such as IDs and passwords) can be revealed to an eavesdropper. A malicious individual could use this information to access the network, become administrator, and steal data."

  children = [
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
    control.s3_bucket_enforces_ssl
  ]

  tags = merge(local.pci_dss_v40_requirement_2_common_tags, {
    pci_dss_v40_item_id = "2.2.7"
  })
}