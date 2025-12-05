locals {
  conformance_pack_ec2_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EC2"
  })
}

control "ec2_instance_termination_protection_enabled" {
  title       = "AWS EC2 instances should have termination protection enabled"
  description = "This control checks whether termination protection is enabled for EC2 instances. The control fails if termination protection is not enabled for an EC2 instance."
  query       = query.ec2_instance_termination_protection_enabled

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_launch_template_not_publicly_accessible" {
  title       = "AWS EC2 launch templates should not assign public IPs to network interfaces"
  description = "This control checks if AWS EC2 launch templates are configured to assign public IP addresses to network interfaces upon launch. The control fails if an EC2 launch template is configured to assign a public IP address to network interfaces or if there is at least one network interface that has a public IP address."
  query       = query.ec2_launch_template_not_publicly_accessible

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_ebs_default_encryption_enabled" {
  title       = "EBS default encryption should be enabled"
  description = "[DEPRECATED] This control has been deprecated and will be removed in a future release, use the ebs_encryption_by_default_enabled control instead. To help protect data at rest, ensure that encryption is enabled for your AWS Elastic Block Store (AWS EBS) volumes."
  query       = query.ec2_ebs_default_encryption_enabled
  tags = merge(local.conformance_pack_ec2_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_detailed_monitoring_enabled" {
  title       = "EC2 instance detailed monitoring should be enabled"
  description = "Enable this rule to help improve AWS Elastic Compute Cloud (AWS EC2) instance monitoring on the AWS EC2 console, which displays monitoring graphs with a 1-minute period for the instance."
  query       = query.ec2_instance_detailed_monitoring_enabled

  tags = merge(local.conformance_pack_ec2_common_tags, {
    acsc_essential_eight                   = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_not_use_multiple_enis" {
  title       = "EC2 instances should not use multiple ENIs"
  description = "This control checks whether an EC2 instance uses multiple Elastic Network Interfaces (ENIs) or Elastic Fabric Adapters (EFAs). This control passes if a single network adapter is used. The control includes an optional parameter list to identify the allowed ENIs."
  query       = query.ec2_instance_not_use_multiple_enis

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf = "true"
  })
}

control "ec2_instance_no_amazon_key_pair" {
  title       = "EC2 instances should not use key pairs in running state"
  description = "This control checks whether running EC2 instances are using key pairs. The control fails if a running EC2 instance uses a key pair."
  query       = query.ec2_instance_no_amazon_key_pair

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf    = "true"
    pci_dss_v40 = "true"
  })
}

control "ec2_instance_in_vpc" {
  title       = "EC2 instances should be in a VPC"
  description = "Deploy AWS Elastic Compute Cloud (AWS EC2) instances within an AWS Virtual Private Cloud (AWS VPC) to enable secure communication between an instance and other services within the amazon VPC, without requiring an internet gateway, NAT device, or VPN connection."
  query       = query.ec2_instance_in_vpc

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_not_publicly_accessible" {
  title       = "EC2 instances should not have a public IP address"
  description = "Manage access to the AWS Cloud by ensuring AWS Elastic Compute Cloud (AWS EC2) instances cannot be publicly accessed."
  query       = query.ec2_instance_not_publicly_accessible

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_no_high_level_finding_in_inspector_scan" {
  title       = "EC2 instances high level findings should not be there in inspector scans"
  description = "AWS Inspector scans operating system packages installed on your AWS EC2 instances for vulnerabilities and network reachability issues. Each finding has the name of the detected vulnerability and provides a severity rating, information about the affected resource, and details such as how to remediate the reported vulnerability."
  query       = query.ec2_instance_no_high_level_finding_in_inspector_scan

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "ec2_stopped_instance_30_days" {
  title       = "EC2 stopped instances should be removed in 30 days"
  description = "Enable this rule to help with the baseline configuration of AWS Elastic Compute Cloud (AWS EC2) instances by checking whether AWS EC2 instances have been stopped for more than the allowed number of days, according to your organization's standards."
  query       = query.ec2_stopped_instance_30_days

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    rbi_itf_nbfc                           = "true"
  })
}

control "ec2_instance_ebs_optimized" {
  title       = "EC2 instance should have EBS optimization enabled"
  description = "An optimized instance in AWS Elastic Block Store (AWS EBS) provides additional, dedicated capacity for AWS EBS I/O operations."
  query       = query.ec2_instance_ebs_optimized

  tags = merge(local.conformance_pack_ec2_common_tags, {
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_uses_imdsv2" {
  title       = "EC2 instances should use IMDSv2"
  description = "Ensure the Instance Metadata Service Version 2 (IMDSv2) method is enabled to help protect access and control of AWS Elastic Compute Cloud (AWS EC2) instance metadata."
  query       = query.ec2_instance_uses_imdsv2

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cis_controls_v8_ig1                    = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
  })
}

