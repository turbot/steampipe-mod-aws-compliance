benchmark "fedramp_low_rev_4_cm" {
  title       = benchmark.nist_800_53_rev_4_cm.title
  description = benchmark.nist_800_53_rev_4_cm.description
  children = [
    benchmark.fedramp_low_rev_4_cm_2,
    benchmark.fedramp_low_rev_4_cm_8
  ]

  tags = local.fedramp_low_rev_4_common_tags
}

benchmark "fedramp_low_rev_4_cm_2" {
  title       = benchmark.nist_800_53_rev_4_cm_2.title
  description = benchmark.nist_800_53_rev_4_cm_2.description
  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ebs_volume_unused,
    control.ec2_instance_in_vpc,
    control.ec2_instance_not_publicly_accessible,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.elb_application_lb_deletion_protection_enabled,
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
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_subnet_auto_assign_public_ip_disabled,
  ]

  tags = local.fedramp_low_rev_4_common_tags

}

benchmark "fedramp_low_rev_4_cm_8" {
  title       = benchmark.nist_800_53_rev_4_cm_8.title
  description = benchmark.nist_800_53_rev_4_cm_8.description
  children = [
    control.ec2_instance_ssm_managed,
    control.guardduty_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
  ]

  tags = local.fedramp_low_rev_4_common_tags
}