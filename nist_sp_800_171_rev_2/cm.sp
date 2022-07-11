benchmark "nist_sp_800_171_rev_2_3_4" {
  title       = "3.4 Configuration Management"
  description = "CM controls are specific to an organization’s configuration management policies. This includes a baseline configuration to operate as the basis for future builds or changes to information systems. Additionally, this includes information system component inventories and a security impact analysis control."
  children = [
    benchmark.nist_sp_800_171_rev_2_3_4_1,
    benchmark.nist_sp_800_171_rev_2_3_4_2,
    benchmark.nist_sp_800_171_rev_2_3_4_6,
    benchmark.nist_sp_800_171_rev_2_3_4_7,
    benchmark.nist_sp_800_171_rev_2_3_4_9
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_4_1" {
  title       = "3.4.1"
  description = "Establish and maintain baseline configurations and inventories of organizational systems (including hardware, software, firmware, and documentation) throughout the respective system development life cycles."
  children = [
    control.cloudtrail_security_trail_enabled,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_eip_associated,
    control.vpc_security_group_associated_to_eni,
    control.vpc_security_group_restricted_common_ports
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_4_2" {
  title       = "3.4.2"
  description = "Establish and enforce security configuration settings for information technology products employed in organizational systems."
  children = [
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_associated_to_eni
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_4_6" {
  title       = "3.4.6"
  description = "Employ the principle of least functionality by configuring organizational systems to provide only essential capabilities."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.lambda_function_restrict_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_default_security_group_restricts_all_traffic
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_4_7" {
  title       = "3.4.7"
  description = "Restrict, disable, or prevent the use of nonessential programs, functions, ports, protocols, and services."
  children = [
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}

benchmark "nist_sp_800_171_rev_2_3_4_9" {
  title       = "3.4.9"
  description = "Control and monitor user-installed software."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
  ]

  tags = local.nist_sp_800_171_rev_2_common_tags
}