control "ec2_instance_protected_by_backup_plan" {
  title       = "EC2 instances should be protected by backup plan"
  description = "Ensure that AWS Elastic Compute Cloud (AWS EC2) instances are protected by a backup plan. The rule is non-compliant if the AWS EC2 instance is not covered by a backup plan."
  query       = query.ec2_instance_protected_by_backup_plan

  tags = merge(local.conformance_pack_ec2_common_tags, {
    acsc_essential_eight                   = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_iam_profile_attached" {
  title       = "EC2 instances should have IAM profile attached"
  description = "Ensure that an AWS Elastic Compute Cloud (AWS EC2) instance has an Identity and Access Management (IAM) profile attached to it. This rule is non-compliant if no IAM profile is attached to the AWS EC2 instance."
  query       = query.ec2_instance_iam_profile_attached

  tags = merge(local.conformance_pack_ec2_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
  })
}

control "ec2_instance_publicly_accessible_iam_profile_attached" {
  title       = "Public EC2 instances should have IAM profile attached"
  description = "Ensure AWS Elastic Compute Cloud (AWS EC2) public instances have an Identity and Access Management (IAM) profile attached to them. This rule is non-compliant if no IAM profile is attached to a public AWS EC2 instance."
  query       = query.ec2_instance_publicly_accessible_iam_profile_attached

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_user_data_no_secrets" {
  title       = "EC2 instances user data should not have secrets"
  description = "User data is a metadata field of an EC2 instance that allows custom code to run after the instance is launched. It contains code which is exposed to any entity which has the most basic access to EC2, even read-only configurations. It is recommended to not use secrets in user data."
  query       = query.ec2_instance_user_data_no_secrets

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_transit_gateway_auto_cross_account_attachment_disabled" {
  title       = "EC2 transit gateways should have auto accept shared attachments disabled"
  description = "Ensure transit gateways have auto accept shared attachments feature disabled. If this setting is disabled, then any VPC that attempts to attach to a transit gateway will need to request authorization, and the account that owns the transit gateway will need to accept the authorization."
  query       = query.ec2_transit_gateway_auto_cross_account_attachment_disabled

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf    = "true"
    nist_csf_v2 = "true"
    pci_dss_v40 = "true"
  })
}

control "ec2_instance_no_launch_wizard_security_group" {
  title       = "EC2 instances should not be attached to 'launch wizard' security groups"
  description = "Ensure EC2 instances provisioned in your AWS account are not associated with security groups that have their name prefixed with 'launch-wizard', in order to enforce using secure and custom security groups that exercise the principle of least privilege."
  query       = query.ec2_instance_no_launch_wizard_security_group

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_virtualization_type_no_paravirtual" {
  title       = "Paravirtual EC2 instance types should not be used"
  description = "This control checks whether the virtualization type of an EC2 instance is paravirtual. The control fails if the virtualizationType of the EC2 instance is set to paravirtual."
  query       = query.ec2_instance_virtualization_type_no_paravirtual

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf = "true"
  })
}

