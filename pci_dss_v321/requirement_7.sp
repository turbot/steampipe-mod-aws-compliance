locals {
  pci_dss_v321_requirement_7_common_tags = merge(local.pci_dss_v321_common_tags, {
    control_set = "7"
  })
}

benchmark "pci_dss_v321_requirement_7" {
  title       = "Requirement 7: Restrict access to cardholder data by business need to know"
  description = "To ensure critical data can only be accessed by authorized personnel, systems and processes must be in place to limit access based on need to know and according to job responsibilities."

  children = [
    benchmark.pci_dss_v321_requirement_7_1,
    benchmark.pci_dss_v321_requirement_7_2
  ]

  tags = local.pci_dss_v321_requirement_7_common_tags
}

benchmark "pci_dss_v321_requirement_7_1" {
  title       = "7.1 Limit access to system components and cardholder data to only those individuals whose job requires such access"
  description = "The more people who have access to cardholder data, the more risk there is that a user's account will be used maliciously. Limiting access to those with a legitimate business reason for the access helps an organization prevent mishandling of cardholder data through inexperience or malice."

  children = [
    benchmark.pci_dss_v321_requirement_7_1_2
  ]

  tags = merge(local.pci_dss_v321_requirement_7_common_tags, {
    pci_dss_v321_item_id = "7.1"
  })
}

benchmark "pci_dss_v321_requirement_7_1_2" {
  title       = "7.1.2 Restrict access to privileged user IDs to least privileges necessary to perform job responsibilities"
  description = "When assigning privileged IDs, it is important to assign individuals only the privileges they need to perform their job (the “least privileges”). For example, the database administrator or backup administrator should not be assigned the same privileges as the overall systems administrator."

  children = [
    benchmark.pci_dss_v321_requirement_7_1_2_a
  ]

  tags = merge(local.pci_dss_v321_requirement_7_common_tags, {
    pci_dss_v321_item_id = "7.1.2"
  })
}

benchmark "pci_dss_v321_requirement_7_1_2_a" {
  title       = "7.1.2.a Interview personnel responsible for assigning access to verify that access to privileged user IDs is assigned only to roles that specifically require such privileged access and restricted to least privileges necessary to perform job responsibilities"
  description = "When assigning privileged IDs, it is important to assign individuals only the privileges they need to perform their job (the “least privileges”). For example, the database administrator or backup administrator should not be assigned the same privileges as the overall systems administrator."

  children = [
    control.efs_access_point_enforce_user_identity,
    control.iam_all_policy_no_service_wild_card,
    control.opensearch_domain_fine_grained_access_enabled
  ]

  tags = merge(local.pci_dss_v321_requirement_7_common_tags, {
    pci_dss_v321_item_id = "7.1.2.a"
  })
}

benchmark "pci_dss_v321_requirement_7_2" {
  title       = "7.2 Examine system settings and vendor documentation to verify that an access control system(s)"
  description = "Without a mechanism to restrict access based on user's need to know, a user may unknowingly be granted access to cardholder data. Access control systems automate the process of restricting access and assigning privileges. Additionally, a default “deny-all” setting ensures no one is granted access until and unless a rule is established specifically granting such access. Entities may have one or more access controls systems to manage user access. Note: Some access control systems are set by default to “allow-all,” thereby permitting access unless/until a rule is written to specifically deny it."

  children = [
    benchmark.pci_dss_v321_requirement_7_2_1
  ]

  tags = merge(local.pci_dss_v321_requirement_7_common_tags, {
    pci_dss_v321_item_id = "7.2"
  })
}

benchmark "pci_dss_v321_requirement_7_2_1" {
  title       = "7.2.1 Confirm that access control systems are in place on all system components"
  description = "Without a mechanism to restrict access based on user's need to know, a user may unknowingly be granted access to cardholder data. Access control systems automate the process of restricting access and assigning privileges. Additionally, a default “deny-all” setting ensures no one is granted access until and unless a rule is established specifically granting such access. Entities may have one or more access controls systems to manage user access. Note: Some access control systems are set by default to “allow-all,” thereby permitting access unless/until a rule is written to specifically deny it."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ec2_instance_not_publicly_accessible,
    control.eks_cluster_endpoint_restrict_public_access,
    control.emr_cluster_master_nodes_no_public_ip,
    control.es_domain_in_vpc,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.lambda_function_restrict_public_access,
    control.log_metric_filter_root_login,
    control.rds_db_instance_prohibit_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_notebook_instance_direct_internet_access_disabled,
    control.vpc_igw_attached_to_authorized_vpc
  ]

  tags = merge(local.pci_dss_v321_requirement_7_common_tags, {
    pci_dss_v321_item_id = "7.2.1"
  })
}
