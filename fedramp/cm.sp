benchmark "fedramp_cm" {
  title       = benchmark.nist_800_53_rev_4_cm.title
  description = benchmark.nist_800_53_rev_4_cm.description
  children = [
    benchmark.fedramp_cm_2,
    benchmark.fedramp_cm_7,
    benchmark.fedramp_cm_8
  ]

  tags = local.fedramp_common_tags
}

benchmark "fedramp_cm_2" {
  title       = benchmark.nist_800_53_rev_4_cm_2.title
  description = benchmark.nist_800_53_rev_4_cm_2.description
  children = [
    control.elb_application_lb_waf_enabled,
    control.apigateway_stage_use_waf_web_acl,
    control.autoscaling_launch_config_public_ip_disabled,
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.es_domain_in_vpc,
    control.emr_cluster_master_nodes_no_public_ip,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.ec2_instance_in_vpc,
    control.lambda_function_restrict_public_access,
    control.lambda_function_in_vpc,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_public_access_block_account,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ec2_stopped_instance_30_days,
    control.ebs_attached_volume_delete_on_termination_enabled,
    control.s3_public_access_block_bucket_account,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.ebs_volume_unsued,
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_cm_7" {
  title       = benchmark.nist_800_53_rev_4_cm_7.title
  description = benchmark.nist_800_53_rev_4_cm_7.description
  children = [
    benchmark.fedramp_cm_7_a

  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_cm_7_a" {
  title       = "CM-7(a)"
  description = "The organization: a. Configures the information system to provide only essential capabilities."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_cm_8" {
  title       = benchmark.nist_800_53_rev_4_cm_8.title
  description = benchmark.nist_800_53_rev_4_cm_8.description
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.guardduty_enabled,
    benchmark.fedramp_cm_8_1,
    benchmark.fedramp_cm_8_3

  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "low"
  })
}

benchmark "fedramp_cm_8_1" {
  title       = "CM-8(1)"
  description = "The organization updates the inventory of information system components as an integral part of component installations, removals, and information system updates."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,

  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_cm_8_3" {
  title       = benchmark.nist_800_53_rev_4_cm_8_3.title
  description = benchmark.nist_800_53_rev_4_cm_8_3.description
  children = [
    benchmark.fedramp_cm_8_3_a,

  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}

benchmark "fedramp_cm_8_3_a" {
  title       = "CM-8(3)(a)"
  description = "The organization: a. Employs automated mechanisms continuously, using automated mechanisms with a maximum five-minute delay in detection, to detect the presence of unauthorized hardware, software, and firmware components within the information system"
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.guardduty_enabled

  ]

  tags = merge(local.fedramp_common_tags, {
    severity = "medium"
  })
}