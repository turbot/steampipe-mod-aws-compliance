locals {
  audit_manager_pci_v321_requirement_4_common_tags = merge(local.audit_manager_pci_v321_common_tags, {
    control_set = "pci_v321_requirement_4"
  })
}

benchmark "audit_manager_pci_v321_requirement_4" {
  title       = "Requirement 4: Encrypt transmission of cardholder data across open, public networks"
  description = ""

  children = [
    benchmark.audit_manager_pci_v321_requirement_4_1,
  ]

  tags = local.audit_manager_pci_v321_requirement_4_common_tags
}

benchmark "audit_manager_pci_v321_requirement_4_1" {
  title       = "4.1 Use strong cryptography and security protocols to safeguard sensitive cardholder data during transmission over open, public networks, including the following: • Only trusted keys and certificates are accepted. • The protocol in use only supports secure versions or configurations. • The encryption strength is appropriate for the encryption methodology in use. Examples of open, public networks include but are not limited to: • The Internet • Wireless technologies, including 802.11 and Bluetooth • Cellular technologies, for example, Global System for Mobile communications (GSM), Code division multiple access (CDMA) • General Packet Radio Service (GPRS) • Satellite communications"
  description = "Sensitive information must be encrypted during transmission over public networks, because it is easy and common for a malicious individual to intercept and/or divert data while in transit. Secure transmission of cardholder data requires using trusted keys/certificates, a secure protocol for transport, and proper encryption strength to encrypt cardholder data. Connection requests from systems that do not support the required encryption strength, and that would result in an insecure connection, should not be accepted. Note that some protocol implementations (such as SSL, SSH v1.0, and early TLS) have known vulnerabilities that an attacker can use to gain control of the affected system. Whichever security protocol is used, ensure it is configured to use only secure versions and configurations to prevent use of an insecure connection—for example, by using only trusted certificates and supporting only strong encryption (not supporting weaker, insecure protocols or methods). Verifying that certificates are trusted (for example, have not expired and are issued from a trusted source) helps ensure the integrity of the secure connection. Generally, the web page URL should begin with `HTTPS` and/or the web browser display a padlock icon somewhere in the window of the browser. Many TLS certificate vendors also provide a highly visible verification seal— sometimes referred to as a “security seal,” `secure site seal,` or “secure trust seal”)—which may provide the ability to click on the seal to reveal information about the website. Refer to industry standards and best practices for information on strong cryptography and secure protocols (e.g., NIST SP 800-52 and SP 800-57, OWASP, etc.) Note: SSL/early TLS is not considered strong cryptography and may not be used as a security control, except by POS POI terminals that are verified as not being susceptible to known exploits and the termination points to which they connect as defined in Appendix A2."

  children = [
    benchmark.audit_manager_pci_v321_requirement_4_1_a,
    benchmark.audit_manager_pci_v321_requirement_4_1_d,
    benchmark.audit_manager_pci_v321_requirement_4_1_e,
    benchmark.audit_manager_pci_v321_requirement_4_1_f,
    benchmark.audit_manager_pci_v321_requirement_4_1_g,
    control.acm_certificate_expires_30_days,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_listener_use_secure_ssl_cipher,
    control.es_domain_node_to_node_encryption_enabled,
    control.s3_bucket_enforces_ssl,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_4_common_tags, {
    audit_manager_pci_v321_item_id = "4.1"
  })
}

benchmark "audit_manager_pci_v321_requirement_4_1_a" {
  title       = "4.1.a Identify all locations where cardholder data is transmitted or received over open, public networks. Examine documented standards and compare to system configurations to verify the use of security protocols and strong cryptography for all locations"
  description = "Sensitive information must be encrypted during transmission over public networks, because it is easy and common for a malicious individual to intercept and/or divert data while in transit. Secure transmission of cardholder data requires using trusted keys/certificates, a secure protocol for transport, and proper encryption strength to encrypt cardholder data. Connection requests from systems that do not support the required encryption strength, and that would result in an insecure connection, should not be accepted. Note that some protocol implementations (such as SSL, SSH v1.0, and early TLS) have known vulnerabilities that an attacker can use to gain control of the affected system. Whichever security protocol is used, ensure it is configured to use only secure versions and configurations to prevent use of an insecure connection—for example, by using only trusted certificates and supporting only strong encryption (not supporting weaker, insecure protocols or methods). Verifying that certificates are trusted (for example, have not expired and are issued from a trusted source) helps ensure the integrity of the secure connection. Generally, the web page URL should begin with `HTTPS` and/or the web browser display a padlock icon somewhere in the window of the browser. Many TLS certificate vendors also provide a highly visible verification seal— sometimes referred to as a “security seal,” `secure site seal,` or “secure trust seal”)—which may provide the ability to click on the seal to reveal information about the website. Refer to industry standards and best practices for information on strong cryptography and secure protocols (e.g., NIST SP 800-52 and SP 800-57, OWASP, etc.) Note: SSL/early TLS is not considered strong cryptography and may not be used as a security control, except by POS POI terminals that are verified as not being susceptible to known exploits and the termination points to which they connect as defined in Appendix A2."

  children = [
    control.acm_certificate_expires_30_days,
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.cloudfront_distribution_custom_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.elb_application_network_lb_use_ssl_certificate,
    control.kinesis_stream_server_side_encryption_enabled,
    control.s3_bucket_enforces_ssl,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_4_common_tags, {
    audit_manager_pci_v321_item_id = "4.1.a"
  })
}

