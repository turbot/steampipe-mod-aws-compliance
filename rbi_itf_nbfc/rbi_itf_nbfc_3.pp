benchmark "rbi_itf_nbfc_3" {
  title       = "3. Information Security"
  description = "Information is an asset to all NBFCs and Information Security (IS) refers to the protection of these assets in order to achieve organizational goals. The purpose of IS is to control access to sensitive information, ensuring use only by legitimate users so that data cannot be read or compromised without proper authorization. NBFCs must have a board approved IS Policy with the following basic tenets: a. Confidentiality - Ensuring access to sensitive data to authorized users only, b. Integrity - Ensuring accuracy and reliability of information by ensuring that there is no modification without authorization, c. Availability - Ensuring that uninterrupted data is available to users when it is needed, d. Authenticity - For IS it is necessary to ensure that the data, transactions, communications or documents (electronic or physical) are genuine."

  children = [
    benchmark.rbi_itf_nbfc_3_1,
    benchmark.rbi_itf_nbfc_3_3,
    benchmark.rbi_itf_nbfc_3_5
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "3"
  })
}

benchmark "rbi_itf_nbfc_3_1" {
  title       = "3.1 Information Security Policy"
  description = "The IS Policy must provide for a IS framework with the following basic tenets: a. Identification and Classification of Information Assets, b. Segregation of functions, c. Role based Access Control, d. Personnel Security, e. Physical Security, f. Maker-checker, g. Incident Management, h. Trails, i. Public Key Infrastructure (PKI)."

  children = [
    benchmark.rbi_itf_nbfc_3_1_a,
    benchmark.rbi_itf_nbfc_3_1_c,
    benchmark.rbi_itf_nbfc_3_1_g,
    benchmark.rbi_itf_nbfc_3_1_h,
    benchmark.rbi_itf_nbfc_3_1_i
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "3.1"
  })
}

benchmark "rbi_itf_nbfc_3_1_a" {
  title       = "3.1.a Identification and Classification of Information Assets"
  description = "NBFCs shall maintain detailed inventory of Information Asset with distinct and clear identification of the asset."

  children = [
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.ecr_repository_tag_immutability_enabled
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "3.1.a"
  })
}

benchmark "rbi_itf_nbfc_3_1_c" {
  title       = "3.1.c Role based Access Control"
  description = "Access to information should be based on well-defined user roles (system administrator, user manager, application owner etc.), NBFCs shall avoid dependence on one or few persons for a particular job. There should be clear delegation of authority for right to upgrade/change user profiles and permissions and also key business parameters (eg. interest rates) which should be documented."

  children = [
    control.ec2_instance_iam_profile_attached,
    control.efs_access_point_enforce_root_directory,
    control.efs_access_point_enforce_user_identity,
    control.emr_cluster_kerberos_enabled,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_not_empty,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "3.1.c"
  })
}

benchmark "rbi_itf_nbfc_3_1_g" {
  title       = "3.1.g Incident Management"
  description = "The IS Policy should define what constitutes an incident. NBFCs shall develop and implement processes for preventing, detecting, analysing and responding to information security incidents."

  children = [
    control.elb_application_lb_waf_enabled,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "3.1.g"
  })
}

benchmark "rbi_itf_nbfc_3_1_h" {
  title       = "3.1.h Trails"
  description = "NBFCs shall ensure that audit trails exist for IT assets satisfying its business requirements including regulatory and legal requirements, facilitating audit, serving as forensic evidence when required and assisting in dispute resolution. If an employee, for instance, attempts to access an unauthorized section, this improper activity should be recorded in the audit trail."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudwatch_log_group_retention_period_365,
    control.codebuild_project_logging_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.es_domain_logs_to_cloudwatch,
    control.opensearch_domain_logs_to_cloudwatch,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_audit_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "3.1.h"
  })
}

benchmark "rbi_itf_nbfc_3_1_i" {
  title       = "3.1.i Public Key Infrastructure (PKI)"
  description = "NBFCs may increase the usage of PKI to ensure confidentiality of data, access control, data integrity, authentication and nonrepudiation."

  children = [
    control.acm_certificate_expires_30_days,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_http_drop_invalid_header_enabled,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.opensearch_domain_https_required,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "3.1.i"
  })
}

benchmark "rbi_itf_nbfc_3_3" {
  title       = "3.3 Vulnerability Management"
  description = "A vulnerability can be defined as an inherent configuration flaw in an organization's information technology base, whether hardware or software, which can be exploited by a third party to gather sensitive information regarding the organization. Vulnerability management is an ongoing process to determine the process of eliminating or mitigating vulnerabilities based upon the risk and cost associated with the vulnerabilities. NBFCs may devise a strategy for managing and eliminating vulnerabilities and such strategy may clearly be communicated in the Cyber Security policy."

  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_finding_archived,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant

  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "3.3"
  })
}

benchmark "rbi_itf_nbfc_3_5" {
  title       = "3.5 Cyber Crisis Management Plan"
  description = "A Cyber Crisis Management Plan (CCMP) should be immediately evolved and should be a part of the overall Board approved strategy. CCMP should address the following four aspects: (i) Detection (ii) Response (iii) Recovery and (iv) Containment. NBFCs need to take effective measures to prevent cyber-attacks and to promptly detect any cyber-intrusions so as to respond / recover / contain the fall out. NBFCs are expected to be well prepared to face emerging cyber-threats such as ‘zero-day’ attacks, remote access threats, and targeted attacks. Among other things, NBFCs should take necessary preventive and corrective measures in addressing various types of cyber threats including, but not limited to, denial of service, distributed denial of services (DDoS), ransom-ware / crypto ware, destructive malware, business email frauds including spam, email phishing, spear phishing, whaling, vishing frauds, drive-by downloads, browser gateway fraud, ghost administrator exploits, identity frauds, memory update frauds, password related frauds, etc."

  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_enabled,
    control.guardduty_finding_archived,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.rbi_itf_nbfc_common_tags, {
    rbi_itf_nbfc_item_id = "3.5"
  })
}
