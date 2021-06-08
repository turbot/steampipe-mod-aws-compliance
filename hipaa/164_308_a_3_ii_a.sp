locals {
  hipaa_164_308_a_3_ii_a_common_tags = merge(local.hipaa_common_tags, {
    service = "164_308_a_3_ii_a"
  })
}

benchmark "hipaa_164_308_a_3_ii_a" {
  title         = "164.308(a)(3)(ii)(A) Authorization and/or supervision"
  description   = "Implement procedures for the authorization and/or supervision of workforce members who work with electronic protected health information or in locations where it might be accessed."
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a.md")
  children = [
    control.hipaa_164_308_a_3_ii_a_elb_application_classic_logging_enabled,
    control.hipaa_164_308_a_3_ii_a_emr_cluster_kerberos_enabled,
    control.hipaa_164_308_a_3_ii_a_guardduty_enabled,
    control.hipaa_164_308_a_3_ii_a_iam_user_mfa_enabled,
    control.hipaa_164_308_a_3_ii_a_iam_console_access_mfa_enabled,
    control.hipaa_164_308_a_3_ii_a_iam_root_user_hardware_mfa,
    control.hipaa_164_308_a_3_ii_a_iam_root_user_mfa,
    control.hipaa_164_308_a_3_ii_a_vpc_flow_log_enabled
  ]
  tags          = local.hipaa_164_308_a_3_ii_a_common_tags
}

control "hipaa_164_308_a_3_ii_a_elb_application_classic_logging_enabled" {
  title         = "ELB application classic logging enabled"
  description   = "Elastic Load Balancing activity is a central point of communication within an environment."
  sql           = query.elb_application_classic_logging_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_elb_application_classic_logging_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_3_ii_a_elb_application_classic_logging_enabled"
  })
}

control "hipaa_164_308_a_3_ii_a_emr_cluster_kerberos_enabled" {
  title         = "EMR cluster kerberos enabled"
  description   = "The access permissions and authorizations can be managed and incorporated with the principles of least privilege and separation of duties, by enabling Kerberos for Amazon EMR clusters."
  sql           = query.emr_cluster_kerberos_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_emr_cluster_kerberos_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_3_ii_a_emr_cluster_kerberos_enabled"
  })
}

control "hipaa_164_308_a_3_ii_a_guardduty_enabled" {
  title         = "GuardDuty enabled"
  description   = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql           = query.guardduty_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_guardduty_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_3_ii_a_guardduty_enabled"
  })
}

control "hipaa_164_308_a_3_ii_a_iam_user_mfa_enabled" {
  title         = "IAM user MFA enabled"
  description   = "Enable this rule to restrict access to resources in the AWS Cloud."
  sql           = query.iam_user_mfa.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_iam_user_mfa_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_3_ii_a_iam_user_mfa_enabled"
  })
}

control "hipaa_164_308_a_3_ii_a_iam_console_access_mfa_enabled" {
  title         = "IAM console access MFA enabled"
  description   = "Manage access to resources in the AWS Cloud by ensuring that MFA is enabled for all AWS Identity and Access Management (IAM) users that have a console password."
  sql           = query.iam_user_mfa.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_iam_console_access_mfa_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_3_ii_a_iam_console_access_mfa_enabled"
  })
}

control "hipaa_164_308_a_3_ii_a_iam_root_user_hardware_mfa" {
  title         = "IAM root user hardware MFA"
  description   = "Manage access to resources in the AWS Cloud by ensuring hardware MFA is enabled for the root user."
  sql           = query.iam_root_user_hardware_mfa.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_iam_root_user_hardware_mfa.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_3_ii_a_iam_root_user_hardware_mfa"
  })
}

control "hipaa_164_308_a_3_ii_a_iam_root_user_mfa" {
  title         = "IAM root user MFA"
  description   = "Manage access to resources in the AWS Cloud by ensuring MFA is enabled for the root user."
  sql           = query.iam_root_user_mfa.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_iam_root_user_mfa.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_3_ii_a_iam_root_user_mfa"
  })
}

control "hipaa_164_308_a_3_ii_a_vpc_flow_log_enabled" {
  title         = "VPC flow log enabled"
  description   = "The VPC flow logs provide detailed records for information about the IP traffic going to and from network interfaces in your Amazon Virtual Private Cloud (Amazon VPC)."
  sql           = query.vpc_flow_log_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_ii_a_vpc_flow_log_enabled.md")

  tags = merge(local.hipaa_164_308_a_3_ii_a_common_tags, {
    hipaa_item_id  = "hipaa_164_308_a_3_ii_a_vpc_flow_log_enabled"
  })
}