benchmark "audit_manager_pci_v321_requirement_4_1_d" {
  title       = "4.1.d Examine keys and certificates to verify that only trusted keys and/or certificates are accepted"
  description = "Sensitive information must be encrypted during transmission over public networks, because it is easy and common for a malicious individual to intercept and/or divert data while in transit. Secure transmission of cardholder data requires using trusted keys/certificates, a secure protocol for transport, and proper encryption strength to encrypt cardholder data. Connection requests from systems that do not support the required encryption strength, and that would result in an insecure connection, should not be accepted. Note that some protocol implementations (such as SSL, SSH v1.0, and early TLS) have known vulnerabilities that an attacker can use to gain control of the affected system. Whichever security protocol is used, ensure it is configured to use only secure versions and configurations to prevent use of an insecure connection—for example, by using only trusted certificates and supporting only strong encryption (not supporting weaker, insecure protocols or methods). Verifying that certificates are trusted (for example, have not expired and are issued from a trusted source) helps ensure the integrity of the secure connection. Generally, the web page URL should begin with `HTTPS` and/or the web browser display a padlock icon somewhere in the window of the browser. Many TLS certificate vendors also provide a highly visible verification seal— sometimes referred to as a “security seal,” `secure site seal,` or “secure trust seal”)—which may provide the ability to click on the seal to reveal information about the website. Refer to industry standards and best practices for information on strong cryptography and secure protocols (e.g., NIST SP 800-52 and SP 800-57, OWASP, etc.) Note: SSL/early TLS is not considered strong cryptography and may not be used as a security control, except by POS POI terminals that are verified as not being susceptible to known exploits and the termination points to which they connect as defined in Appendix A2."

  children = [
    control.acm_certificate_expires_30_days,
    control.elb_classic_lb_use_ssl_certificate,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_4_common_tags, {
    audit_manager_pci_v321_item_id = "4.1.d"
  })
}

benchmark "audit_manager_pci_v321_requirement_4_1_e" {
  title       = "4.1.e Examine system configurations to verify that the protocol is implemented to use only secure configurations and does not support insecure versions or configurations"
  description = "Sensitive information must be encrypted during transmission over public networks, because it is easy and common for a malicious individual to intercept and/or divert data while in transit. Secure transmission of cardholder data requires using trusted keys/certificates, a secure protocol for transport, and proper encryption strength to encrypt cardholder data. Connection requests from systems that do not support the required encryption strength, and that would result in an insecure connection, should not be accepted. Note that some protocol implementations (such as SSL, SSH v1.0, and early TLS) have known vulnerabilities that an attacker can use to gain control of the affected system. Whichever security protocol is used, ensure it is configured to use only secure versions and configurations to prevent use of an insecure connection—for example, by using only trusted certificates and supporting only strong encryption (not supporting weaker, insecure protocols or methods). Verifying that certificates are trusted (for example, have not expired and are issued from a trusted source) helps ensure the integrity of the secure connection. Generally, the web page URL should begin with `HTTPS` and/or the web browser display a padlock icon somewhere in the window of the browser. Many TLS certificate vendors also provide a highly visible verification seal— sometimes referred to as a “security seal,” `secure site seal,` or “secure trust seal”)—which may provide the ability to click on the seal to reveal information about the website. Refer to industry standards and best practices for information on strong cryptography and secure protocols (e.g., NIST SP 800-52 and SP 800-57, OWASP, etc.) Note: SSL/early TLS is not considered strong cryptography and may not be used as a security control, except by POS POI terminals that are verified as not being susceptible to known exploits and the termination points to which they connect as defined in Appendix A2."

  children = [
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.vpc_flow_logs_enabled,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_4_common_tags, {
    audit_manager_pci_v321_item_id = "4.1.e"
  })
}

