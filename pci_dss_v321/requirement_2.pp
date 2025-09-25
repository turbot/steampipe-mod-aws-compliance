locals {
  pci_dss_v321_requirement_2_common_tags = merge(local.pci_dss_v321_common_tags, {
    control_set = "2"
  })
}

benchmark "pci_dss_v321_requirement_2" {
  title       = "Requirement 2: Do not use vendor-supplied defaults for system passwords and other security parameters"
  description = "Malicious individuals (external and internal to an entity) often use vendor default passwords and other vendor default settings to compromise systems. These passwords and settings are well known by hacker communities and are easily determined via public information."

  children = [
    benchmark.pci_dss_v321_requirement_2_1,
    benchmark.pci_dss_v321_requirement_2_2,
    benchmark.pci_dss_v321_requirement_2_3,
    benchmark.pci_dss_v321_requirement_2_4
  ]

  tags = local.pci_dss_v321_requirement_2_common_tags
}

benchmark "pci_dss_v321_requirement_2_1" {
  title       = "2.1 Always change vendor-supplied defaults and remove or disable unnecessary default accounts before installing a system on the network"
  description = "This applies to ALL default passwords, including but not limited to those used by operating systems, software that provides security services, application and system accounts, point-of-sale (POS) terminals, payment applications, Simple Network Management Protocol (SNMP) community strings, etc. Malicious individuals (external and internal to an organization) often use vendor default settings, account names, and passwords to compromise operating system software, applications, and the systems on which they are installed. Because these default settings are often published and are well known in hacker communities, changing these settings will leave systems less vulnerable to attack. Even if a default account is not intended to be used, changing the default password to a strong unique password and then disabling the account will prevent a malicious individual from re-enabling the account and gaining access with the default password."

  children = [
    benchmark.pci_dss_v321_requirement_2_1_b
  ]
  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.1"
  })
}

benchmark "pci_dss_v321_requirement_2_1_b" {
  title       = "2.1.b For the sample of system components, verify that all unnecessary default accounts (including accounts used by operating systems, security software, applications, systems, POS terminals, SNMP, etc.) are removed or disabled"
  description = "Malicious individuals (external and internal to an organization) often use vendor default settings, account names, and passwords to compromise operating system software, applications, and the systems on which they are installed. Because these default settings are often published and are well known in hacker communities, changing these settings will leave systems less vulnerable to attack. Even if a default account is not intended to be used, changing the default password to a strong unique password and then disabling the account will prevent a malicious individual from re-enabling the account and gaining access with the default password."

  children = [
    control.rds_db_cluster_no_default_admin_name,
    control.rds_db_instance_no_default_admin_name,
    control.redshift_cluster_no_default_admin_name
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.1.b"
  })
}

benchmark "pci_dss_v321_requirement_2_2" {
  title       = "2.2 Develop configuration standards for all system components"
  description = "Assure that these standards address all known security vulnerabilities and are consistent with industry-accepted system hardening standards. Sources of industry-accepted system hardening standards may include, but are not limited to Center for Internet Security (CIS), International Organization for Standardization (ISO), SysAdmin Audit Network Security (SANS) Institute and National Institute of Standards Technology (NIST). There are known weaknesses with many operating systems, databases, and enterprise applications, and there are also known ways to configure these systems to fix security vulnerabilities. To help those that are not security experts, a number of security organizations have established system-hardening guidelines and recommendations, which advise how to correct these weaknesses. Examples of sources for guidance on configuration standards include, but are not limited to: www.nist.gov, www.sans.org, and www.cisecurity.org, www.iso.org, and product vendors. System configuration standards must be kept up to date to ensure that newly identified weaknesses are corrected prior to a system being installed on the network."

  children = [
    benchmark.pci_dss_v321_requirement_2_2_2,
    benchmark.pci_dss_v321_requirement_2_2_4,
    benchmark.pci_dss_v321_requirement_2_2_5,
    benchmark.pci_dss_v321_requirement_2_2_a,
    benchmark.pci_dss_v321_requirement_2_2_d,
    control.autoscaling_group_with_lb_use_health_check,
    control.iam_root_user_no_access_keys,
    control.s3_bucket_cross_region_replication_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.2"
  })
}

benchmark "pci_dss_v321_requirement_2_2_2" {
  title       = "2.2.2 Enable only necessary services, protocols, daemons, etc., as required for the function of the system"
  description = "As stated in Requirement 1.1.6, there are many protocols that a business may need (or have enabled by default) that are commonly used by malicious individuals to compromise a network. Including this requirement as part of an organization's configuration standards and related processes ensures that only the necessary services and protocols are enabled."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.2.2"
  })
}

benchmark "pci_dss_v321_requirement_2_2_4" {
  title       = "2.2.4 Configure system security parameters to prevent misuse"
  description = "System configuration standards and related processes should specifically address security settings and parameters that have known security implications for each type of system in use. In order for systems to be configured securely, personnel responsible for configuration and/or administering systems must be knowledgeable in the specific security parameters and settings that apply to the system."

  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.2.4"
  })
}

benchmark "pci_dss_v321_requirement_2_2_5" {
  title       = "2.2.5 Remove all unnecessary functionality, such as scripts, drivers, features, subsystems, file systems, and unnecessary web servers"
  description = "Unnecessary functions can provide additional opportunities for malicious individuals to gain access to a system. By removing unnecessary functionality, organizations can focus on securing the functions that are required and reduce the risk that unknown functions will be exploited. Including this in server-hardening standards and processes addresses the specific security implications associated with unnecessary functions (for example, by removing/disabling FTP or the web server if the server will not be performing those functions)."

  children = [
    benchmark.pci_dss_v321_requirement_2_2_5_b
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.2.5"
  })
}

