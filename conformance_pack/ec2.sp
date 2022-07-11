locals {
  conformance_pack_ec2_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EC2"
  })
}

control "ec2_ebs_default_encryption_enabled" {
  title       = "EBS default encryption should be enabled"
  description = "To help protect data at rest, ensure that encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql         = query.ec2_ebs_default_encryption_enabled.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cisa_cyber_essentials = "true"
    ffiec                 = "true"
    gxp_21_cfr_part_11    = "true"
    hipaa                 = "true"
    nist_800_53_rev_5     = "true"
  })
}

control "ec2_instance_detailed_monitoring_enabled" {
  title       = "EC2 instance detailed monitoring should be enabled"
  description = "Enable this rule to help improve Amazon Elastic Compute Cloud (Amazon EC2) instance monitoring on the Amazon EC2 console, which displays monitoring graphs with a 1-minute period for the instance."
  sql         = query.ec2_instance_detailed_monitoring_enabled.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    nist_800_53_rev_4      = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "ec2_instance_in_vpc" {
  title       = "EC2 instances should be in a VPC"
  description = "Deploy Amazon Elastic Compute Cloud (Amazon EC2) instances within an Amazon Virtual Private Cloud (Amazon VPC) to enable secure communication between an instance and other services within the amazon VPC, without requiring an internet gateway, NAT device, or VPN connection."
  sql         = query.ec2_instance_in_vpc.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
  })
}

control "ec2_instance_not_publicly_accessible" {
  title       = "EC2 instances should not have a public IP address"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elastic Compute Cloud (Amazon EC2) instances cannot be publicly accessed."
  sql         = query.ec2_instance_not_publicly_accessible.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
    nist_csf               = "true"
    rbi_cyber_security     = "true"
    soc_2                  = "true"
  })
}

control "ec2_stopped_instance_30_days" {
  title       = "EC2 stopped instances should be removed in 30 days"
  description = "Enable this rule to help with the baseline configuration of Amazon Elastic Compute Cloud (Amazon EC2) instances by checking whether Amazon EC2 instances have been stopped for more than the allowed number of days, according to your organization's standards."
  sql         = query.ec2_stopped_instance_30_days.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    gxp_21_cfr_part_11     = "true"
    hipaa                  = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
  })
}

control "ec2_instance_ebs_optimized" {
  title       = "EC2 instance should have EBS optimization enabled"
  description = "An optimized instance in Amazon Elastic Block Store (Amazon EBS) provides additional, dedicated capacity for Amazon EBS I/O operations."
  sql         = query.ec2_instance_ebs_optimized.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    audit_manager_control_tower = "true"
    cisa_cyber_essentials       = "true"
    fedramp_low_rev_4           = "true"
    fedramp_moderate_rev_4      = "true"
    gxp_21_cfr_part_11          = "true"
    hipaa                       = "true"
    nist_800_53_rev_5           = "true"
    nist_csf                    = "true"
    soc_2                       = "true"
  })
}

control "ec2_instance_uses_imdsv2" {
  title       = "EC2 instances should use IMDSv2"
  description = "Ensure the Instance Metadata Service Version 2 (IMDSv2) method is enabled to help protect access and control of Amazon Elastic Compute Cloud (Amazon EC2) instance metadata."
  sql         = query.ec2_instance_uses_imdsv2.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gxp_21_cfr_part_11     = "true"
    nist_800_53_rev_4      = "true"
    nist_800_53_rev_5      = "true"
  })
}

control "ec2_instance_protected_by_backup_plan" {
  title       = "EC2 instances should be protected by backup plan"
  description = "Ensure if Amazon Elastic Compute Cloud (Amazon EC2) instances are protected by a backup plan. The rule is non complaint if the Amazon EC2 instance is not covered by a backup plan."
  sql         = query.ec2_instance_protected_by_backup_plan.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cisa_cyber_essentials  = "true"
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    ffiec                  = "true"
    hipaa                  = "true"
    nist_csf               = "true"
    soc_2                  = "true"
  })
}

control "ec2_instance_iam_profile_attached" {
  title       = "EC2 instances should have IAM profile attached"
  description = "Ensure if an Amazon Elastic Compute Cloud (Amazon EC2) instance has an Identity and Access Management (IAM) profile attached to it. This rule is non compliant if no IAM profile is attached to the Amazon EC2 instance."
  sql         = query.ec2_instance_iam_profile_attached.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    ffiec              = "true"
    gxp_21_cfr_part_11 = "true"
    nist_800_53_rev_5  = "true"
  })
}

control "ec2_instance_publicly_accessible_iam_profile_attached" {
  title       = "Public EC2 instances should have IAM profile attached"
  description = "Ensure Amazon Elastic Compute Cloud (Amazon EC2) public instances have an Identity and Access Management (IAM) profile attached to them. This rule is non compliant if no IAM profile is attached to public Amazon EC2 instance."
  sql         = query.ec2_instance_publicly_accessible_iam_profile_attached.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    other_checks = "true"
  })
}

control "ec2_instance_user_data_no_secrets" {
  title       = "EC2 instances user data should not have secrets"
  description = "User data is a metadata field of an EC2 instance that allows custom code to run after the instance is launched. It contains code which is exposed to any entity which has the most basic access to EC2, even read-only configurations. It is recommended to not use secrets in user data."
  sql         = query.ec2_instance_user_data_no_secrets.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    other_checks = "true"
  })
}

control "ec2_transit_gateway_auto_cross_account_attachment_disabled" {
  title       = "EC2 transit gateways should have auto accept shared attachments disabled"
  description = "Ensure transit gateways have auto accept shared attachments feature disabled. If this setting is disabled, then any VPC that attempts to attach to a transit gateway will need to request authorization, and the account that owns the transit gateway will need to accept the authorization."
  sql         = query.ec2_transit_gateway_auto_cross_account_attachment_disabled.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    other_checks = "true"
  })
}

control "ec2_instance_no_launch_wizard_security_group" {
  title       = "EC2 instances should not be attached to 'launch wizard' security groups"
  description = "Ensure EC2 instances provisioned in your AWS account are not associated with security groups that have their name prefixed with 'launch-wizard', in order to enforce using secure and custom security groups that exercise the principle of least privilege."
  sql         = query.ec2_instance_no_launch_wizard_security_group.sql

  tags = merge(local.conformance_pack_ec2_common_tags, {
    other_checks = "true"
  })
}
