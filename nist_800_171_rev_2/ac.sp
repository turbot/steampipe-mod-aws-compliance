benchmark "nist_800_171_rev_2_3_1" {
  title       = "3.1 Access Control"
  description = "The access control family consists of security requirements detailing system logging. This includes who has access to what assets and reporting capabilities like account management, system privileges, and remote access logging to determine when users have access to the system and their level of access."
  children = [
    benchmark.nist_800_171_rev_2_3_1_1,
    benchmark.nist_800_171_rev_2_3_1_2,
    benchmark.nist_800_171_rev_2_3_1_3,
    benchmark.nist_800_171_rev_2_3_1_4,
    benchmark.nist_800_171_rev_2_3_1_5,
    benchmark.nist_800_171_rev_2_3_1_6,
    benchmark.nist_800_171_rev_2_3_1_7,
    benchmark.nist_800_171_rev_2_3_1_12,
    benchmark.nist_800_171_rev_2_3_1_13,
    benchmark.nist_800_171_rev_2_3_1_14,
    benchmark.nist_800_171_rev_2_3_1_20
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_1" {
  title       = "3.1.1 Limit system access to authorized users, processes acting on behalf of authorized users, and devices (including other systems)"
  description = "Access control policies (e.g., identity or role-based policies, control matrices, and cryptography) control access between active entities or subjects (i.e., users or processes acting on behalf of users) and passive entities or objects (e.g., devices, files, records, and domains) in systems. Access enforcement mechanisms can be employed at the application and service level to provide increased information security. Other systems include systems internal and external to the organization. This requirement focuses on account management for systems and applications. The definition of and enforcement of access authorizations, other than those determined by account type (e.g., privileged verses non-privileged) are addressed in requirement 3.1.2."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_kerberos_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_2" {
  title       = "3.1.2 Limit system access to the types of transactions and functions that authorized users are permitted to execute"
  description = "Organizations may choose to define access privileges or other attributes by account, by type of account, or a combination of both. System account types include individual, shared, group, system, anonymous, guest, emergency, developer, manufacturer, vendor, and temporary. Other attributes required for authorizing access include restrictions on time-of-day, day-of-week, and point-oforigin. In defining other account attributes, organizations consider system-related requirements (e.g., system upgrades scheduled maintenance,) and mission or business requirements, (e.g., time zone differences, customer requirements, remote access to support travel requirements)."
  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ecs_task_definition_user_for_host_mode_check,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_kerberos_enabled,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_policy_restrict_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.ssm_document_prohibit_public_access,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_3" {
  title       = "3.1.3 Control the flow of CUI in accordance with approved authorizations"
  description = "Information flow control regulates where information can travel within a system and between systems (versus who can access the information) and without explicit regard to subsequent accesses to that information. Flow control restrictions include the following: keeping exportcontrolled information from being transmitted in the clear to the Internet; blocking outside traffic that claims to be from within the organization; restricting requests to the Internet that are not from the internal web proxy server; and limiting information transfers between organizations based on data structures and content. Organizations commonly use information flow control policies and enforcement mechanisms to control the flow of information between designated sources and destinations (e.g., networks, individuals, and devices) within systems and between interconnected systems. Flow control is based on characteristics of the information or the information path. Enforcement occurs in boundary protection devices (e.g., gateways, routers, guards, encrypted tunnels, firewalls) that employ rule sets or establish configuration settings that restrict system services, provide a packetfiltering capability based on header information, or message-filtering capability based on message content (e.g., implementing key word searches or using document characteristics). Organizations also consider the trustworthiness of filtering and inspection mechanisms (i.e., hardware, firmware, and software components) that are critical to information flow enforcement. Transferring information between systems representing different security domains with different security policies introduces risk that such transfers violate one or more domain security policies. In such situations, information owners or stewards provide guidance at designated policy enforcement points between interconnected systems. Organizations consider mandating specific architectural solutions when required to enforce specific security policies. Enforcement includes: prohibiting information transfers between interconnected systems (i.e., allowing access only); employing hardware mechanisms to enforce one-way information flows; and implementing trustworthy regrading mechanisms to reassign security attributes and security labels."
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
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_4" {
  title       = "3.1.4 Separate the duties of individuals to reduce the risk of malevolent activity without collusion"
  description = "Separation of duties addresses the potential for abuse of authorized privileges and helps to reduce the risk of malevolent activity without collusion. Separation of duties includes dividing mission functions and system support functions among different individuals or roles; conducting system support functions with different individuals (e.g., configuration management, quality assurance and testing, system management, programming, and network security); and ensuring that security personnel administering access control functions do not also administer audit functions. Because separation of duty violations can span systems and application domains, organizations consider the entirety of organizational systems and system components when developing policy on separation of duties."
  children = [
    control.ec2_instance_iam_profile_attached,
    control.ecs_task_definition_user_for_host_mode_check,
    control.emr_cluster_kerberos_enabled,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_policy_restrict_public_access
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_5" {
  title       = "3.1.5 Employ the principle of least privilege, including for specific security functions and privileged accounts"
  description = "Organizations employ the principle of least privilege for specific duties and authorized accesses for users and processes. The principle of least privilege is applied with the goal of authorized privileges no higher than necessary to accomplish required organizational missions or business functions. Organizations consider the creation of additional processes, roles, and system accounts as necessary, to achieve least privilege. Organizations also apply least privilege to the development, implementation, and operation of organizational systems. Security functions include establishing system accounts, setting events to be logged, setting intrusion detection parameters, and configuring access authorizations (i.e., permissions, privileges). Privileged accounts, including super user accounts, are typically described as system administrator for various types of commercial off-the-shelf operating systems. Restricting privileged accounts to specific personnel or roles prevents day-to-day users from having access to privileged information or functions. Organizations may differentiate in the application of this requirement between allowed privileges for local accounts and for domain accounts provided organizations retain the ability to control system configurations for key security parameters and as otherwise necessary to sufficiently mitigate risk."
  children = [
    control.ec2_instance_iam_profile_attached,
    control.emr_cluster_kerberos_enabled,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_custom_no_blocked_kms_actions,
    control.iam_policy_inline_no_blocked_kms_actions,
    control.iam_policy_no_star_star,
    control.iam_policy_unused,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.rds_db_cluster_iam_authentication_enabled,
    control.rds_db_instance_iam_authentication_enabled,
    control.s3_bucket_policy_restrict_public_access
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_6" {
  title       = "3.1.6 Use non-privileged accounts or roles when accessing nonsecurity functions"
  description = "This requirement limits exposure when operating from within privileged accounts or roles. The inclusion of roles addresses situations where organizations implement access control policies such as role-based access control and where a change of role provides the same degree of assurance in the change of access authorizations for the user and all processes acting on behalf of the user as would be provided by a change between a privileged and non-privileged account."
  children = [
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_7" {
  title       = "3.1.7 Prevent non-privileged users from executing privileged functions and capture the execution of such functions in audit logs"
  description = "Privileged functions include establishing system accounts, performing system integrity checks, conducting patching operations, or administering cryptographic key management activities. Nonprivileged users are individuals that do not possess appropriate authorizations. Circumventing intrusion detection and prevention mechanisms or malicious code protection mechanisms are examples of privileged functions that require protection from non-privileged users. Note that this requirement represents a condition to be achieved by the definition of authorized privileges in 3.1.2. Misuse of privileged functions, either intentionally or unintentionally by authorized users, or by unauthorized external entities that have compromised system accounts, is a serious and ongoing concern and can have significant adverse impacts on organizations. Logging the use of privileged functions is one way to detect such misuse, and in doing so, help mitigate the risk from insider threats and the advanced persistent threat."
  children = [
    control.emr_cluster_kerberos_enabled,
    control.iam_group_not_empty,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_in_group,
    control.s3_bucket_policy_restrict_public_access
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_12" {
  title       = "3.1.12 Monitor and control remote access sessions"
  description = "Remote access is access to organizational systems by users (or processes acting on behalf of users) communicating through external networks (e.g., the Internet). Remote access methods include dial-up, broadband, and wireless. Organizations often employ encrypted virtual private networks (VPNs) to enhance confidentiality over remote connections. The use of encrypted VPNs does not make the access non-remote; however, the use of VPNs, when adequately provisioned with appropriate control (e.g., employing encryption techniques for confidentiality protection), may provide sufficient assurance to the organization that it can effectively treat such connections as internal networks. VPNs with encrypted tunnels can affect the capability to adequately monitor network communications traffic for malicious code. Automated monitoring and control of remote access sessions allows organizations to detect cyberattacks and help to ensure ongoing compliance with remote access policies by auditing connection activities of remote users on a variety of system components (e.g., servers, workstations, notebook computers, smart phones, and tablets)."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.guardduty_enabled,
    control.rds_db_instance_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.securityhub_enabled,
    control.vpc_flow_logs_enabled,
    control.vpc_igw_attached_to_authorized_vpc,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_13" {
  title       = "3.1.13 Employ cryptographic mechanisms to protect the confidentiality of remote access sessions"
  description = "Cryptographic standards include FIPS-validated cryptography and NSA-approved cryptography."
  children = [
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_14" {
  title       = "3.1.14 Route remote access via managed access control points"
  description = "Routing remote access through managed access control points enhances explicit, organizational control over such connections, reducing the susceptibility to unauthorized access to organizational systems resulting in the unauthorized disclosure of CUI."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_user_console_access_mfa_enabled,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.opensearch_domain_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_1_20" {
  title       = "3.1.20 Verify and control/limit connections to and use of external systems"
  description = "External systems are systems or components of systems for which organizations typically have no direct supervision and authority over the application of security requirements and controls or the determination of the effectiveness of implemented controls on those systems. External systems include personally owned systems, components, or devices and privately-owned computing and communications devices resident in commercial or public facilities. This requirement also addresses the use of external systems for the processing, storage, or transmission of CUI, including accessing cloud services (e.g., infrastructure as a service, platform as a service, or software as a service) from organizational systems. Organizations establish terms and conditions for the use of external systems in accordance with organizational security policies and procedures. Terms and conditions address as a minimum, the types of applications that can be accessed on organizational systems from external systems. If terms and conditions with the owners of external systems cannot be established, organizations may impose restrictions on organizational personnel using those external systems. This requirement recognizes that there are circumstances where individuals using external systems (e.g., contractors, coalition partners) need to access organizational systems. In those situations, organizations need confidence that the external systems contain the necessary controls so as not to compromise, damage, or otherwise harm organizational systems. Verification that the required controls have been effectively implemented can be achieved by third-party, independent assessments, attestations, or other means, depending on the assurance or confidence level required by organizations. Note that while “external” typically refers to outside of the organization's direct supervision and authority, that is not always the case. Regarding the protection of CUI across an organization, the organization may have systems that process CUI and others that do not. And among the systems that process CUI there are likely access restrictions for CUI that apply between systems. Therefore, from the perspective of a given system, other systems within the organization may be considered 'external' to that system."
  children = [
    control.s3_bucket_policy_restrict_public_access,
    control.s3_public_access_block_account,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.nist_800_171_rev_2_common_tags
}
