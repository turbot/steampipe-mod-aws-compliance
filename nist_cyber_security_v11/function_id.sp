benchmark "nist_cyber_security_v11_id" {
  title       = "ID Identify"
  description = "Develop the organizational understanding to manage cybersecurity risk to systems, assets, data, and capabilities."
  children = [
    benchmark.nist_cyber_security_v11_id_am,
    benchmark.nist_cyber_security_v11_id_be,
    benchmark.nist_cyber_security_v11_id_ra,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_am" {
  title       = "ID.AM Asset Management"
  description = "The data, personnel, devices, systems, and facilities that enable the organization to achieve business purposes are identified and managed consistent with their relative importance to organizational objectives and the organization’s risk strategy."
  children = [
    benchmark.nist_cyber_security_v11_id_am_2,
    benchmark.nist_cyber_security_v11_id_am_3,
    benchmark.nist_cyber_security_v11_id_am_6
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_am_2" {
  title       = "ID.AM-2"
  description = "Software platforms and applications within the organization are inventoried."

  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_am_3" {
  title       = "ID.AM-3"
  description = "Organizational communication and data flows are mapped."

  children = [
    control.apigateway_stage_logging_enabled,
    control.cloudtrail_multi_region_trail_enabled,
    control.cloudtrail_trail_enabled,
    control.elb_application_classic_lb_logging_enabled,
    control.redshift_cluster_encryption_logging_enabled,
    control.s3_bucket_logging_enabled,
    control.vpc_flow_logs_enabled,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_am_6" {
  title       = "ID.AM-6"
  description = "Cybersecurity roles and responsibilities for the entire workforce and third-party stakeholders (e.g., suppliers, customers, partners) are established."

  children = [
    control.iam_user_in_group,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_be" {
  title       = "ID.BE Business Environment"
  description = "The organization’s mission, objectives, stakeholders, and activities are understood and prioritized; this information is used to inform cybersecurity roles, responsibilities, and risk management decisions."
  children = [
    benchmark.nist_cyber_security_v11_id_be_5,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_be_5" {
  title       = "ID.BE-5"
  description = "Resilience requirements to support delivery of critical services are established for all operating states (e.g. under duress/attack, during recovery, normal operations)"

  children = [
    control.autoscaling_group_with_lb_use_health_check,
    control.dynamodb_table_auto_scaling_enabled,
    control.elasticache_redis_cluster_automatic_backup_retention_15_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.rds_db_instance_backup_enabled,
    control.rds_db_instance_multiple_az_enabled,
    control.s3_bucket_cross_region_replication_enabled,
    control.s3_bucket_versioning_enabled,
    control.vpc_vpn_tunnel_up,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_ra" {
  title       = "ID.RA Business Environment"
  description = "The organization understands the cybersecurity risk to organizational operations (including mission, functions, image, or reputation), organizational assets, and individuals."
  
  children = [
    benchmark.nist_cyber_security_v11_id_ra_1,
    benchmark.nist_cyber_security_v11_id_ra_2,
    benchmark.nist_cyber_security_v11_id_ra_3,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_ra_1" {
  title       = "ID.RA-1"
  description = "Asset vulnerabilities are identified and documented."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant,
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_ra_2" {
  title       = "ID.RA-2"
  description = "Asset vulnerabilities are identified and documented."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_cyber_security_v11_common_tags
}

benchmark "nist_cyber_security_v11_id_ra_3" {
  title       = "ID.RA-3"
  description = "Asset vulnerabilities are identified and documented."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = local.nist_cyber_security_v11_common_tags
}