control "ec2_ami_restrict_public_access" {
  title       = "EC2 AMIs should restrict public access"
  description = "This control checks whether EC2 AMIs are set as private or not. The control fails if the EC2 AMIs are set as public."
  query       = query.ec2_ami_restrict_public_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_management_level_access" {
  title       = "EC2 instance IAM role should not allow management level access"
  description = "This control ensures that EC2 instance IAM role does not allow management level access."
  query       = query.ec2_instance_no_iam_role_with_management_level_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_data_destruction_access" {
  title       = "EC2 instance IAM role should not allow data destruction access"
  description = "This control ensures that EC2 instance IAM role does not allow data destruction access."
  query       = query.ec2_instance_no_iam_role_with_data_destruction_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_with_write_level_access" {
  title       = "EC2 instance IAM role should not allow write level access"
  description = "This control ensures that EC2 instance IAM role does not allow write level access."
  query       = query.ec2_instance_no_iam_with_write_level_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_database_management_write_access" {
  title       = "EC2 instance IAM role should not allow database management write access"
  description = "This control ensures that EC2 instance IAM role does not allow database management write access."
  query       = query.ec2_instance_no_iam_role_with_database_management_write_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_org_write_access" {
  title       = "EC2 instance IAM role should not allow oraganization write access"
  description = "This control ensures that EC2 instance IAM role does not allow oraganization write access."
  query       = query.ec2_instance_no_iam_role_with_org_write_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_privilege_escalation_risk_access" {
  title       = "EC2 instance IAM role should not allow privilege escalation risk access"
  description = "This control ensures that EC2 instance IAM role does not allow privilege escalation risk access."
  query       = query.ec2_instance_no_iam_role_with_privilege_escalation_risk_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_new_group_creation_with_attached_policy_access" {
  title       = "EC2 instance IAM role should not allow new group creation with attached policy access"
  description = "This control ensures that EC2 instance IAM role does not allow new group creation with attached policy access."
  query       = query.ec2_instance_no_iam_role_with_new_group_creation_with_attached_policy_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_new_role_creation_with_attached_policy_access" {
  title       = "EC2 instance IAM role should not allow new role creation with attached policy access"
  description = "This control ensures that EC2 instance IAM role does not allow new role creation with attached policy access."
  query       = query.ec2_instance_no_iam_role_with_new_role_creation_with_attached_policy_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_new_user_creation_with_attached_policy_access" {
  title       = "EC2 instance IAM role should not allow new user creation with attached policy access"
  description = "This control ensures that EC2 instance IAM role does not allow new user creation with attached policy access."
  query       = query.ec2_instance_no_iam_role_with_new_user_creation_with_attached_policy_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_write_access_to_resource_based_policies" {
  title       = "EC2 instance IAM role should not allow write access to resource based policies"
  description = "This control ensures that EC2 instance IAM role does not allow write access to resource based policies."
  query       = query.ec2_instance_no_iam_role_with_write_access_to_resource_based_policies

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_attached_with_credentials_exposure_access" {
  title       = "EC2 instance IAM role should not be attached with credentials exposure access"
  description = "This control ensures that EC2 instance IAM role should not be attached with credentials exposure access."
  query       = query.ec2_instance_no_iam_role_attached_with_credentials_exposure_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_alter_critical_s3_permissions_configuration" {
  title       = "EC2 instance IAM role should not allow to alter critical s3 permissions configuration"
  description = "This control ensures that EC2 instance IAM role does not allow to alter critical s3 permissions configuration."
  query       = query.ec2_instance_no_iam_role_with_alter_critical_s3_permissions_configuration

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_destruction_kms_access" {
  title       = "EC2 instance IAM role should not allow destruction KMS access"
  description = "This control ensures that EC2 instance IAM roles do not allow destruction KMS access."
  query       = query.ec2_instance_no_iam_role_with_destruction_kms_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_destruction_rds_access" {
  title       = "EC2 instance IAM role should not allow destruction RDS access"
  description = "This control ensures that EC2 instance IAM roles do not allow destruction RDS access."
  query       = query.ec2_instance_no_iam_role_with_destruction_rds_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_cloud_log_tampering_access" {
  title       = "EC2 instance IAM role should not allow cloud log tampering access"
  description = "This control ensures that EC2 instance IAM roles do not allow cloud log tampering access."
  query       = query.ec2_instance_no_iam_role_with_cloud_log_tampering_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_write_permission_on_critical_s3_configuration" {
  title       = "EC2 instance IAM role should not allow write permission on critical s3 configuration"
  description = "This control ensures that EC2 instance IAM roles do not allow write permission on critical s3 configuration."
  query       = query.ec2_instance_no_iam_role_with_write_permission_on_critical_s3_configuration

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_security_group_write_access" {
  title       = "EC2 instance IAM role should not allow security group write access"
  description = "This control ensures that EC2 instance IAM roles do not allow security group write access."
  query       = query.ec2_instance_no_iam_role_with_security_group_write_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_defense_evasion_impact_of_aws_security_services_access" {
  title       = "EC2 instance IAM role should not allow defense evasion impact of AWS security services access"
  description = "This control ensures that EC2 instance IAM role does not allow defense evasion impact of AWS security services access."
  query       = query.ec2_instance_no_iam_role_with_defense_evasion_impact_of_aws_security_services_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_role_with_elastic_ip_hijacking_access" {
  title       = "EC2 instance IAM role should not allow elastic IP hijacking access."
  description = "This control ensures that EC2 instance IAM role does not allow elastic IP hijacking access."
  query       = query.ec2_instance_no_iam_role_with_elastic_ip_hijacking_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_no_iam_passrole_and_lambda_invoke_function_access" {
  title       = "EC2 instance IAM should not allow pass role and lambda invoke function access."
  description = "This control ensures that EC2 instance IAM role does not allow pass role and lambda invoke function access."
  query       = query.ec2_instance_no_iam_passrole_and_lambda_invoke_function_access

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_client_vpn_endpoint_client_connection_logging_enabled" {
  title       = "EC2 Client VPN endpoints should have client connection logging enabled"
  description = "This rule ensures that EC2 client VPN endpoints have client connection logging enabled. The rule is non-compliant if client connection logging is not enabled."
  query       = query.ec2_client_vpn_endpoint_client_connection_logging_enabled

  tags = merge(local.conformance_pack_ec2_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "ec2_ami_ebs_encryption_enabled" {
  title       = "Ensure Images (AMI's) are encrypted"
  description = "Amazon Machine Images should utilize EBS Encrypted snapshots."
  query       = query.ec2_ami_ebs_encryption_enabled

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "ec2_ami_not_older_than_90_days" {
  title       = "Ensure Images (AMI) are not older than 90 days"
  description = "Ensure that your AMIs are not older than 90 days."
  query       = query.ec2_ami_not_older_than_90_days

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_not_older_than_180_days" {
  title       = "Ensure no AWS EC2 Instances are older than 180 days"
  description = "Identify any running AWS EC2 instances older than 180 days."
  query       = query.ec2_instance_not_older_than_180_days

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_stopped_instance_90_days" {
  title       = "Ensure instances stopped for over 90 days are removed"
  description = "Enable this rule to help with the baseline configuration of Amazon Elastic Compute Cloud (Amazon EC2) instances by checking whether Amazon EC2 instances have been stopped for more than the allowed number of days, according to your organization's standards."
  query       = query.ec2_stopped_instance_90_days

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_attached_ebs_volume_delete_on_termination_enabled" {
  title       = "Ensure EBS volumes attached to an EC2 instance is marked for deletion upon instance termination"
  description = "This rule ensures that Amazon Elastic Block Store volumes that are attached to Amazon Elastic Compute Cloud (Amazon EC2) instances are marked for deletion when an instance is terminated. If an Amazon EBS volume isn't deleted when the instance that it's attached to is terminated, it may violate the concept of least functionality."
  query       = query.ec2_instance_attached_ebs_volume_delete_on_termination_enabled

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_network_interface_unused" {
  title       = "Ensure unused ENIs are removed"
  description = "Identify and delete any unused Amazon AWS Elastic Network Interfaces in order to adhere to best practices and to avoid reaching the service limit. An AWS Elastic Network Interface (ENI) is pronounced unused when is not attached anymore to an EC2 instance."
  query       = query.ec2_network_interface_unused

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_instance_using_iam_instance_role" {
  title         = "Ensure IAM instance roles are used for AWS resource access from instances"
  description   = "AWS access from within AWS instances can be done by either encoding AWS keys into AWS API calls or by assigning the instance to a role which has an appropriate permissions policy for the required access. \"AWS Access\" means accessing the APIs of AWS in order to access AWS resources or manage AWS account resources."
  query         = query.ec2_instance_using_iam_instance_role

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_launch_template_default_version_uses_imdsv2" {
  title         = "EC2 launch templates should use Instance Metadata Service Version 2 (IMDSv2)"
  description   = "This control checks whether an Amazon EC2 launch template is configured with Instance Metadata Service Version 2 (IMDSv2). The control fails if HttpTokens is set to optional."
  query         = query.ec2_launch_template_default_version_uses_imdsv2

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_launch_template_ebs_volume_encrypted" {
  title         = "EC2 launch templates should enable encryption for attached EBS volumes"
  description   = "This control checks whether an Amazon EC2 launch template enables encryption for all attached EBS volumes. The control fails if the encryption parameter is set to False for any EBS volumes specified by the EC2 launch template."
  query         = query.ec2_launch_template_ebs_volume_encrypted

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_network_inteface_source_destination_check_enabled" {
  title         = "EC2 network interfaces should have source/destination checking enabled"
  description   = "This control checks whether source/destination checking is enabled for an Amazon EC2 elastic network interface (ENI) that's managed by users. The control fails if source/destination checking is disabled for the user-managed ENI. This control checks only the following types of ENIs: aws_codestar_connections_managed, branch, efa, interface, lambda, and quicksight."
  query         = query.ec2_network_inteface_source_destination_check_enabled

  tags = local.conformance_pack_ec2_common_tags
}

control "ec2_spot_fleet_request_with_launch_parameter_ebs_encryption_enabled" {
  title         = "EC2 Spot Fleet requests with launch parameters should enable encryption for attached EBS volumes"
  description   = "This control checks whether an Amazon EC2 Spot Fleet request that specifies launch parameters is configured to enable encryption for all Amazon Elastic Block Store (Amazon EBS) volumes attached to EC2 instances. The control fails if the Spot Fleet request specifies launch parameters and doesn't enable encryption for one or more EBS volumes specified in the request."
  query         = query.ec2_spot_fleet_request_with_launch_parameter_ebs_encryption_enabled

  tags = local.conformance_pack_ec2_common_tags
}

query "ec2_ebs_default_encryption_enabled" {
  sql = <<-EOQ
    select
      'arn:' || partition || '::' || region || ':' || account_id as resource,
      case
        when not default_ebs_encryption_enabled then 'alarm'
        else 'ok'
      end as status,
      case
        when not default_ebs_encryption_enabled then region || ' default EBS encryption disabled.'
        else region || ' default EBS encryption enabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_regional_settings;
  EOQ
}

query "ec2_instance_detailed_monitoring_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when monitoring_state = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when monitoring_state = 'enabled' then instance_id || ' detailed monitoring enabled.'
        else instance_id || ' detailed monitoring disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_not_use_multiple_enis" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when jsonb_array_length(network_interfaces) = 1 then 'ok'
        else 'alarm'
      end status,
      title || ' has ' || jsonb_array_length(network_interfaces) || ' ENI(s) attached.'
      as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_no_amazon_key_pair" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when instance_state <> 'running' then 'skip'
        when key_name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when instance_state <> 'running' then title || ' is in ' || instance_state || ' state.'
        when key_name is null then title || ' not launched using amazon key pairs.'
        else title || ' launched using amazon key pairs.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_in_vpc" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when vpc_id is null then title || ' not in VPC.'
        else title || ' in VPC.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_not_publicly_accessible" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when public_ip_address is null then 'ok'
        else 'alarm'
      end as status,
      case
        when public_ip_address is null then instance_id || ' not publicly accessible.'
        else instance_id || ' publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_no_high_level_finding_in_inspector_scan" {
  sql = <<-EOQ
    with severity_list as (
      select
        distinct title,
        a ->> 'Value' as instance_id
      from
        aws_inspector_finding,
        jsonb_array_elements(attributes) as a
      where
        severity = 'High'
        and asset_type = 'ec2-instance'
        and a ->> 'Key' = 'INSTANCE_ID'
      group by
        a ->> 'Value',
        title
    ), ec2_istance_list as (
      select
        distinct instance_id
      from
        severity_list
    )
    select
      arn as resource,
      case
        when l.instance_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when l.instance_id is null then i.title || ' has no high level finding in inspector scans.'
        else i.title || ' has ' || (select count(*) from severity_list where instance_id = i.instance_id) || ' high level findings in inspector scans.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join ec2_istance_list as l on i.instance_id = l.instance_id;
  EOQ
}

query "ec2_stopped_instance_30_days" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when instance_state not in ('stopped', 'stopping') then 'skip'
        when state_transition_time <= (current_date - interval '30' day) then 'alarm'
        else 'ok'
      end as status,
      case
        when instance_state not in ('stopped', 'stopping') then title || ' is in ' || instance_state || ' state.'
        else title || ' stopped since ' || to_char(state_transition_time , 'DD-Mon-YYYY') || ' (' || extract(day from current_timestamp - state_transition_time) || ' days).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_ebs_optimized" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when ebs_optimized then 'ok'
        else 'alarm'
      end as status,
      case
        when ebs_optimized then title || ' EBS optimization enabled.'
        else title || ' EBS optimization disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_uses_imdsv2" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when metadata_options ->> 'HttpTokens' = 'required' and metadata_options ->> 'State' = 'applied' then 'ok'
        else 'alarm'
      end as status,
      case
        when metadata_options ->> 'HttpTokens' = 'required' and metadata_options ->> 'State' = 'applied' then title || ' configured to use Instance Metadata Service Version 2 (IMDSv2).'
        else title || ' not configured to use Instance Metadata Service Version 2 (IMDSv2).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_protected_by_backup_plan" {
  sql = <<-EOQ
    with backup_protected_instance as (
      select
        resource_arn as arn
      from
        aws_backup_protected_resource as b
      where
        resource_type = 'EC2'
    )
    select
      i.arn as resource,
      case
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is not null then i.title || ' is protected by backup plan.'
        else i.title || ' is not protected by backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join backup_protected_instance as b on i.arn = b.arn;
  EOQ
}

query "ec2_instance_iam_profile_attached" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when iam_instance_profile_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when iam_instance_profile_id is not null then title || ' IAM profile attached.'
        else title || ' IAM profile not attached.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_publicly_accessible_iam_profile_attached" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when iam_instance_profile_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when iam_instance_profile_id is not null then title || ' IAM profile attached.'
        else title || ' IAM profile not attached.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance
    where
      public_ip_address is not null;
  EOQ
}

