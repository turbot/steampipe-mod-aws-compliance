benchmark "nist_800_53_rev_5_sc" {
  title       = "System and Communications Protection (SC)"
  description = "The SC control family is responsible for systems and communications protection procedures. This includes boundary protection, protection of information at rest, collaborative computing devices, cryptographic protection, denial of service protection, and many others."
  children = [
    benchmark.nist_800_53_rev_5_sc_5,
    benchmark.nist_800_53_rev_5_sc_6,
    benchmark.nist_800_53_rev_5_sc_7,
    benchmark.nist_800_53_rev_5_sc_8,
    benchmark.nist_800_53_rev_5_sc_12,
    benchmark.nist_800_53_rev_5_sc_13,
    benchmark.nist_800_53_rev_5_sc_16,
    benchmark.nist_800_53_rev_5_sc_22,
    benchmark.nist_800_53_rev_5_sc_23,
    benchmark.nist_800_53_rev_5_sc_25,
    benchmark.nist_800_53_rev_5_sc_28,
    benchmark.nist_800_53_rev_5_sc_36,
    benchmark.nist_800_53_rev_5_sc_43
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_5" {
  title       = "Denial Of Service Protection (SC-5)"
  description = "The information system protects against or limits the effects of the following types of denial of service attacks: [Assignment: organization-defined types of denial of service attacks or reference to source for such information] by employing [Assignment: organization-defined security safeguards]."
  children = [
    benchmark.nist_800_53_rev_5_sc_5_1,
    benchmark.nist_800_53_rev_5_sc_5_2,
    benchmark.nist_800_53_rev_5_sc_5_3,
    benchmark.nist_800_53_rev_5_sc_5_a,
    benchmark.nist_800_53_rev_5_sc_5_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_5_1" {
  title       = "SC-5(1) Restrict Ability TO Attack Other Systems"
  description = "Restrict the ability of individuals to launch the following denial-of-service attacks against other systems: [Assignment: organization-defined denial-of-service attacks]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_sc_5_2" {
  title       = "SC-5(2) Capacity, Bandwidth, And Redundancy"
  description = "Manage capacity, bandwidth, or other redundancy to limit the effects of information flooding denial-of-service attacks."
  children = [
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.rds_db_instance_protected_by_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_maintenance_settings_check,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_5_3" {
  title       = "SC-5(3) Detection And Monitoring"
  description = "a. Employ the following monitoring tools to detect indicators of denial-of-service attacks against, or launched from, the system: [Assignment: organization-defined monitoring tools]; and b. Monitor the following system resources to determine if sufficient resources exist to prevent effective denial-of-service attacks: [Assignment: organization-defined system resources]."
  children = [
    benchmark.nist_800_53_rev_5_sc_5_3_a,
    benchmark.nist_800_53_rev_5_sc_5_3_b
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_sc_5_a" {
  title       = "SC-5(a)"
  description = "[Selection: Protect against; Limit] the effects of the following types of denial-of-service events: [Assignment: organization-defined types of denial-of-service events]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_sc_5_b" {
  title       = "SC-5(b)"
  description = "Employ the following controls to achieve the denial-of-service objective: [Assignment: organization-defined controls by type of denial-of-service event]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_sc_5_3_a" {
  title       = "SC-5(3)(a)"
  description = "Employ the following monitoring tools to detect indicators of denial-of-service attacks against, or launched from, the system: [Assignment: organization-defined monitoring tools]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_sc_5_3_b" {
  title       = "SC-5(3)(b)"
  description = "Monitor the following system resources to determine if sufficient resources exist to prevent effective denial-of-service attacks: [Assignment: organization-defined system resources]."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_sc_6" {
  title       = "Resource Availability (SC-6)"
  description = "Protect the availability of resources by allocating [Assignment: organization-defined resources] by [Selection (one or more): priority; quota; [Assignment: organization-defined controls]]."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.lambda_function_concurrent_execution_limit_configured,
    control.rds_db_instance_multiple_az_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7" {
  title       = "Boundary Protection (SC-7)"
  description = "The information system: a. Monitors and controls communications at the external boundary of the system and at key internal boundaries within the system; b. Implements subnetworks for publicly accessible system components that are [Selection: physically; logically] separated from internal organizational networks; and c. Connects to external networks or information systems only through managed interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture."
  children = [
    benchmark.nist_800_53_rev_5_sc_7_2,
    benchmark.nist_800_53_rev_5_sc_7_3,
    benchmark.nist_800_53_rev_5_sc_7_4,
    benchmark.nist_800_53_rev_5_sc_7_5,
    benchmark.nist_800_53_rev_5_sc_7_7,
    benchmark.nist_800_53_rev_5_sc_7_9,
    benchmark.nist_800_53_rev_5_sc_7_11,
    benchmark.nist_800_53_rev_5_sc_7_12,
    benchmark.nist_800_53_rev_5_sc_7_16,
    benchmark.nist_800_53_rev_5_sc_7_20,
    benchmark.nist_800_53_rev_5_sc_7_21,
    benchmark.nist_800_53_rev_5_sc_7_24,
    benchmark.nist_800_53_rev_5_sc_7_25,
    benchmark.nist_800_53_rev_5_sc_7_26,
    benchmark.nist_800_53_rev_5_sc_7_27,
    benchmark.nist_800_53_rev_5_sc_7_28,
    benchmark.nist_800_53_rev_5_sc_7_a,
    benchmark.nist_800_53_rev_5_sc_7_b,
    benchmark.nist_800_53_rev_5_sc_7_c
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_2" {
  title       = "SC-7(2) Public Access"
  description = "Provide the capability to dynamically isolate [Assignment: organization-defined system components] from other system components."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_3" {
  title       = "SC-7(3) Access Points"
  description = "Limit the number of external network connections to the system."
  children = [
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_4" {
  title       = "SC-7(4) External Telecommunications Services"
  description = "a. Implement a managed interface for each external telecommunication service; b. Establish a traffic flow policy for each managed interface; c. Protect the confidentiality and integrity of the information being transmitted across each interface; d. Document each exception to the traffic flow policy with a supporting mission or business need and duration of that need; e. Review exceptions to the traffic flow policy [Assignment: organization-defined frequency] and remove exceptions that are no longer supported by an explicit mission or business need; f. Prevent unauthorized exchange of control plane traffic with external networks; g. Publish information to enable remote networks to detect unauthorized control plane traffic from internal networks; and h. Filter unauthorized control plane traffic from external networks."
  children = [
    benchmark.nist_800_53_rev_5_sc_7_4_b,
    benchmark.nist_800_53_rev_5_sc_7_4_g
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_4_b" {
  title       = "SC-7(4)(b)"
  description = "Establish a traffic flow policy for each managed interface."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_4_g" {
  title       = "SC-7(4)(g)"
  description = "Publish information to enable remote networks to detect unauthorized control plane traffic from internal networks."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_5" {
  title       = "SC-7(5) Deny By Default — Allow By Exception"
  description = "Deny network communications traffic by default and allow network communications traffic by exception [Selection (one or more): at managed interfaces; for [Assignment: organization-defined systems]]."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_7" {
  title       = "SC-7(7) Split Tunneling For Remote Devices"
  description = "Prevent split tunneling for remote devices connecting to organizational systems unless the split tunnel is securely provisioned using [Assignment: organization-defined safeguards]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_9" {
  title       = "SC-7(9) Restrict Threatening Outgoing Communications Traffic"
  description = "a. Detect and deny outgoing communications traffic posing a threat to external systems; and b. Audit the identity of internal users associated with denied communications."
  children = [
    benchmark.nist_800_53_rev_5_sc_7_9_a,
    benchmark.nist_800_53_rev_5_sc_7_9_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_9_a" {
  title       = "SC-7(9)(a)"
  description = "Detect and deny outgoing communications traffic posing a threat to external systems."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_9_b" {
  title       = "SC-7(9)(b)"
  description = "Audit the identity of internal users associated with denied communications."
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
    control.wafv2_web_acl_logging_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_11" {
  title       = "SC-7(11) Restrict Incoming communications Traffic"
  description = "Only allow incoming communications from [Assignment: organization-defined authorized sources] to be routed to [Assignment: organization-defined authorized destinations]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_12" {
  title       = "SC-7(12) Host-Based Protection"
  description = "Implement [Assignment: organization-defined host-based boundary protection mechanisms] at [Assignment: organization-defined system components]."
  children = [
    control.acm_certificate_expires_30_days,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_16" {
  title       = "SC-7(16) Prevent Discovery Of System Components"
  description = "Prevent the discovery of specific system components that represent a managed interface."
  children = [
    control.acm_certificate_expires_30_days,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_20" {
  title       = "SC-7(20) Prevent Discovery Of System Components"
  description = "Prevent the discovery of specific system components that represent a managed interface."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_21" {
  title       = "SC-7(21) Isolation Of System Components"
  description = "Employ boundary protection mechanisms to isolate [Assignment: organization-defined system components] supporting [Assignment: organization-defined missions and/or business functions]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_24" {
  title       = "SC-7(24) Personally Identifiable Information"
  description = "For systems that process personally identifiable information: a. Apply the following processing rules to data elements of personally identifiable information: [Assignment: organization-defined processing rules];b. Monitor for permitted processing at the external interfaces to the system and at key internal boundaries within the system; c. Document each processing exception; and d. Review and remove exceptions that are no longer supported."
  children = [
    benchmark.nist_800_53_rev_5_sc_7_24_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_24_b" {
  title       = "SC-7(24)(b)"
  description = "For systems that process personally identifiable information: (b) Monitor for permitted processing at the external interfaces to the system and at key internal boundaries within the system."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_25" {
  title       = "SC-7(25) Unclassified National Security System Connections"
  description = "Prohibit the direct connection of [Assignment: organization-defined unclassified national security system] to an external network without the use of [Assignment: organization-defined boundary protection device]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_26" {
  title       = "SC-7(26) Classified National Security System Connections"
  description = "Prohibit the direct connection of a classified national security system to an external network without the use of [Assignment: organization-defined boundary protection device]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_27" {
  title       = "SC-7(27) Unclassified Non-National Security System Connections"
  description = "Prohibit the direct connection of [Assignment: organization-defined unclassified non-national security system] to an external network without the use of [Assignment: organization-defined boundary protection device]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_28" {
  title       = "SC-7(28) Connections To Public Networks"
  description = "Prohibit the direct connection of [Assignment: organization-defined system] to a public network."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_a" {
  title       = "SC-7(a)"
  description = "Monitor and control communications at the external managed interfaces to the system and at key internal managed interfaces within the system."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_b" {
  title       = "SC-7(b)"
  description = "Implement subnetworks for publicly accessible system components that are [Selection: physically; logically] separated from internal organizational networks."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_enhanced_vpc_routing_enabled,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_7_c" {
  title       = "SC-7(c)"
  description = "Connect to external networks or systems only through managed interfaces consisting of boundary protection devices arranged in accordance with an organizational security and privacy architecture."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_8" {
  title       = "Transmission Confidentiality And Integrity (SC-8)"
  description = "Protect the [Selection (one or more): confidentiality; integrity] of transmitted information."
  children = [
    benchmark.nist_800_53_rev_5_sc_8_1,
    benchmark.nist_800_53_rev_5_sc_8_2,
    benchmark.nist_800_53_rev_5_sc_8_3,
    benchmark.nist_800_53_rev_5_sc_8_4,
    benchmark.nist_800_53_rev_5_sc_8_5,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_8_1" {
  title       = "SC-8(1) Cryptographic Protection"
  description = "Implement cryptographic mechanisms to [Selection (one or more): prevent unauthorized disclosure of information; detect changes to information] during transmission."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_8_2" {
  title       = "SC-8(2) Pre- And Post-Transmission Handling"
  description = "Maintain the [Selection (one or more): confidentiality; integrity] of information during preparation for transmission and during reception."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_8_3" {
  title       = "SC-8(3) Cryptographic Protection For Message Externals"
  description = "Implement cryptographic mechanisms to protect message externals unless otherwise protected by [Assignment: organization-defined alternative physical controls]."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dynamodb_table_encrypted_with_kms,
    control.ebs_attached_volume_encryption_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk,
    control.sns_topic_encrypted_at_rest
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_8_4" {
  title       = "SC-8(4) Conceal Or Ramdomize Communications"
  description = "Implement cryptographic mechanisms to conceal or randomize communication patterns unless otherwise protected by [Assignment: organization-defined alternative physical controls]."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dynamodb_table_encrypted_with_kms,
    control.ebs_attached_volume_encryption_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk,
    control.sns_topic_encrypted_at_rest
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_8_5" {
  title       = "SC-8(5) Protected Distribution System"
  description = "Implement [Assignment: organization-defined protected distribution system] to [Selection (one or more): prevent unauthorized disclosure of information; detect changes to information] during transmission."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_12" {
  title       = "Cryptographic Key Establishment And Management (SC-12)"
  description = "Establish and manage cryptographic keys when cryptography is employed within the system in accordance with the following key management requirements: [Assignment: organization-defined requirements for key generation, distribution, storage, access, and destruction]."
  children = [
    benchmark.nist_800_53_rev_5_sc_12_2,
    benchmark.nist_800_53_rev_5_sc_12_6,
    control.kms_cmk_rotation_enabled,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/KMS"
  })
}

benchmark "nist_800_53_rev_5_sc_12_2" {
  title       = "SC-12(2) Symmetric Keys"
  description = "Produce, control, and distribute symmetric cryptographic keys using [Selection: NIST FIPS-validated; NSA-approved] key management technology and processes."
  children = [
    control.kms_cmk_rotation_enabled,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/KMS"
  })
}

benchmark "nist_800_53_rev_5_sc_12_6" {
  title       = "SC-12(6) Physical Control Of Keys"
  description = "Maintain physical control of cryptographic keys when stored information is encrypted by external service providers."
  children = [
    control.kms_cmk_rotation_enabled,
    control.kms_key_not_pending_deletion
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/KMS"
  })
}

benchmark "nist_800_53_rev_5_sc_13" {
  title       = "Cryptographic Protection (SC-13)"
  description = "a. Determine the [Assignment: organization-defined cryptographic uses]; and b. Implement the following types of cryptography required for each specified cryptographic use: [Assignment: organization-defined types of cryptography for each specified cryptographic use]."
  children = [
    benchmark.nist_800_53_rev_5_sc_13_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_13_a" {
  title       = "SC-13(a)"
  description = "Determine the [Assignment: organization-defined cryptographic uses]."
  children = [
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dynamodb_table_encrypted_with_kms,
    control.ebs_attached_volume_encryption_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk,
    control.sns_topic_encrypted_at_rest
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_16" {
  title       = "Transmission Of Security And Privacy Attributes (SC-16)"
  description = "Associate [Assignment: organization-defined security and privacy attributes] with information exchanged between systems and between system components."
  children = [
    benchmark.nist_800_53_rev_5_sc_16_1
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_16_1" {
  title       = "SC-16(1) Integrity Verification"
  description = "Verify the integrity of transmitted security and privacy attributes."
  children = [
    control.cloudtrail_trail_validation_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_22" {
  title       = "Architecture And Provisioning For Name/Address Resolution Service (SC-22)"
  description = "Ensure the systems that collectively provide name/address resolution service for an organization are fault-tolerant and implement internal and external role separation."
  children = [
    control.dynamodb_table_auto_scaling_enabled,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_23" {
  title       = "Session Authenticity (SC-23)"
  description = "Protect the authenticity of communications sessions."
  children = [
    benchmark.nist_800_53_rev_5_sc_23_3,
    benchmark.nist_800_53_rev_5_sc_23_5,
    control.apigateway_rest_api_stage_use_ssl_certificate,
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_node_to_node_encryption_enabled,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_23_3" {
  title       = "SC-23(3) Unique System-Generated Session Identifiers"
  description = "Generate a unique session identifier for each session with [Assignment: organization-defined randomness requirements] and recognize only session identifiers that are system-generated."
  children = [
    control.ec2_instance_uses_imdsv2,
    control.iam_account_password_policy_min_length_14,
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
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_23_5" {
  title       = "SC-23(5) Allowed Certificate Authorities"
  description = "Only allow the use of [Assignment: organization-defined certificate authorities] for verification of the establishment of protected sessions."
  children = [
    control.elb_application_network_lb_use_ssl_certificate,
    control.elb_classic_lb_use_ssl_certificate
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/ELB"
  })
}

benchmark "nist_800_53_rev_5_sc_25" {
  title       = "Thin Nodes (SC-25)"
  description = "Employ minimal functionality and information storage on the following system components: [Assignment: organization-defined system components]."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.lambda_function_in_vpc,
    control.lambda_function_restrict_public_access,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.s3_public_access_block_bucket,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_subnet_auto_assign_public_ip_disabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_28" {
  title       = "Protection Of Information At Rest (SC-28)"
  description = "Protect the [Selection (one or more): confidentiality; integrity] of the following information at rest: [Assignment: organization-defined information at rest]."
  children = [
    benchmark.nist_800_53_rev_5_sc_28_1,
    benchmark.nist_800_53_rev_5_sc_28_2
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_28_1" {
  title       = "SC-28(1) Cryptographic Protection"
  description = "Implement cryptographic mechanisms to prevent unauthorized disclosure and modification of the following information at rest on [Assignment: organization-defined system components or media]: [Assignment: organization-defined information]."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dynamodb_table_encrypted_with_kms,
    control.ebs_attached_volume_encryption_enabled,
    control.ec2_ebs_default_encryption_enabled,
    control.efs_file_system_encrypt_data_at_rest,
    control.es_domain_encryption_at_rest_enabled,
    control.log_group_encryption_at_rest_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_logging_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_default_encryption_enabled,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk,
    control.sns_topic_encrypted_at_rest
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_28_2" {
  title       = "SC-28(2) Offline Storage"
  description = "Remove the following information from online storage and store offline in a secure location: [Assignment: organization-defined information]."
  children = [
    control.cloudwatch_log_group_retention_period_365
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/CloudWatch"
  })
}

benchmark "nist_800_53_rev_5_sc_36" {
  title       = "Distributed Processing And Storage (SC-36)"
  description = "Distribute the following processing and storage components across multiple [Selection: physical locations; logical domains]: [Assignment: organization-defined processing and storage components]."
  children = [
    benchmark.nist_800_53_rev_5_sc_36_1_a,
    control.dynamodb_table_auto_scaling_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_36_1_a" {
  title       = "SC-36(1)(a)"
  description = "Employ polling techniques to identify potential faults, errors, or compromises to the following processing and storage components: [Assignment: organization-defined distributed processing and storage components]."
  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.cloudwatch_alarm_action_enabled,
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.lambda_function_dead_letter_queue_configured,
    control.rds_db_instance_and_cluster_enhanced_monitoring_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_sc_43" {
  title       = "Usage Restrictions (SC-43)"
  description = "a. Establish usage restrictions and implementation guidelines for the following system components: [Assignment: organization-defined system components]; and b. Authorize, monitor, and control the use of such components within the system."
  children = [
    benchmark.nist_800_53_rev_5_sc_43_b
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "nist_800_53_rev_5_sc_43_b" {
  title       = "SC-43(b)"
  description = "Authorize, monitor, and control the use of such components within the system."
  children = [
    control.guardduty_enabled
  ]

  tags = merge(local.nist_800_53_rev_5_common_tags, {
    service = "AWS/GuardDuty"
  })
}