benchmark "audit_manager_pci_v321_requirement_4_1_f" {
  title       = "4.1.f Examine system configurations to verify that the proper encryption strength is implemented for the encryption methodology in use"
  description = "Sensitive information must be encrypted during transmission over public networks, because it is easy and common for a malicious individual to intercept and/or divert data while in transit. Secure transmission of cardholder data requires using trusted keys/certificates, a secure protocol for transport, and proper encryption strength to encrypt cardholder data. Connection requests from systems that do not support the required encryption strength, and that would result in an insecure connection, should not be accepted. Note that some protocol implementations (such as SSL, SSH v1.0, and early TLS) have known vulnerabilities that an attacker can use to gain control of the affected system. Whichever security protocol is used, ensure it is configured to use only secure versions and configurations to prevent use of an insecure connection—for example, by using only trusted certificates and supporting only strong encryption (not supporting weaker, insecure protocols or methods). Verifying that certificates are trusted (for example, have not expired and are issued from a trusted source) helps ensure the integrity of the secure connection. Generally, the web page URL should begin with `HTTPS` and/or the web browser display a padlock icon somewhere in the window of the browser. Many TLS certificate vendors also provide a highly visible verification seal— sometimes referred to as a “security seal,” `secure site seal,` or “secure trust seal”)—which may provide the ability to click on the seal to reveal information about the website. Refer to industry standards and best practices for information on strong cryptography and secure protocols (e.g., NIST SP 800-52 and SP 800-57, OWASP, etc.) Note: SSL/early TLS is not considered strong cryptography and may not be used as a security control, except by POS POI terminals that are verified as not being susceptible to known exploits and the termination points to which they connect as defined in Appendix A2."

  children = [
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.vpc_flow_logs_enabled,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_4_common_tags, {
    audit_manager_pci_v321_item_id = "4.1.f"
  })
}

benchmark "audit_manager_pci_v321_requirement_4_1_g" {
  title       = "4.1.g For TLS implementations, examine system configurations to verify that TLS is enabled whenever cardholder data is transmitted or received. For example, for browser-based implementations: • “HTTPS” appears as the browser Universal Record Locator (URL) protocol, and • Cardholder data is only requested if “HTTPS” appears as part of the URL"
  description = "Sensitive information must be encrypted during transmission over public networks, because it is easy and common for a malicious individual to intercept and/or divert data while in transit. Secure transmission of cardholder data requires using trusted keys/certificates, a secure protocol for transport, and proper encryption strength to encrypt cardholder data. Connection requests from systems that do not support the required encryption strength, and that would result in an insecure connection, should not be accepted. Note that some protocol implementations (such as SSL, SSH v1.0, and early TLS) have known vulnerabilities that an attacker can use to gain control of the affected system. Whichever security protocol is used, ensure it is configured to use only secure versions and configurations to prevent use of an insecure connection—for example, by using only trusted certificates and supporting only strong encryption (not supporting weaker, insecure protocols or methods). Verifying that certificates are trusted (for example, have not expired and are issued from a trusted source) helps ensure the integrity of the secure connection. Generally, the web page URL should begin with `HTTPS` and/or the web browser display a padlock icon somewhere in the window of the browser. Many TLS certificate vendors also provide a highly visible verification seal— sometimes referred to as a “security seal,” `secure site seal,` or “secure trust seal”)—which may provide the ability to click on the seal to reveal information about the website. Refer to industry standards and best practices for information on strong cryptography and secure protocols (e.g., NIST SP 800-52 and SP 800-57, OWASP, etc.) Note: SSL/early TLS is not considered strong cryptography and may not be used as a security control, except by POS POI terminals that are verified as not being susceptible to known exploits and the termination points to which they connect as defined in Appendix A2."

  children = [
    control.acm_certificate_expires_30_days,
    control.elb_application_lb_drop_http_headers,
    control.elb_application_lb_redirect_http_request_to_https,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.cloudfront_distribution_custom_origins_encryption_in_transit_enabled,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.elb_application_network_lb_use_ssl_certificate,
    control.s3_bucket_enforces_ssl,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_4_common_tags, {
    audit_manager_pci_v321_item_id = "4.1.f"
  })
}