query "ec2_instance_user_data_no_secrets" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when user_data like any (array ['%pass%', '%secret%','%token%','%key%'])
          or user_data ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' then 'alarm'
        else 'ok'
      end as status,
      case
        when user_data like any (array ['%pass%', '%secret%','%token%','%key%'])
          or user_data ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' then instance_id ||' potential secret found in user data.'
        else instance_id ||  ' no secrets found in user data.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_transit_gateway_auto_cross_account_attachment_disabled" {
  sql = <<-EOQ
    select
      transit_gateway_arn as resource,
      case
        when auto_accept_shared_attachments = 'enable' then 'alarm'
        else 'ok'
      end as status,
      case
        when auto_accept_shared_attachments = 'enable' then title || ' automatic shared account attachment enabled.'
        else title || ' automatic shared account attachment disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_transit_gateway;
  EOQ
}

query "ec2_instance_no_launch_wizard_security_group" {
  sql = <<-EOQ
    with launch_wizard_sg_attached_instance as (
      select
        distinct arn as arn
      from
        aws_ec2_instance,
        jsonb_array_elements(security_groups) as sg
      where
        sg ->> 'GroupName' like 'launch-wizard%'
    )
    select
      i.arn as resource,
      case
        when sg.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when sg.arn is null then i.title || ' not associated with launch-wizard security group.'
        else i.title || ' associated with launch-wizard security group.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join launch_wizard_sg_attached_instance as sg on i.arn = sg.arn;
  EOQ
}