benchmark "pci_dss_v321_requirement_2_2_5_b" {
  title       = "2.2.5.b. Examine the documentation and security parameters to verify enabled functions are documented and support secure configuration"
  description = "Unnecessary functions can provide additional opportunities for malicious individuals to gain access to a system. By removing unnecessary functionality, organizations can focus on securing the functions that are required and reduce the risk that unknown functions will be exploited. Including this in server-hardening standards and processes addresses the specific security implications associated with unnecessary functions (for example, by removing/disabling FTP or the web server if the server will not be performing those functions)."

  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.2.5.b"
  })
}

benchmark "pci_dss_v321_requirement_2_2_a" {
  title       = "2.2.a Examine the organization's system configuration standards for all types of system components and verify the system configuration standards are consistent with industry-accepted hardening standards"
  description = "There are known weaknesses with many operating systems, databases, and enterprise applications, and there are also known ways to configure these systems to fix security vulnerabilities. To help those that are not security experts, a number of security organizations have established system-hardening guidelines and recommendations, which advise how to correct these weaknesses. Examples of sources for guidance on configuration standards include, but are not limited to: www.nist.gov, www.sans.org, and www.cisecurity.org, www.iso.org, and product vendors. System configuration standards must be kept up to date to ensure that newly identified weaknesses are corrected prior to a system being installed on the network."

  children = [
    control.autoscaling_launch_config_requires_imdsv2,
    control.cloudformation_stack_drift_detection_check,
    control.rds_db_cluster_no_default_admin_name,
    control.rds_db_instance_no_default_admin_name,
    control.redshift_cluster_no_default_admin_name
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.2.a"
  })
}

benchmark "pci_dss_v321_requirement_2_2_d" {
  title       = "2.2.d Verify that system configuration standards include the procedures like changing of all vendor-supplied defaults and elimination of unnecessary default accounts etc. for all types of system components"
  description = "System configuration standards include the following procedures for all types of system components: changing of all vendor-supplied defaults and elimination of unnecessary default accounts, implementing only one primary function per server to prevent functions that require different security levels from co-existing on the same server, enabling only necessary services, protocols, daemons, etc., as required for the function of the system, implementing additional security features for any required services, protocols or daemons that are considered to be insecure, configuring system security parameters to prevent misuse and removing all unnecessary functionality, such as scripts, drivers, features, subsystems, file systems, and unnecessary web servers. There are known weaknesses with many operating systems, databases, and enterprise applications, and there are also known ways to configure these systems to fix security vulnerabilities. To help those that are not security experts, a number of security organizations have established system-hardening guidelines and recommendations, which advise how to correct these weaknesses. Examples of sources for guidance on configuration standards include, but are not limited to: www.nist.gov, www.sans.org, and www.cisecurity.org, www.iso.org, and product vendors. System configuration standards must be kept up to date to ensure that newly identified weaknesses are corrected prior to a system being installed on the network."

  children = [
    control.autoscaling_launch_config_requires_imdsv2,
    control.cloudformation_stack_drift_detection_check,
    control.rds_db_cluster_no_default_admin_name,
    control.rds_db_instance_no_default_admin_name,
    control.redshift_cluster_no_default_admin_name
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.2.d"
  })
}

benchmark "pci_dss_v321_requirement_2_3" {
  title       = "2.3 Encrypt all non-console administrative access using strong cryptography"
  description = "If non-console (including remote) administration does not use secure authentication and encrypted communications, sensitive administrative or operational level information (like administrator's IDs and passwords) can be revealed to an eavesdropper. A malicious individual could use this information to access the network, become administrator, and steal data. Clear-text protocols (such as HTTP, telnet, etc.) do not encrypt traffic or logon details, making it easy for an eavesdropper to intercept this information. Select a sample of system components and verify that non-console administrative access is encrypted."

  children = [
    control.acm_certificate_expires_30_days,
    control.cloudfront_distribution_encryption_in_transit_enabled,
    control.cloudfront_distribution_no_deprecated_ssl_protocol,
    control.elb_application_lb_http_drop_invalid_header_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.redshift_cluster_encryption_in_transit_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.3"
  })
}

benchmark "pci_dss_v321_requirement_2_4" {
  title       = "2.4 Maintain an inventory of system components that are in scope for PCI DSS"
  description = "Maintaining a current list of all system components will enable an organization to accurately and efficiently define the scope of their environment for implementing PCI DSS controls. Without an inventory, some system components could be forgotten, and be inadvertently excluded from the organization's configuration standards."

  children = [
    benchmark.pci_dss_v321_requirement_2_4_a,
    control.config_enabled_all_regions,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_eip_associated
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.4"
  })
}

benchmark "pci_dss_v321_requirement_2_4_a" {
  title       = "2.4.a Examine system inventory to verify that a list of hardware and software components is maintained and includes a description of function/use for each"
  description = "Maintaining a current list of all system components will enable an organization to accurately and efficiently define the scope of their environment for implementing PCI DSS controls. Without an inventory, some system components could be forgotten, and be inadvertently excluded from the organization's configuration standards."

  children = [
    control.config_enabled_all_regions
  ]

  tags = merge(local.pci_dss_v321_requirement_2_common_tags, {
    pci_dss_v321_item_id = "2.4.a"
  })
}
