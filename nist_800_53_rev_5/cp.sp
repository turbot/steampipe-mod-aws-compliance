benchmark "nist_800_53_rev_5_cp" {
  title       = "Contingency Planning (CP)"
  description = "The CP control family includes controls specific to an organization's contingency plan if a cybersecurity event should occur. This includes controls like contingency plan testing, updating, training, and backups, and system reconstitution."
  children = [
    benchmark.nist_800_53_rev_5_cp_1,
    benchmark.nist_800_53_rev_5_cp_2,
    benchmark.nist_800_53_rev_5_cp_6,
    benchmark.nist_800_53_rev_5_cp_9,
    benchmark.nist_800_53_rev_5_cp_10
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_1" {
  title       = "Policy And Procedures (CP-1)"
  description = "a. Develop, document, and disseminate to [Assignment: organization-defined personnel or roles]: 1. [Selection (one or more): Organization-level; Mission/business process-level; System-level] contingency planning policy that: a). Addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and b). Is consistent with applicable laws, executive orders, directives regulations, policies, standards, and guidelines; and 2. Procedures to facilitate the implementation of the contingency planning policy and the associated contingency planning controls; b. Designate an [Assignment: organization-defined official] to manage the development, documentation, and dissemination of the contingency planning policy and procedures; and c. Review and update the current contingency planning: 1. Policy [Assignment: organization-defined frequency] and following [Assignment: organization-defined events]; and 2. Procedures [Assignment: organization-defined frequency] and following [Assignment: organization-defined events]."
  children = [
    benchmark.nist_800_53_rev_5_cp_1_2,
    benchmark.nist_800_53_rev_5_cp_1_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_1_a" {
  title       = "CP-1(a)"
  description = "a. Develop, document, and disseminate to [Assignment: organization-defined personnel or roles]: 1. [Selection (one or more): Organization-level; Mission/business process-level; System-level] contingency planning policy that: a). Addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and b). Is consistent with applicable laws, executive orders, directives, regulations, policies, standards, and guidelines; and 2. Procedures to facilitate the implementation of the contingency planning policy and the associated contingency planning controls."
  children = [
    benchmark.nist_800_53_rev_5_cp_1_a_2,
    benchmark.nist_800_53_rev_5_cp_1_a_1_b
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_1_a_1_b" {
  title       = "CP-1(a)(1)(b)"
  description = "a. Develop, document, and disseminate to [Assignment: organization-defined personnel or roles]: 1. [Selection (one or more): Organization-level; Mission/business process-level; System-level] contingency planning policy that: (b) Is consistent with applicable laws, executive orders, directives, regulations, policies, standards, and guidelines."
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

benchmark "nist_800_53_rev_5_cp_1_a_2" {
  title       = "CP-1(a)(2)"
  description = "a. Develop, document, and disseminate to [Assignment: organization-defined personnel or roles]: 2. Procedures to facilitate the implementation of the contingency planning policy and the associated contingency planning controls."
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

benchmark "nist_800_53_rev_5_cp_1_2" {
  title       = "CP-1(2)"
  description = "Implement transaction recovery for systems that are transaction-based."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.rds_db_instance_backup_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_2" {
  title       = "Contingency Plan (CP-2)"
  description = "a. Develop a contingency plan for the system that: 1. Identifies essential mission and business functions and associated contingency requirements; 2. Provides recovery objectives, restoration priorities, and metrics; b. Distribute copies of the contingency plan to [Assignment: organization-defined key contingency personnel (identified by name and/or by role) and organizational elements]; c. Coordinate contingency planning activities with incident handling activities; d. Review the contingency plan for the system [Assignment: organization-defined frequency]; e. Update the contingency plan to address changes to the organization, system, or environment of operation and problems encountered during contingency plan implementation, execution, or testing; f. Communicate contingency plan changes to [Assignment: organization-defined key contingency personnel (identified by name and/or by role) and organizational elements]; g. Incorporate lessons learned from contingency plan testing, training, or actual contingency activities into contingency testing and training; and h. Protect the contingency plan from unauthorized disclosure and modification."
  children = [
    benchmark.nist_800_53_rev_5_cp_2_a,
    benchmark.nist_800_53_rev_5_cp_2_d,
    benchmark.nist_800_53_rev_5_cp_2_e,
    benchmark.nist_800_53_rev_5_cp_2_5,
    benchmark.nist_800_53_rev_5_cp_2_6
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_2_a" {
  title       = "CP-2(a)"
  description = "a. Develop a contingency plan for the system that: 1. Identifies essential mission and business functions and associated contingency requirements; 2. Provides recovery objectives, restoration priorities, and metrics; 3. Addresses contingency roles, responsibilities, assigned individuals with contact information; 4. Addresses maintaining essential mission and business functions despite a system disruption, compromise, or failure; 5. Addresses eventual, full system restoration without deterioration of the controls originally planned and implemented; 6. Addresses the sharing of contingency information; and 7. Is reviewed and approved by [Assignment: organization-defined personnel or roles]."
  children = [
    benchmark.nist_800_53_rev_5_cp_2_a_6,
    benchmark.nist_800_53_rev_5_cp_2_a_7,
    control.dynamodb_table_auto_scaling_enabled,
    control.elb_application_lb_deletion_protection_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_deletion_protection_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_2_a_6" {
  title       = "CP-2(a)(6)"
  description = "Develop a contingency plan for the system that: 6. Addresses the sharing of contingency information."
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

benchmark "nist_800_53_rev_5_cp_2_a_7" {
  title       = "CP-2(a)(7)"
  description = "Develop a contingency plan for the system that: 7. Is reviewed and approved by [Assignment: organization-defined personnel or roles]."
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

benchmark "nist_800_53_rev_5_cp_2_d" {
  title       = "CP-2(d)"
  description = "Review the contingency plan for the system [Assignment: organization-defined frequency]"
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

benchmark "nist_800_53_rev_5_cp_2_e" {
  title       = "CP-2(e)"
  description = "Update the contingency plan to address changes to the organization, system, or environment of operation and problems encountered during contingency plan implementation, execution, or testing."
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

benchmark "nist_800_53_rev_5_cp_2_5" {
  title       = "CP-2(5) Continue Mission And Business Functions"
  description = "Plan for the continuance of [Selection: all; essential] mission and business functions with minimal or no loss of operational continuity and sustains that continuity until full system restoration at primary processing and/or storage sites."
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
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_multiple_az_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_2_6" {
  title       = "CP-2(6) Alternate Processing And Storage Sites"
  description = "Plan for the transfer of [Selection: all; essential] mission and business functions to alternate processing and/or storage sites with minimal or no loss of operational continuity and sustain that continuity through system restoration to primary processing and/or storage sites."
  children = [
    control.dynamodb_table_auto_scaling_enabled,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_6" {
  title       = "Alternate Storage Sites (CP-6)"
  description = "a. Establish an alternate storage site, including necessary agreements to permit the storage and retrieval of system backup information; and b. Ensure that the alternate storage site provides controls equivalent to that of the primary site."
  children = [
    benchmark.nist_800_53_rev_5_cp_6_1,
    benchmark.nist_800_53_rev_5_cp_6_2,
    benchmark.nist_800_53_rev_5_cp_6_a
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_6_a" {
  title       = "CP-6(a)"
  description = "Establish an alternate storage site, including necessary agreements to permit the storage and retrieval of system backup information."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_6_1" {
  title       = "CP-6(1) Separation From Primary Site"
  description = "Identify an alternate storage site that is sufficiently separated from the primary storage site to reduce susceptibility to the same threats."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_6_2" {
  title       = "CP-6(2) Recovery Time And Recovery Point Objectives"
  description = "Configure the alternate storage site to facilitate recovery operations in accordance with recovery time and recovery point objectives."
  children = [
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_multiple_az_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_9" {
  title       = "System Backup (CP-9)"
  description = "a. Conduct backups of user-level information contained in [Assignment: organization-defined system components] [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]; b. Conduct backups of system-level information contained in the system [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]; c. Conduct backups of system documentation, including security- and privacy-related documentation [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]; and d. Protect the confidentiality, integrity, and availability of backup information."
  children = [
    benchmark.nist_800_53_rev_5_cp_9_8,
    benchmark.nist_800_53_rev_5_cp_9_a,
    benchmark.nist_800_53_rev_5_cp_9_b,
    benchmark.nist_800_53_rev_5_cp_9_c,
    benchmark.nist_800_53_rev_5_cp_9_d
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_9_a" {
  title       = "CP-9(a)"
  description = "Conduct backups of user-level information contained in [Assignment: organization-defined system components] [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_maintenance_settings_check,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_9_b" {
  title       = "CP-9(b)"
  description = "Conduct backups of system-level information contained in the system [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.redshift_cluster_maintenance_settings_check,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_9_c" {
  title       = "CP-9(c)"
  description = "Conduct backups of system documentation, including security- and privacy-related documentation [Assignment: organization-defined frequency consistent with recovery time and recovery point objectives]."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.rds_db_instance_backup_enabled,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ec2_instance_ebs_optimized,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.redshift_cluster_maintenance_settings_check,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_9_d" {
  title       = "CP-9(d)"
  description = "Protect the confidentiality, integrity, and availability of backup information."
  children = [
    control.apigateway_stage_cache_encryption_at_rest_enabled,
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.dynamodb_table_in_backup_plan,
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

benchmark "nist_800_53_rev_5_cp_9_8" {
  title       = "CP-9(8) Cryptographic Protection"
  description = "Implement cryptographic mechanisms to prevent unauthorized disclosure and modification of [Assignment: organization-defined backup information]."
  children = [
    control.rds_db_snapshot_encrypted_at_rest,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_10" {
  title       = "System Recovery And Reconstitution (CP-10)"
  description = "Provide for the recovery and reconstitution of the system to a known state within [Assignment: organization-defined time period consistent with recovery time and recovery point objectives] after a disruption, compromise, or failure."
  children = [
    benchmark.nist_800_53_rev_5_cp_10_2,
    control.dynamodb_table_auto_scaling_enabled,
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.ec2_instance_ebs_optimized,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_classic_lb_cross_zone_load_balancing_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.rds_db_instance_multiple_az_enabled,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = local.nist_800_53_rev_5_common_tags
}

benchmark "nist_800_53_rev_5_cp_10_2" {
  title       = "CP-10(2) Transaction Recovery"
  description = "Implement transaction recovery for systems that are transaction-based."
  children = [
    control.dynamodb_table_in_backup_plan,
    control.dynamodb_table_point_in_time_recovery_enabled,
    control.ebs_volume_in_backup_plan,
    control.efs_file_system_in_backup_plan,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_in_backup_plan,
    control.redshift_cluster_automatic_snapshots_min_7_days,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled
  ]

  tags = local.nist_800_53_rev_5_common_tags
}