query "ec2_instance_virtualization_type_no_paravirtual" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when virtualization_type = 'paravirtual' then 'alarm'
        else 'ok'
      end as status,
      title || ' virtualization type is ' || virtualization_type || '.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_ami_restrict_public_access" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':ec2:' || region || ':' || account_id || ':image/' || image_id as resource,
      case
        when public then 'alarm'
        else 'ok'
      end status,
      case
        when public then title || ' publicly accessible.'
        else title || ' not publicly accessible.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_ami;
  EOQ
}

query "ec2_instance_termination_protection_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when disable_api_termination then 'ok'
        else 'alarm'
      end status,
      case
        when disable_api_termination then instance_id || ' termination protection enabled.'
        else instance_id || ' termination protection disabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_launch_template_not_publicly_accessible" {
  sql = <<-EOQ
    with public_launch_templates as (
      select
        i.tags ->> 'aws:ec2launchtemplate:id' as public_launch_template_id
      from
        aws_ec2_instance as i,
        jsonb_array_elements(launch_template_data -> 'NetworkInterfaces') as nic
      where
        (nic -> 'AssociatePublicIpAddress')::bool
    ),
    launch_templates_associated_instance as (
      select
        distinct tags ->> 'aws:ec2launchtemplate:id' as launch_template_id
      from
        aws_ec2_instance
    )
    select
      t.launch_template_id as resource,
      case
        when i.launch_template_id is null then 'skip'
        when t.launch_template_id in ( select public_launch_template_id from public_launch_templates ) then 'alarm'
        else 'ok'
      end as status,
      case
        when i.launch_template_id is null then t.title || ' does not launch any instance.'
        when t.launch_template_id in ( select public_launch_template_id from public_launch_templates ) then t.title || ' publicly accessible.'
        else t.title || ' not publicly accessible.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      aws_ec2_launch_template as t
      left join launch_templates_associated_instance as i on i.launch_template_id = t.launch_template_id;
  EOQ
}

