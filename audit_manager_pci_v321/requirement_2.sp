locals {
  audit_manager_pci_v321_requirement_2_common_tags = merge(local.audit_manager_pci_v321_common_tags, {
    control_set = "pci_v321_requirement_2"
  })
}

benchmark "audit_manager_pci_v321_requirement_2" {
  title       = "Requirement 2: Do not use vendor-supplied defaults for system passwords and other security parameters"
  description = ""

  children = [
    benchmark.audit_manager_pci_v321_requirement_2_1,
    benchmark.audit_manager_pci_v321_requirement_2_2,
  ]

  tags = local.audit_manager_pci_v321_requirement_2_common_tags
}

benchmark "audit_manager_pci_v321_requirement_2_1" {
  title       = "2.1 Always change vendor-supplied defaults and remove or disable unnecessary default accounts before installing a system on the network. This applies to ALL default passwords, including but not limited to those used by operating systems, software that provides security services, application and system accounts, point-of-sale (POS) terminals, payment applications, Simple Network Management Protocol (SNMP) community strings, etc.)"
  description = "Malicious individuals (external and internal to an organization) often use vendor default settings, account names, and passwords to compromise operating system software, applications, and the systems on which they are installed. Because these default settings are often published and are well known in hacker communities, changing these settings will leave systems less vulnerable to attack. Even if a default account is not intended to be used, changing the default password to a strong unique password and then disabling the account will prevent a malicious individual from re-enabling the account and gaining access with the default password."

  children = [
    benchmark.audit_manager_pci_v321_requirement_2_1_b,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_2_common_tags, {
    audit_manager_pci_v321_item_id = "2.1"
  })
}

benchmark "audit_manager_pci_v321_requirement_2_1_b" {
  title         = "2.1.a Choose a sample of system components, and attempt to log on (with system administrator help) to the devices and applications using default vendor-supplied accounts and passwords, to verify that ALL default passwords (including those on operating systems, software that provides security services, application and system accounts, POS terminals, and Simple Network Management Protocol (SNMP) community strings) have been changed. (Use vendor manuals and sources on the Internet to find vendor-supplied accounts/passwords.)"
  description   = "If wireless networks are not implemented with sufficient security configurations (including changing default settings), wireless sniffers can eavesdrop on the traffic, easily capture data and passwords, and easily enter and attack the network. In addition, the key-exchange protocol for older versions of 802.11x encryption (Wired Equivalent Privacy, or WEP) has been broken and can render the encryption useless. Firmware for devices should be updated to support more secure protocols."

  children = [
    control.redshift_cluster_no_default_admin_name,
    control.rds_db_instance_no_default_admin_name,
    control.rds_db_cluster_no_default_admin_name
  ]

  tags = merge(local.audit_manager_pci_v321_requirement_2_common_tags, {
    audit_manager_pci_v321_item_id = "2_1_b"
  })
}

benchmark "audit_manager_pci_v321_requirement_2_2" {
  title       = "2.2 Develop configuration standards for all system components. Assure that these standards address all known security vulnerabilities and are consistent with industry-accepted system hardening standards. Sources of industry-accepted system hardening standards may include, but are not limited to: • Center for Internet Security (CIS) • International Organization for Standardization (ISO) • SysAdmin Audit Network Security (SANS) Institute • National Institute of Standards Technology (NIST)"
  description = "There are known weaknesses with many operating systems, databases, and enterprise applications, and there are also known ways to configure these systems to fix security vulnerabilities. To help those that are not security experts, a number of security organizations have established system-hardening guidelines and recommendations, which advise how to correct these weaknesses. Examples of sources for guidance on configuration standards include, but are not limited to: www.nist.gov, www.sans.org, and www.cisecurity.org, www.iso.org, and product vendors. System configuration standards must be kept up to date to ensure that newly identified weaknesses are corrected prior to a system being installed on the network."

  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.iam_root_user_no_access_keys,
    control.s3_bucket_cross_region_replication_enabled,
    benchmark.audit_manager_pci_v321_requirement_2_2_2,
    benchmark.audit_manager_pci_v321_requirement_2_2_4,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_2_common_tags, {
    audit_manager_pci_v321_item_id = "2.2"
  })
}

benchmark "audit_manager_pci_v321_requirement_2_2_2" {
  title       = "2.2.2 Enable only necessary services, protocols, daemons, etc., as required for the function of the system"
  description = "As stated in Requirement 1.1.6, there are many protocols that a business may need (or have enabled by default) that are commonly used by malicious individuals to compromise a network. Including this requirement as part of an organization's configuration standards and related processes ensures that only the necessary services and protocols are enabled."

  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.es_domain_in_vpc,
    control.emr_cluster_master_nodes_no_public_ip,
    control.ec2_instance_in_vpc,
    control.vpc_igw_attached_to_authorized_vpc,
    control.lambda_function_restrict_public_access,
    control.lambda_function_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_public_access_block_bucket_account,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_endpoint_service_acceptance_required_enabled,
    control.eks_cluster_endpoint_restrict_public_access,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_2_common_tags, {
    audit_manager_pci_v321_item_id = "2.2.2"
  })
}

benchmark "audit_manager_pci_v321_requirement_2_2_4" {
  title       = "2.2.4 Configure system security parameters to prevent misuse"
  description = "System configuration standards and related processes should specifically address security settings and parameters that have known security implications for each type of system in use. In order for systems to be configured securely, personnel responsible for configuration and/or administering systems must be knowledgeable in the specific security parameters and settings that apply to the system."

  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_2_common_tags, {
    audit_manager_pci_v321_item_id = "2.2.2"
  })
}