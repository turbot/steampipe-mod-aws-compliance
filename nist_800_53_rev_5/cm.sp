benchmark "nist_800_53_rev_5_cm" {
  title       = "Configuration Management (CM)"
  description = "CM controls are specific to an organization’s configuration management policies. This includes a baseline configuration to operate as the basis for future builds or changes to information systems. Additionally, this includes information system component inventories and a security impact analysis control."
  children = [
    benchmark.nist_800_53_rev_5_cm_2,
    benchmark.nist_800_53_rev_5_cm_3,
    benchmark.nist_800_53_rev_5_cm_5,
    benchmark.nist_800_53_rev_5_cm_6,
    benchmark.nist_800_53_rev_5_cm_7,
    benchmark.nist_800_53_rev_5_cm_8,
    benchmark.nist_800_53_rev_5_cm_9,
    benchmark.nist_800_53_rev_5_cm_12
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_2" {
  title       = "Baseline Configuration (CM-2)"
  description = "The organization develops, documents, and maintains under configuration control, a current baseline configuration of the information system."
  children = [
    benchmark.nist_800_53_rev_5_cm_2_2,
    benchmark.nist_800_53_rev_5_cm_2_a,
    benchmark.nist_800_53_rev_5_cm_2_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_2_a" {
  title       = "CM-2(a)"
  description = "Develop, document, and maintain under configuration control, a current baseline configuration of the system."
  children = [
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_2_b" {
  title       = "CM-2(b)"
  description = "Review and update the baseline configuration of the system: 1. [Assignment: organization-defined frequency]; 2. When required due to [Assignment: organization-defined circumstances]; and 3. When system components are installed or upgraded."
  children = [
    benchmark.nist_800_53_rev_5_cm_2_b_1,
    benchmark.nist_800_53_rev_5_cm_2_b_2,
    benchmark.nist_800_53_rev_5_cm_2_b_3,
    control.account_part_of_organizations,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_2_b_1" {
  title       = "CM-2(b)(1)"
  description = "Review and update the baseline configuration of the system: 1. [Assignment: organization-defined frequency]."
  children = [
    control.account_part_of_organizations,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_2_b_2" {
  title       = "CM-2(b)(2)"
  description = "Review and update the baseline configuration of the system: 2. When required due to [Assignment: organization-defined circumstances]."
  children = [
    control.account_part_of_organizations,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_2_b_3" {
  title       = "CM-2(b)(3)"
  description = "Review and update the baseline configuration of the system: 3 When system components are installed or upgraded."
  children = [
    control.account_part_of_organizations,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_2_2" {
  title       = "CM-2(2) Automation Support For Accuracy And Currency"
  description = "Maintain the currency, completeness, accuracy, and availability of the baseline configuration of the system using [Assignment: organization-defined automated mechanisms]."
  children = [
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_3" {
  title       = "Configuration Change Control (CM-3)"
  description = "The organization authorizes, documents, and controls changes to the information system."
  children = [
    benchmark.nist_800_53_rev_5_cm_3_3,
    benchmark.nist_800_53_rev_5_cm_3_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_3_a" {
  title       = "CM-3(a)"
  description = "Determine and document the types of changes to the system that are configuration-controlled."
  children = [
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_instance_deletion_protection_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_3_3" {
  title       = "CM-3(3) Automated Change Implementation"
  description = "Implement changes to the current system baseline and deploy the updated baseline across the installed base using [Assignment: organization-defined automated mechanisms]."
  children = [
    control.account_part_of_organizations,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_5" {
  title       = "Access Restrictions For Change (CM-5)"
  description = "Define, document, approve, and enforce physical and logical access restrictions associated with changes to the system."
  children = [
    benchmark.nist_800_53_rev_5_cm_5_1
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_5_1" {
  title       = "CM-5(1) Automated Access Enforcement And Audit Records"
  description = "a. Enforce access restrictions using [Assignment: organization-defined automated mechanisms]; and b. Automatically generate audit records of the enforcement actions."
  children = [
    benchmark.nist_800_53_rev_5_cm_5_1_a,
    benchmark.nist_800_53_rev_5_cm_5_1_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_5_1_a" {
  title       = "CM-5(1)(a)"
  description = "Enforce access restrictions using [Assignment: organization-defined automated mechanisms]."
  children = [
    control.ec2_instance_iam_profile_attached,
    control.ec2_instance_uses_imdsv2,
    control.ecs_task_definition_user_for_host_mode_check,
    control.iam_account_password_policy_min_length_14,
    control.iam_all_policy_no_service_wild_card,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_5_1_b" {
  title       = "CM-5(1)(b)"
  description = "Automatically generate audit records of the enforcement actions."
  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.elb_application_classic_lb_logging_enabled,
    control.rds_db_instance_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_6" {
  title       = "Configuration Settings (CM-6)"
  description = "The organization: (i) establishes mandatory configuration settings for information technology products employed within the information system; (ii) configures the security settings of information technology products to the most restrictive mode consistent with operational requirements; (iii) documents the configuration settings; and (iv) enforces the configuration settings in all components of the information system."
  children = [
    benchmark.nist_800_53_rev_5_cm_6_a,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_6_a" {
  title       = "CM-6(a)"
  description = "Establish and document configuration settings for components employed within the system that reflect the most restrictive mode consistent with operational requirements using [Assignment: organization-defined common secure configurations]."
  children = [
    control.account_part_of_organizations,
    control.autoscaling_group_with_lb_use_health_check,
    control.autoscaling_launch_config_public_ip_disabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.ec2_instance_iam_profile_attached,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.kms_cmk_rotation_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_flow_logs_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_7" {
  title       = "Least Functionality (CM-7)"
  description = "The organization configures the information system to provide only essential capabilities and prohibits or restricts the use of the functions, ports, protocols, and/or services."
  children = [
    benchmark.nist_800_53_rev_5_cm_7_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_7_b" {
  title       = "CM-7(b)"
  description = "Prohibit or restrict the use of the following functions, ports, protocols, software, and/or services: [Assignment: organization-defined prohibited or restricted functions, system ports, protocols, software, and/or services]."
  children = [
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8" {
  title       = "System Component Inventory (CM-8)"
  description = "The organization develops and documents an inventory of information system components that accurately reflects the current information system, includes all components within the authorization boundary of the information system, is at the level of granularity deemed necessary for tracking and reporting and reviews and updates the information system component inventory."
  children = [
    benchmark.nist_800_53_rev_5_cm_8_1,
    benchmark.nist_800_53_rev_5_cm_8_2,
    benchmark.nist_800_53_rev_5_cm_8_3,
    benchmark.nist_800_53_rev_5_cm_8_6,
    benchmark.nist_800_53_rev_5_cm_8_a,
    benchmark.nist_800_53_rev_5_cm_8_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_a" {
  title       = "CM-8(a)"
  description = "Develop and document an inventory of system components that: 1. Accurately reflects the system; 2. Includes all components within the system; 3. Does not include duplicate accounting of components or components assigned to any other system; 4. Is at the level of granularity deemed necessary for tracking and reporting; and 5. Includes the following information to achieve system component accountability: [Assignment: organization-defined information deemed necessary to achieve effective system component accountability]."
  children = [
    benchmark.nist_800_53_rev_5_cm_8_a_1,
    benchmark.nist_800_53_rev_5_cm_8_a_2,
    benchmark.nist_800_53_rev_5_cm_8_a_3,
    benchmark.nist_800_53_rev_5_cm_8_a_4,
    benchmark.nist_800_53_rev_5_cm_8_a_5,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_a_1" {
  title       = "CM-8(a)(1)"
  description = "Develop and document an inventory of system components that: 1. Accurately reflects the system."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_a_2" {
  title       = "CM-8(a)(2)"
  description = "Develop and document an inventory of system components that: 2. Includes all components within the system."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_a_3" {
  title       = "CM-8(a)(3)"
  description = "Develop and document an inventory of system components that: 3. Does not include duplicate accounting of components or components assigned to any other system."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_a_4" {
  title       = "CM-8(a)(4)"
  description = "Develop and document an inventory of system components that: 4. Is at the level of granularity deemed necessary for tracking and reporting."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_a_5" {
  title       = "CM-8(a)(5)"
  description = "Develop and document an inventory of system components that: 5. Includes the following information to achieve system component accountability: [Assignment: organization-defined information deemed necessary to achieve effective system component accountability]."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_b" {
  title       = "CM-8(b)"
  description = "Review and update the system component inventory [Assignment: organization-defined frequency]."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_1" {
  title       = "CM-8(1) Updates During Installation And Removals"
  description = "Update the inventory of system components as part of component installations, removals, and system updates."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_2" {
  title       = "CM-8(2) Automated Maintenance"
  description = "Maintain the currency, completeness, accuracy, and availability of the inventory of system components using [Assignment: organization-defined automated mechanisms]."
  children = [
    control.ec2_instance_ssm_managed
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_3" {
  title       = "CM-8(3) Automated Unauthorized Component Detection"
  description = "The organization: Employs automated mechanisms [Assignment: organization-defined frequency] to detect the presence of unauthorized hardware, software, and firmware components within the information system; and Takes the following actions when unauthorized components are detected: [Selection (one or more): disables network access by such components; isolates the components; notifies [Assignment: organization-defined personnel or roles]]."
  children = [
    benchmark.nist_800_53_rev_5_cm_8_3_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_3_a" {
  title       = "CM-8(3)(a)"
  description = "Detect the presence of unauthorized hardware, software, and firmware components within the system using [Assignment: organization-defined automated mechanisms] [Assignment: organization-defined frequency]."
  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_8_6" {
  title       = "CM-8(6) Assessed Configurations And Approved Deviations"
  description = "Include assessed component configurations and any approved deviations to current deployed configurations in the system component inventory."
  children = [
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_9" {
  title       = "Configuration Management Plan (CM-9)"
  description = "Develop, document, and implement a configuration management plan for the system that: a. Addresses roles, responsibilities, and configuration management processes and procedures; b. Establishes a process for identifying configuration items throughout the system development life cycle and for managing the configuration of the configuration items; c. Defines the configuration items for the system and places the configuration items under configuration management; d. Is reviewed and approved by [Assignment: organization-defined personnel or roles]; and e. Protects the configuration management plan from unauthorized disclosure and modification."
  children = [
    benchmark.nist_800_53_rev_5_cm_9_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_9_b" {
  title       = "CM-9(b)"
  description = "Develop, document, and implement a configuration management plan for the system that: b. Establishes a process for identifying configuration items throughout the system development life cycle and for managing the configuration of the configuration items."
  children = [
    control.account_part_of_organizations,
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_s3_data_events_enabled,
    control.cloudtrail_trail_integrated_with_logs,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.iam_account_password_policy_min_length_14,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90,
    control.kms_cmk_rotation_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_logging_enabled,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_flow_logs_enabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_12" {
  title       = "Information Location (CM-12)"
  description = "a. Identify and document the location of [Assignment: organization-defined information] and the specific system components on which the information is processed and stored; b. Identify and document the users who have access to the system and system components where the information is processed and stored; and c. Document changes to the location (i.e., system or system components) where the information is processed and stored."
  children = [
    benchmark.nist_800_53_rev_5_cm_12_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cm_12_b" {
  title       = "CM-12(b)"
  description = "Identify and document the users who have access to the system and system components where the information is processed and stored."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = local.nist_800_53_rev_5_common_tags
}