query "ec2_instance_no_iam_role_with_management_level_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and (
          (action in ('iam:attachgrouppolicy', 'iam:attachrolepolicy', 'iam:attachuserpolicy', 'iam:createpolicy', 'iam:createpolicyversion', 'iam:deleteaccountpasswordpolicy', 'iam:deletegrouppolicy', 'iam:deletepolicy', 'iam:deletepolicyversion', 'iam:deleterolepermissionsboundary', 'iam:deleterolepolicy', 'iam:deleteuserpermissionsboundary', 'iam:deleteuserpolicy', 'iam:detachgrouppolicy', 'iam:detachrolepolicy', 'iam:detachuserpolicy', 'iam:putgrouppolicy', 'iam:putrolepermissionsboundary', 'iam:putrolepolicy', 'iam:putuserpermissionsboundary', 'iam:putuserpolicy','iam:setdefaultpolicyversion','iam:updateassumerolerolicy', '*:*')
          )
        )
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no management level access.'
        else title || ' has management level access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_data_destruction_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and (
          (action in ('s3:deletebucket', 'rds:deletedbcluster', 'rds:deletedbinstance', 'rds:deleteDBSnapshot', 'rds:deletedbclustersnapshot', 'rds:deleteglobalcluster', 'ec2:deletesnapshot', 'ec2:deletevolume', '*:*')
          )
        )
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no data destruction access.'
        else title || ' has data destruction access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_with_write_level_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and (
          (action in ('iam:addclientidtoopenidconnectprovider','iam:addroletoinstanceprofile','iam:addusertogroup','iam:changepassword','iam:createaccesskey','iam:createaccountalias','iam:creategroup','iam:createinstanceprofile','iam:createloginprofile','iam:createopenidconnectprovider','iam:createrole','iam:createsamlprovider','iam:createservicelinkedrole','iam:createservicespecificcredential','iam:createuser','iam:createvirtualmfadevice','iam:deactivatemfadevice','iam:deleteaccesskey','iam:deleteaccountalias','iam:deletegroup','iam:deleteinstanceprofile','iam:deleteloginprofile','iam:deleteopenidconnectprovider','iam:deleterole','iam:deletesamlprovider','iam:deletesshpublickey','iam:deleteservercertificate','iam:deleteservicelinkedrole','iam:deleteservicespecificcredential','iam:deletesigningcertificate','iam:deleteUser','iam:deletevirtualmfadevice','iam:enablemfadevice','iam:passrole','iam:removeclientidfromopenidconnectprovider','iam:removerolefrominstanceprofile','iam:removeuserfromgroup','iam:resetservicespecificcredential','iam:resyncmfadevice','iam:setsecuritytokenservicepreferences','iam:updateaccesskey','iam:updateaccountpasswordpolicy','iam:updategroup','iam:updateloginprofile','iam:updateopenidconnectproviderthumbprint','iam:updaterole','iam:updateroledescription','iam:updatesamlprovider','iam:updatesshpublicKey','iam:updateservercertificate','iam:updateservicespecificcredential','iam:updatesigningcertificate','iam:updateuser','iam:uploadsshpublicKey','iam:uploadservercertificate','iam:uploadsigningcertificate','*:*')
          )
        )
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM rite level access.'
        else title || ' has IAM write level access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_database_management_write_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and (
          (action in ('rds:modifydbcluster','rds:modifydbclusterendpoint','rds:modifydbinstance','rds:modifydbsnapshot','rds:modifyglobalcluster','dynamodb:updateitem','dynamodb:updatetable','memorydb:updatecluster','neptune-db:resetdatabase','neptune-db:writedataviaquery','docdb-elastic:updatecluster','elasticache:modifycachecluster','cassandra:alter','cassandra:modify','qldb:executestatement','qldb:partiqlupdate','qldb:sendcommand','qldb:updateledger','redshift:modifycluster','redshift:modifyclustersnapshot','redshift:modifyendpointaccess','timestream:updatedatabase','timestream:updatetable','timestream:writerecords','*:*')
          )
        )
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no database management write level access.'
        else title || ' has database management write level access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_org_write_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and (
          (action in ('organizations:accepthandshake','organizations:attachpolicy','organizations:cancelhandshake','organizations:createaccount','organizations:creategovcloudaccount','organizations:createorganization','organizations:createorganizationalunit','organizations:createpolicy','organizations:declinehandshake','organizations:deleteorganization','organizations:deleteorganizationalunit','organizations:deletepolicy','organizations:deregisterdelegatedadministrator','organizations:detachpolicy','organizations:disableawsserviceaccess','organizations:disablepolicytype','organizations:enableawsserviceaccess','organizations:enableallfeatures','organizations:enablepolicytype','organizations:inviteaccounttoorganization','organizations:Leaveorganization','organizations:moveaccount','organizations:registerdelegatedadministrator','organizations:removeaccountfromorganization','organizations:updateorganizationalunit','organizations:updatepolicy','*:*')
          )
        )
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no organization write access.'
        else title || ' has organization write access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_privilege_escalation_risk_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and (
          (action in ('iam:createpolicy', 'iam:createpolicyversion', 'iam:SetDefaultpolicyversion', 'iam:passrole', 'iam:createaccessKey', 'iam:createloginprofile', 'iam:updateloginprofile', 'iam:attachuserpolicy', 'iam:attachgrouppolicy', 'iam:attachrolepolicy', 'iam:putuserpolicy', 'iam:putgrouppolicy', 'iam:putrolepolicy', 'iam:addusertogroup', 'iam:updateassumerolepolicy', '*:*')
          )
        )
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no privilege escalation access.'
        else title || ' has privilege escalation access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_new_group_creation_with_attached_policy_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action = 'iam:creategroup'
        and action = 'iam:attachgrouppolicy'
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no new group creation access with attached policy.'
        else title || ' has new group creation access with attached policy.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_new_role_creation_with_attached_policy_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action = 'iam:createrole'
        and action = 'iam:attachrolepolicy'
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no new role creation access with attached policy .'
        else title || ' has new role creation access with attached policy.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_new_user_creation_with_attached_policy_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action = 'iam:createuser'
        and action = 'iam:attachuserpolicy'
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no new user creation access with attached policy.'
        else title || ' has new user creation access with attached policy.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_write_access_to_resource_based_policies" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in (
  'ecr:setrepositorypolicy','serverlessrepo:putapplicationpolicy','backup:putbackupvaultaccesspolicy','efs:putfilesystempolicy','glacier:setvaultaccesspolicy','secretsmanager:putresourcepolicy','events:putpermission','mediastore:putcontainerpolicy','glue:putresourcepolicy','ses:putidentitypolicy','lambda:addpermission','lambda:addlayerversionpermission','s3:putbucketpolicy','s3:putbucketacl','s3:putObject','s3:putobjectacl','kms:creategrant','kms:putkeypolicy','es:Updateelasticsearchdomainconfig','sns:addpermission','sqs:addpermission','*:*'
        )
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no write access permission to resource based policies.'
        else title || ' has write access permission to resource based policies.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_attached_with_credentials_exposure_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in (
          'chime:createapikey', 'codepipeline:pollforjobs', 'cognito-identity:getopenidtoken', 'cognito-identity:getopenidtokenfordeveloperidentity', 'cognito-identity:getcredentialsforidentity', 'connect:getfederationtoken', 'connect:getfederationtokens', 'ec2:getpassworddata', 'ecr:getauthorizationtoken', 'gamelift:requestuploadcredentials', 'iam:createaccesskey', 'iam:createloginprofile', 'iam:createservicespecificcredential', 'iam:resetservicespecificcredential', 'iam:updateaccesskey', 'lightsail:getinstanceaccessdetails', 'lightsail:getrelationaldatabasemasteruserpassword', 'rds-db:connect', 'redshift:getclustercredentials', 'sso:getrolecredentials', 'mediapackage:rotatechannelcredentials', 'mediapackage:rotateingestendpointcredentials', 'sts:assumerole', 'sts:assumerolewithsaml', 'sts:assumerolewithwebidentity', 'sts:getfederationtoken', 'sts:getsessiontoken','*:*'
        )
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM role attached with credentials exposure permissions.'
        else title || ' has IAM role attached with credentials exposure permissions.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_alter_critical_s3_permissions_configuration" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in (
          's3:putobjectretention','s3:putlifecycleconfiguration','s3:putbucketpolicy','s3:putbucketversioning','*:*'
        )
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM role with alter critical s3 permissions configuration.'
        else title || ' has IAM role with alter critical s3 permissions configuration.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_destruction_kms_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in ('secretsmanager:getsecretvalue', 'kms:decrypt', '*:*')
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM role with destruction KMS permission.'
        else title || ' has IAM role with destruction KMS permission.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_destruction_rds_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in ( 'srds-data:ExecuteStatement', 'rds-data:BatchExecuteStatement', '*:*')
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM role with destruction RDS permission.'
        else title || ' has IAM role with destruction RDS permission.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_cloud_log_tampering_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in ( 'cloudtrail:deletetrail','cloudtrail:puteventselectors','cloudtrail:stoplogging','ec2:deleteflowlogs','s3:putbucketlogging','logs:deletelogstream','logs:deleteloggroup','waf:deleteloggingconfiguration','waf:putloggingconfiguration','*:*')
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM role with cloud log tampering access.'
        else title || ' has IAM role with cloud log tampering access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_write_permission_on_critical_s3_configuration" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in ('s3:putobjectretention','s3:putlifecycleconfiguration','s3:putbucketpolicy','s3:putbucketversioning','*:*')
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM role with write permission on critical s3 configuration.'
        else title || ' has IAM role with write permission on critical s3 configuration.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_security_group_write_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in ( 'rds:createdbsecuritygroup','rds:deletedbsecuritygroup','rds:revokedbsecuritygroupingress','ec2:authorizesecuritygroupegress','ec2:authorizesecuritygroupingress','ec2:createsecuritygroup','ec2:deletesecuritygroup','ec2:modifysecuritygrouprules','ec2:revokesecuritygroupegress','ec2:revokesecuritygroupingress','elasticloadbalancing:applysecuritygroupsToLoadbalancer','elasticloadbalancing:setsecuritygroups','redshift:authorizeclustersecuritygroupingress','redshift:createclustersecuritygroup','redshift:deleteclustersecuritygroup','*:*')
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM role with security group write access.'
        else title || ' has IAM role with security group write access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_defense_evasion_impact_of_aws_security_services_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in ( 'guardduty:updatedetector','guardduty:deletedetector','guardduty:deletemembers','guardduty:updatefilter','guardduty:deletefilter','shield:disableapplicationlayerautomaticresponse','shield:updateprotectiongroup','shield:deletesubscription','detective:disassociatemembership','detective:deletemembers','inspector:disable','config:stopconfigurationrecorder','config:deleteconfigurationrecorder','config:deleteconfigrule','config:deleteorganizationconfigrule','cloudwatch:disablealarmactions','cloudwatch:disableinsightrules','*:*')
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM role with defense evasion impact of AWS security services access.'
        else title || ' has IAM role with defense evasion impact of AWS security services access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_role_with_elastic_ip_hijacking_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in ( 'ec2:DisassociateAddress', 'ec2:EnableAddressTransfer', '*:*')
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM role with elastic IP hijacking access.'
        else title || ' has IAM role with elastic IP hijacking access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_instance_no_iam_passrole_and_lambda_invoke_function_access" {
  sql = <<-EOQ
    with iam_roles as (
      select
        r.arn as role_arn,
        i.arn as intance_arn
      from
        aws_iam_role as r,
        jsonb_array_elements_text(instance_profile_arns) as p
        left join aws_ec2_instance as i on p = i.iam_instance_profile_arn
      where
        i.arn is not null
    ), iam_role_with_permission as (
      select
        arn
      from
        aws_iam_role,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Principal' -> 'Service') as service,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        arn in (select role_arn from iam_roles)
        and  s ->> 'Effect' = 'Allow'
        and service = 'ec2.amazonaws.com'
        and action in ( 'iam:passrole','lambda:createfunction', 'lambda:invokefunction', '*:*')
    )
    select
      i.arn as resource,
      case
        when p.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when p.arn is null then title || ' has no IAM pass role and lambda invoke function access.'
        else title || ' has IAM pass role and lambda invoke function access.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join iam_roles as r on r.intance_arn = i.arn
      left join iam_role_with_permission as p on p.arn = r.role_arn;
  EOQ
}

query "ec2_client_vpn_endpoint_client_connection_logging_enabled" {
  sql = <<-EOQ
    select
      client_vpn_endpoint_id as resource,
      case
        when (connection_log_options ->> 'Enabled')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (connection_log_options ->> 'Enabled')::bool then title || ' client connection logging enabled.'
        else title || ' client connection logging disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_client_vpn_endpoint;
  EOQ
}

query "ec2_ami_ebs_encryption_enabled" {
  sql = <<-EOQ
    with encryption_status as (
      select
        image_id as resource,
        region,
        account_id,
        tags,
        _ctx,
        bool_and(coalesce((mapping -> 'Ebs' ->> 'Encrypted')::text = 'true', false)) as all_encrypted
      from
        aws_ec2_ami
        cross join jsonb_array_elements(block_device_mappings) as mapping
      group by
        image_id,
        region,
        account_id,
        tags,
        _ctx
    )
    select
      resource,
      case
        when all_encrypted then 'ok'
        else 'alarm'
      end as status,
      case
        when all_encrypted then resource || ' all EBS volumes are encrypted.'
        else resource || ' all EBS volumes are not encrypted.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      encryption_status;
  EOQ
}

query "ec2_ami_not_older_than_90_days" {
  sql = <<-EOQ
    select
      image_id as resource,
      case
        when creation_date >= (current_date - interval '90 days') then 'ok'
        else 'alarm'
      end as status,
      title || ' created ' || to_char(creation_date , 'DD-Mon-YYYY') || ' (' || extract(day from current_timestamp - creation_date) || ' days).' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_ami;
  EOQ
}

query "ec2_instance_not_older_than_180_days" {
  sql = <<-EOQ
    select
      instance_id as resource,
      launch_time,
      case
        when launch_time >= (current_date - interval '180 days') then 'ok'
        else 'alarm'
      end as status,
      title || ' created ' || to_char(launch_time , 'DD-Mon-YYYY') || ' (' || extract(day from current_timestamp - launch_time) || ' days).' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_stopped_instance_90_days" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when instance_state not in ('stopped', 'stopping') then 'skip'
        when state_transition_time <= (current_date - interval '90' day) then 'alarm'
        else 'ok'
      end as status,
      case
        when instance_state not in ('stopped', 'stopping') then title || ' is in ' || instance_state || ' state.'
        else title || ' stopped since ' || to_char(state_transition_time , 'DD-Mon-YYYY') || ' (' || extract(day from current_timestamp - state_transition_time) || ' days).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_attached_ebs_volume_delete_on_termination_enabled" {
  sql = <<-EOQ
    with ebs_volume_with_delete_on_termination_enabled as (
      select
        count(*) as count,
        arn
      from
        aws_ec2_instance,
        jsonb_array_elements(block_device_mappings) as p
      where
        p -> 'Ebs' ->> 'DeleteOnTermination' = 'false'
      group by
        arn
    )
    select
      i.arn as resource,
      case
        when e.count > 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when e.count > 0 then ' EBS volume(s) attached to ' || title || ' has delete on termination disabled.'
        else ' EBS volume(s) attached to ' || title || ' has delete on termination enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance as i
      left join ebs_volume_with_delete_on_termination_enabled as e on e.arn = i.arn;
  EOQ
}

query "ec2_network_interface_unused" {
  sql = <<-EOQ
    select
      network_interface_id as resource,
      case
        when status = 'available' and attached_instance_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when status = 'available' and attached_instance_id is null then title || ' not in use.'
        else title || ' in use.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_network_interface;
  EOQ
}

query "ec2_instance_using_iam_instance_role" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when iam_instance_profile_arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when iam_instance_profile_arn is not null then title || ' uses IAM role for access.'
        else title || ' does not use IAM role for access.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_launch_template_default_version_uses_imdsv2" {
  sql = <<-EOQ
    select
      launch_template_id as resource,
      case
        when launch_template_data -> 'MetadataOptions' ->> 'HttpTokens' = 'required' then 'ok'
        else 'alarm'
      end as status,
      case
        when launch_template_data -> 'MetadataOptions' ->> 'HttpTokens' = 'required' then title || ' configured to use Instance Metadata Service Version 2 (IMDSv2).'
        else title || ' not configured to use Instance Metadata Service Version 2 (IMDSv2).'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_launch_template_version
    where
      default_version;
  EOQ
}

query "ec2_launch_template_ebs_volume_encrypted" {
  sql = <<-EOQ
    select
      launch_template_id as resource,
      case
        when launch_template_data -> 'BlockDeviceMappings' is null or launch_template_data -> 'BlockDeviceMappings' = 'null' then 'skip'
        when jsonb_typeof(launch_template_data -> 'BlockDeviceMappings') <> 'array' then 'skip'
        when exists (
          select 1
          from jsonb_array_elements(launch_template_data -> 'BlockDeviceMappings') bdm
          where bdm -> 'Ebs' is not null
            and (
              (bdm -> 'Ebs' ->> 'Encrypted')::boolean = false
              or bdm -> 'Ebs' ->> 'Encrypted' is null
            )
        ) then 'alarm'
        else 'ok'
      end as status,
      case
        when launch_template_data -> 'BlockDeviceMappings' is null or launch_template_data -> 'BlockDeviceMappings' = 'null' then title || ' does not define any block device mappings.'
        when jsonb_typeof(launch_template_data -> 'BlockDeviceMappings') <> 'array' then title || ' block device mappings is not an array.'
        when exists (
          select 1
          from jsonb_array_elements(launch_template_data -> 'BlockDeviceMappings') bdm
          where bdm -> 'Ebs' is not null
            and (
              (bdm -> 'Ebs' ->> 'Encrypted')::boolean = false
              or bdm -> 'Ebs' ->> 'Encrypted' is null
            )
        ) then title || ' has unencrypted EBS volumes.'
        else title || ' has all EBS volumes encrypted.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_launch_template_version
    where
      default_version;
  EOQ
}

query "ec2_network_inteface_source_destination_check_enabled" {
  sql = <<-EOQ
    select
      network_interface_id as resource,
      case
        when interface_type not in ('aws_codestar_connections_managed', 'branch', 'efa', 'interface', 'lambda', 'quicksight') then 'skip'
        when source_dest_check then 'ok'
        else 'alarm'
      end as status,
      case
        when interface_type not in ('aws_codestar_connections_managed', 'branch', 'efa', 'interface', 'lambda', 'quicksight') then title || ' is of ' || interface_type || ' network interface.'
        when source_dest_check then title || ' source destination check enabled.'
        else title || ' source destination check disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_network_interface;
  EOQ
}

query "ec2_spot_fleet_request_with_launch_parameter_ebs_encryption_enabled" {
  sql = <<-EOQ
    select
      spot_fleet_request_id as resource,
      case
        when launch_specifications is null then 'skip'
        when exists (
          select 1
          from jsonb_array_elements(launch_specifications) spec,
               jsonb_array_elements(spec -> 'BlockDeviceMappings') bdm
          where (bdm -> 'Ebs' ->> 'Encrypted')::boolean = false
             or bdm -> 'Ebs' ->> 'Encrypted' is null
        ) then 'alarm'
        else 'ok'
      end as status,
      case
        when launch_specifications is null then title || ' does not define any launch specifications.'
        when exists (
          select 1
          from jsonb_array_elements(launch_specifications) spec,
               jsonb_array_elements(spec -> 'BlockDeviceMappings') bdm
          where (bdm -> 'Ebs' ->> 'Encrypted')::boolean = false
             or bdm -> 'Ebs' ->> 'Encrypted' is null
        )
          then title || ' has launch parameters with unencrypted EBS volumes.'
        else title || ' has all launch parameters with encrypted EBS volumes.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_spot_fleet_request;
  EOQ
}
