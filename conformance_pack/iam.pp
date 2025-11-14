locals {
  conformance_pack_iam_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/IAM"
  })
}

control "iam_user_unused_credentials_45" {
  title       = "Ensure credentials unused for 45 days or greater are disabled"
  description = "AWS IAM users can access AWS resources using different types of credentials, such as passwords or access keys. It is recommended that all credentials that have been unused in 45 or greater days be deactivated or removed."
  query       = query.iam_user_unused_credentials_45

  tags = local.conformance_pack_iam_common_tags
}

control "iam_access_analyzer_enabled" {
  title       = "Ensure that IAM Access analyzer is enabled for all regions"
  description = "This control checks whether IAM Access analyzer is enabled for all regions. The control fails if IAM Access analyzer is not enabled for all regions."
  query       = query.iam_access_analyzer_enabled

  tags = local.conformance_pack_iam_common_tags
}

control "iam_root_user_account_console_access_mfa_enabled" {
  title       = "Ensure that the root user account has MFA enabled for console access"
  description = "This control checks whether the root user account has multi-factor authentication (MFA) enabled for console access. The control fails if the root user account does not have MFA enabled for console access."
  query       = query.iam_root_user_account_console_access_mfa_enabled

  tags = local.conformance_pack_iam_common_tags
}

control "iam_user_group_role_cloudshell_fullaccess_restricted" {
  title       = "Ensure access to AWSCloudShellFullAccess is restricted"
  description = "This control checks whether the AWSCloudShellFullAccess policy is attached to any IAM user, group, or role. The control fails if the policy is attached to any IAM user, group, or role."
  query       = query.iam_user_group_role_cloudshell_fullaccess_restricted

  tags = local.conformance_pack_iam_common_tags
}

control "iam_policy_all_attached_no_star_star" {
  title       = "Ensure IAM policies that allow full \"*:*\" administrative privileges are not attached"
  description = "IAM policies are the means by which privileges are granted to users, groups, or roles. It is recommended and considered a standard security advice to grant least privilege -that is, granting only the permissions required to perform a task. Determine what users need to do and then craft policies for them that let the users perform only those tasks, instead of allowing full administrative privileges."
  query       = query.iam_policy_all_attached_no_star_star

  tags = local.conformance_pack_iam_common_tags
}

control "iam_root_last_used" {
  title       = "Eliminate use of the 'root' user for administrative and daily tasks"
  description = "This control checks whether the root user has been used in the last 90 days. The control fails if the root user has been used in the last 90 days."
  query       = query.iam_root_last_used

  tags = local.conformance_pack_iam_common_tags
}

control "iam_server_certificate_not_expired" {
  title       = "Ensure that all the expired SSL/TLS certificates stored in AWS IAM are removed"
  description = "To enable HTTPS connections to your website or application in AWS, you need an SSL/TLS server certificate. You can use ACM or IAM to store and deploy server certificates. Use IAM as a certificate manager only when you must support HTTPS connections in a region that is not supported by ACM. IAM securely encrypts your private keys and stores the encrypted version in IAM SSL certificate storage. IAM supports deploying server certificates in all regions, but you must obtain your certificate from an external provider for use with AWS. You cannot upload an ACM certificate to IAM. Additionally, you cannot manage your certificates from the IAM Console."
  query       = query.iam_server_certificate_not_expired

  tags = local.conformance_pack_iam_common_tags
}

control "iam_user_access_keys_and_password_at_setup" {
  title       = "Ensure IAM users are assigned access keys and passwords at setup"
  description = "This control checks whether the IAM users have access keys and passwords at setup. The control fails if the IAM users do not have access keys and passwords at setup."
  query       = query.iam_user_access_keys_and_password_at_setup

  tags = local.conformance_pack_iam_common_tags
}

control "iam_user_no_policies" {
  title       = "Ensure IAM policies are attached only to groups or roles"
  description = "By default, IAM users, groups, and roles have no access to AWS resources. IAM policies are the means by which privileges are granted to users, groups, or roles. It is recommended that IAM policies be applied directly to groups and roles but not users."
  query       = query.iam_user_no_policies

  tags = merge(local.conformance_pack_iam_common_tags, {
    nydfs_23 = "true"
  })
}

control "iam_user_one_active_key" {
  title       = "Ensure there is only one active access key available for any single IAM user"
  description = "Access keys are long-term credentials for an IAM user or the AWS account root user. You can use access keys to sign programmatic requests to the AWS CLI or AWS API (directly or using the AWS SDK)."
  query       = query.iam_user_one_active_key

  tags = local.conformance_pack_iam_common_tags
}

control "iam_policy_custom_attached_no_star_star" {
  title       = "IAM policies should not allow full '*' administrative privileges"
  description = "This control checks whether the default version of IAM policies (also known as customer managed policies) has administrator access that includes a statement with 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'. The control only checks the customer managed policies that you create. It does not check inline and AWS managed policies."
  query       = query.iam_policy_custom_attached_no_star_star

  tags = local.conformance_pack_iam_common_tags
}

control "iam_account_password_policy_strong_min_length_8" {
  title       = "Password policies for IAM users should have strong configurations with minimum length of 8 or greater"
  description = "This control checks whether the account password policy for IAM users uses the recommended configurations."
  query       = query.iam_account_password_policy_strong_min_length_8

  tags = local.conformance_pack_iam_common_tags
}

control "iam_account_password_policy_strong_min_reuse_24" {
  title       = "IAM password policies for users should have strong configurations"
  description = "The identities and the credentials are issued, managed, and verified based on an organizational IAM password policy."
  query       = query.iam_account_password_policy_strong_min_reuse_24

  tags = merge(local.conformance_pack_iam_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_group_not_empty" {
  title       = "IAM groups should have at least one user"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, by ensuring that IAM groups have at least one IAM user."
  query       = query.iam_group_not_empty

  tags = merge(local.conformance_pack_iam_common_tags, {
    cis_controls_v8_ig1                    = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_policy_no_star_star" {
  title       = "IAM policy should not have statements with admin access"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'."
  query       = query.iam_policy_no_star_star

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_root_user_no_access_keys" {
  title       = "IAM root user should not have access keys"
  description = "Access to systems and assets can be controlled by checking that the root user does not have access keys attached to their AWS Identity and Access Management (IAM) role."
  query       = query.iam_root_user_no_access_keys

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
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

control "iam_root_user_hardware_mfa_enabled" {
  title       = "IAM root user hardware MFA should be enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring hardware MFA is enabled for the root user."
  query       = query.iam_root_user_hardware_mfa_enabled

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_root_user_mfa_enabled" {
  title       = "IAM root user MFA should be enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring MFA is enabled for the root user."
  query       = query.iam_root_user_mfa_enabled

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_user_access_key_age_90" {
  title       = "IAM user access keys should be rotated at least every 90 days"
  description = "The credentials are audited for authorized devices, users, and processes by ensuring IAM access keys are rotated as per organizational policy."
  query       = query.iam_user_access_key_age_90

  tags = merge(local.conformance_pack_iam_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_user_console_access_mfa_enabled" {
  title       = "IAM users with console access should have MFA enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring that MFA is enabled for all AWS Identity and Access Management (IAM) users that have a console password."
  query       = query.iam_user_console_access_mfa_enabled

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_user_mfa_enabled" {
  title       = "IAM user MFA should be enabled"
  description = "Enable this rule to restrict access to resources in the AWS Cloud."
  query       = query.iam_user_mfa_enabled

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    audit_manager_control_tower            = "true"
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
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_user_no_inline_attached_policies" {
  title       = "IAM user should not have any inline or attached policies"
  description = "This rule ensures AWS Identity and Access Management (IAM) policies are attached only to groups or roles to control access to systems and assets."
  query       = query.iam_user_no_inline_attached_policies

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_user_unused_credentials_90" {
  title       = "IAM user credentials that have not been used in 90 days should be disabled"
  description = "AWS Identity and Access Management (IAM) can help you with access permissions and authorizations by checking for IAM passwords and access keys that are not used for a specified time period."
  query       = query.iam_user_unused_credentials_90

  tags = merge(local.conformance_pack_iam_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gdpr                                   = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_user_in_group" {
  title       = "IAM users should be in at least one group"
  description = "AWS Identity and Access Management (IAM) can help you restrict access permissions and authorizations, by ensuring IAM users are members of at least one group."
  query       = query.iam_user_in_group

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
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
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_group_user_role_no_inline_policies" {
  title       = "IAM groups, users, and roles should not have any inline policies"
  description = "Ensure an AWS Identity and Access Management (IAM) user, IAM role or IAM group does not have an inline policy to control access to systems and assets."
  query       = query.iam_group_user_role_no_inline_policies

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "iam_support_role" {
  title       = "Ensure a support role has been created to manage incidents with AWS Support"
  description = "AWS provides a support center that can be used for incident notification and response, as well as technical support and customer services."
  query       = query.iam_support_role

  tags = merge(local.conformance_pack_iam_common_tags, {
    gdpr        = "true"
    nist_csf_v2 = "true"
  })
}

control "iam_account_password_policy_min_length_14" {
  title       = "Ensure IAM password policy requires a minimum length of 14 or greater"
  description = "Password policies, in part, enforce password complexity requirements. Use IAM password policies to ensure that passwords are at least a given length. Security Hub recommends that the password policy require a minimum password length of 14 characters."
  query       = query.iam_account_password_policy_min_length_14

  tags = merge(local.conformance_pack_iam_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    gdpr                   = "true"
    nist_800_53_rev_5      = "true"
  })
}

control "iam_account_password_policy_reuse_24" {
  title       = "Ensure IAM password policy prevents password reuse"
  description = "This control checks whether the number of passwords to remember is set to 24. The control fails if the value is not 24. IAM password policies can prevent the reuse of a given password by the same user."
  query       = query.iam_account_password_policy_reuse_24

  tags = merge(local.conformance_pack_iam_common_tags, {
    gdpr = "true"
  })
}

control "iam_account_password_policy_one_lowercase_letter" {
  title       = "Ensure IAM password policy requires at least one lowercase letter"
  description = "Password policies, in part, enforce password complexity requirements. Use IAM password policies to ensure that passwords use different character sets. Security Hub recommends that the password policy require at least one lowercase letter. Setting a password complexity policy increases account resiliency against brute force login attempts."
  query       = query.iam_account_password_policy_one_lowercase_letter

  tags = merge(local.conformance_pack_iam_common_tags, {
    gdpr = "true"
  })
}

control "iam_account_password_policy_one_uppercase_letter" {
  title       = "Ensure IAM password policy requires at least one uppercase letter"
  description = "Password policies, in part, enforce password complexity requirements. Use IAM password policies to ensure that passwords use different character sets."
  query       = query.iam_account_password_policy_one_uppercase_letter

  tags = merge(local.conformance_pack_iam_common_tags, {
    gdpr = "true"
  })
}

control "iam_account_password_policy_one_number" {
  title       = "Ensure IAM password policy requires at least one number"
  description = "Password policies, in part, enforce password complexity requirements. Use IAM password policies to ensure that passwords use different character sets."
  query       = query.iam_account_password_policy_one_number

  tags = merge(local.conformance_pack_iam_common_tags, {
    gdpr = "true"
  })
}

control "iam_password_policy_expire_90" {
  title       = "Ensure IAM password policy expires passwords within 90 days or less"
  description = "IAM password policies can require passwords to be rotated or expired after a given number of days. Security Hub recommends that the password policy expire passwords after 90 days or less. Reducing the password lifetime increases account resiliency against brute force login attempts."
  query       = query.iam_password_policy_expire_90

  tags = merge(local.conformance_pack_iam_common_tags, {
    gdpr = "true"
  })
}

control "iam_account_password_policy_one_symbol" {
  title       = "Ensure IAM password policy requires at least one symbol"
  description = "Password policies, in part, enforce password complexity requirements. Use IAM password policies to ensure that passwords use different character sets. Security Hub recommends that the password policy require at least one symbol. Setting a password complexity policy increases account resiliency against brute force login attempts."
  query       = query.iam_account_password_policy_one_symbol

  tags = merge(local.conformance_pack_iam_common_tags, {
    gdpr = "true"
  })
}

control "iam_all_policy_no_service_wild_card" {
  title       = "Ensure IAM policy should not grant full access to service"
  description = "Checks if AWS Identity and Access Management (IAM) policies grant permissions to all actions on individual AWS resources. The rule is non-compliant if the managed IAM policy allows full access to at least 1 AWS service."
  query       = query.iam_all_policy_no_service_wild_card

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    cis_controls_v8_ig1                    = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
  })
}

control "iam_policy_custom_no_blocked_kms_actions" {
  title       = "Ensure managed IAM policies should not allow blocked actions on KMS keys"
  description = "Checks if the managed AWS Identity and Access Management (IAM) policies that you create do not allow blocked actions on AWS KMS keys. The rule is non - compliant if any blocked action is allowed on AWS KMS keys by the managed IAM policy."
  query       = query.iam_policy_custom_no_blocked_kms_actions

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
  })
}

control "iam_policy_inline_no_blocked_kms_actions" {
  title       = "Ensure inline policies attached to IAM users, roles, and groups should not allow blocked actions on KMS keys"
  description = "Checks if the inline policies attached to IAM users, roles, and groups do not allow blocked actions on all AWS Key Management Service (KMS) keys. The rule is non - compliant if any blocked action is allowed on all KMS keys in an inline policy."
  query       = query.iam_policy_inline_no_blocked_kms_actions

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight                   = "true"
    cisa_cyber_essentials                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    nist_csf_v2                            = "true"
    pci_dss_v321                           = "true"
    pci_dss_v40                            = "true"
  })
}

control "iam_policy_custom_no_assume_role" {
  title       = "IAM roles should not have any assume role policies attached"
  description = "Role assume policies can provide access to roles in external AWS accounts."
  query       = query.iam_policy_custom_no_assume_role

  tags = local.conformance_pack_iam_common_tags
}

control "iam_user_hardware_mfa_enabled" {
  title       = "IAM users should have hardware MFA enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring hardware MFA is enabled for the user."
  query       = query.iam_user_hardware_mfa_enabled

  tags = local.conformance_pack_iam_common_tags
}

control "iam_user_with_administrator_access_mfa_enabled" {
  title       = "IAM administrator users should have MFA enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring MFA is enabled for users with administrative privileges."
  query       = query.iam_user_with_administrator_access_mfa_enabled

  tags = merge(local.conformance_pack_iam_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "iam_managed_policy_attached_to_role" {
  title       = "IAM AWS managed policies should be attached to IAM role"
  description = "This control checks if all AWS managed policies specified in the list of managed policies are attached to the AWS Identity and Access Management (IAM) role. The rule is non-compliant if an AWS managed policy is not attached to the IAM role."
  query       = query.iam_managed_policy_attached_to_role

  tags = local.conformance_pack_iam_common_tags
}

control "iam_custom_managed_policy_attached_to_role" {
  title       = "IAM customer managed policies should be attached to IAM role"
  description = "This control checks if customer managed IAM policies are attached to an AWS Identity and Access Management (IAM) role. The rule is non-compliant if a customer managed IAM policy is not attached to any IAM role."
  query       = query.iam_custom_managed_policy_attached_to_role

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight = "true"
    cis_controls_v8_ig1  = "true"
    gxp_21_cfr_part_11   = "true"
    nist_csf             = "true"
    nist_csf_v2          = "true"
    pci_dss_v40          = "true"
    soc_2                = "true"
  })
}

control "iam_policy_unused" {
  title       = "IAM policy should be in use"
  description = "This control checks whether the IAM policy ARN is attached to an IAM user, or a group with one or more IAM users, or an IAM role with one or more trusted entity."
  query       = query.iam_policy_unused

  tags = local.conformance_pack_iam_common_tags
}

control "iam_custom_policy_unused" {
  title       = "IAM customer managed policy should be in use"
  description = "This control checks whether customer managed IAM policies are attached to an IAM user, or a group with one or more IAM users, or an IAM role with one or more trusted entity."
  query       = query.iam_custom_policy_unused

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight = "true"
    cis_controls_v8_ig1  = "true"
    nist_800_171_rev_2   = "true"
    nist_csf             = "true"
    pci_dss_v40          = "true"
    soc_2                = "true"
  })
}

control "iam_access_analyzer_enabled_without_findings" {
  title       = "IAM Access analyzer should be enabled without findings"
  description = "This control checks whether the IAM Access analyzer is enabled without findings. If you grant permissions to an S3 bucket in one of your organization member accounts to a principal in another organization member account, IAM Access Analyzer does not generate a finding. But if you grant permission to a principal in an account that is not a member of the organization, IAM Access Analyzer generates a finding."
  query       = query.iam_access_analyzer_enabled_without_findings

  tags = local.conformance_pack_iam_common_tags
}

control "iam_role_unused_60" {
  title       = "IAM roles that have not been used in 60 days should be removed"
  description = "This control checks whether the IAM role has been used in 60 days. Unused accounts and roles increase the attack surface area."
  query       = query.iam_role_unused_60

  tags = local.conformance_pack_iam_common_tags
}

control "iam_custom_policy_unattached_no_star_star" {
  title       = "IAM unattached custom policy should not have statements with admin access"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing 'Effect': 'Allow' with 'Action': '*' over 'Resource': '*'."
  query       = query.iam_custom_policy_unattached_no_star_star

  tags = merge(local.conformance_pack_iam_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "iam_policy_no_full_access_to_cloudtrail" {
  title       = "IAM policy should not grant full access to cloudtrail service"
  description = "CloudTrail is a critical service and IAM policies should follow least privilege model for this service in particular. This control is non-compliant if the managed IAM policy allows full access to cloudtrail service."
  query       = query.iam_policy_no_full_access_to_cloudtrail

  tags = local.conformance_pack_iam_common_tags
}

control "iam_policy_no_full_access_to_kms" {
  title       = "IAM policy should not grant full access to KMS service"
  description = "KMS is a critical service and IAM policies should follow least privilege model for this service in particular. This control is non-compliant if the managed IAM policy allows full access to KMS service."
  query       = query.iam_policy_no_full_access_to_kms

  tags = local.conformance_pack_iam_common_tags
}

control "iam_role_cross_account_read_only_access_policy" {
  title       = "IAM roles should not have read only access for external AWS accounts"
  description = "Ensure IAM Roles do not have ReadOnlyAccess access for external AWS account. The AWS-managed ReadOnlyAccess policy carries a high risk of potential data leakage, posing a significant threat to customer security and privacy."
  query       = query.iam_role_cross_account_read_only_access_policy

  tags = local.conformance_pack_iam_common_tags
}

control "iam_security_audit_role" {
  title       = "IAM Security Audit role should be created to conduct security audits"
  description = "Ensure IAM Security Audit role is created. By creating an IAM role with a security audit policy, a distinct segregation of responsibilities is established between the security team and other teams within the organization."
  query       = query.iam_security_audit_role

  tags = merge(local.conformance_pack_iam_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "iam_policy_custom_no_permissive_role_assumption" {
  title       = "IAM custom policy should not have overly permissive STS role assumption"
  description = "Ensure that no custom IAM policies exist which allow permissive role assumption."
  query       = query.iam_policy_custom_no_permissive_role_assumption

  tags = local.conformance_pack_iam_common_tags
}

control "iam_inline_policy_no_administrative_privileges" {
  title       = "IAM inline policy should not have administrative privileges"
  description = "Ensure that no inline IAM policies exist that allow administrative privileges."
  query       = query.iam_inline_policy_no_administrative_privileges

  tags = local.conformance_pack_iam_common_tags
}

control "iam_user_console_access_unused_45" {
  title       = "Ensure IAM users with console access unused for 45 days or greater are disabled"
  description = "AWS IAM users can access AWS resources using console access. It is recommended that console access that have been unused in 45 or greater days be deactivated or removed."
  query       = query.iam_user_console_access_unused_45

  tags = local.conformance_pack_iam_common_tags
}

control "iam_user_access_key_unused_45" {
  title       = "Ensure IAM users with access keys unused for 45 days or greater are disabled"
  description = "AWS IAM users can access AWS resources using access keys. It is recommended that access keys that have been unused in 45 or greater days be deactivated or removed."
  query       = query.iam_user_access_key_unused_45

  tags = merge(local.conformance_pack_iam_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "iam_role_no_administrator_access_policy_attached" {
  title       = "Ensure IAM role not attached with Administratoraccess policy"
  description = "AWS IAM role should not be attached Administratoraccess policy."
  query       = query.iam_role_no_administrator_access_policy_attached

  tags = local.conformance_pack_iam_common_tags
}

control "iam_user_access_key_age_365" {
  title       = "IAM user access keys should be rotated at least every 365 days"
  description = "The credentials are audited for authorized devices, users, and processes by ensuring IAM access keys are rotated as per organizational policy. This control uses a 365-day rotation period which may be more suitable for organizations that find the 90-day rotation period too aggressive."
  query       = query.iam_user_access_key_age_365

  tags = local.conformance_pack_iam_common_tags
}

control "iam_role_cross_account_write_access_policy" {
  title         = "IAM roles should not have cross-account write access policies"
  description   = "This control checks whether IAM roles have policies that allow write access to resources in other AWS accounts. Such policies can pose a security risk as they may allow unauthorized access to resources in other accounts."
  query         = query.iam_role_cross_account_write_access_policy

  tags = local.conformance_pack_iam_common_tags
}

query "iam_account_password_policy_strong_min_reuse_24" {
  sql = <<-EOQ
    select
      'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when minimum_password_length >= 14
          and password_reuse_prevention >= 24
          and require_lowercase_characters = 'true'
          and require_uppercase_characters = 'true'
          and require_numbers = 'true'
          and require_symbols = 'true'
          and max_password_age <= 90
        then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_password_length is null then 'No password policy set.'
        when
          minimum_password_length >= 14
          and password_reuse_prevention >= 24
          and require_lowercase_characters = 'true'
          and require_uppercase_characters = 'true'
          and require_numbers = 'true'
          and require_symbols = 'true'
          and max_password_age <= 90
        then 'Strong password policies configured.'
        else 'Password policy ' ||
          concat_ws(', ',
            case when minimum_password_length < 14 then ('minimum password length set to ' || minimum_password_length) end,
            case when password_reuse_prevention < 24 then ('password reuse prevention set to ' || password_reuse_prevention) end,
            case when not (require_lowercase_characters = 'true') then 'lowercase characters not required' end,
            case when not (require_uppercase_characters = 'true') then 'uppercase characters not required' end,
            case when not (require_numbers) then 'numbers not required' end,
            case when not (require_symbols) then 'symbols not required' end,
            case when max_password_age > 90 then ('max password age set to ' || max_password_age) end
          ) || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
  EOQ
}

query "iam_group_not_empty" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when users is null then 'alarm'
        else 'ok'
      end as status,
      case
        when users is null then title || ' not associated with any IAM user.'
        else title || ' associated with IAM user.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_group;
  EOQ
}

query "iam_policy_no_star_star" {
  sql = <<-EOQ
    with bad_policies as (
      select
        arn,
        count(*) as num_bad_statements
      from
        aws_iam_policy,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        not is_aws_managed
        and s ->> 'Effect' = 'Allow'
        and resource = '*'
        and (
          (action = '*'
          or action = '*:*'
          )
        )
      group by
        arn
    )
    select
      p.arn as resource,
      case
        when bad.arn is null then 'ok'
        else 'alarm'
      end status,
      p.name || ' contains ' || coalesce(bad.num_bad_statements,0)  ||
        ' statements that allow action "*" on resource "*".' as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      aws_iam_policy as p
      left join bad_policies as bad on p.arn = bad.arn
    where
      not p.is_aws_managed;
  EOQ
}

query "iam_root_user_no_access_keys" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':::' || account_id as resource,
      case
        when account_access_keys_present > 0 then 'alarm'
        else 'ok'
      end status,
      case
        when account_access_keys_present > 0 then 'Root user access keys exist.'
        else 'No root user access keys exist.'
      end reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_account_summary;
  EOQ
}

query "iam_root_user_hardware_mfa_enabled" {
  sql = <<-EOQ
    select
      'arn:' || s.partition || ':::' || s.account_id as resource,
      case
        when s.account_mfa_enabled and d.serial_number is null then 'ok'
        else 'alarm'
      end status,
      case
        when s.account_mfa_enabled = false then  'MFA not enabled for root account.'
        when d.serial_number is not null then 'MFA enabled for root account, but the MFA associated is a virtual device.'
        else 'Hardware MFA device enabled for root account.'
      end reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "s.")}
    from
      aws_iam_account_summary as s
      left join aws_iam_virtual_mfa_device as d on (d.user ->> 'Arn') = 'arn:' || s.partition || ':iam::' || s.account_id || ':root';
  EOQ
}

query "iam_root_user_mfa_enabled" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':::' || account_id as resource,
      case
        when account_mfa_enabled then 'ok'
        else 'alarm'
      end status,
      case
        when account_mfa_enabled then 'MFA enabled for root account.'
        else 'MFA not enabled for root account.'
      end reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_account_summary;
  EOQ
}

query "iam_root_user_account_console_access_mfa_enabled" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':::' || account_id as resource,
      case
        when account_password_present and not account_mfa_enabled then 'alarm'
        else 'ok'
      end as status,
      case
        when not account_password_present then 'Console sign-in disabled for root account.'
        when account_password_present and not account_mfa_enabled then 'Console sign-in enabled for root account but no MFA device configured.'
        else 'Console sign-in enabled for root account and MFA device configured.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_account_summary;
  EOQ
}

query "iam_user_access_key_age_90" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':iam::' || account_id || ':user/' || user_name || '/accesskey/' || access_key_id as resource,
      case
        when status <> 'Active' then 'skip'
        when create_date <= (current_date - interval '90' day) then 'alarm'
        else 'ok'
      end status,
      case
        when status <> 'Active' then user_name || ' ' || access_key_id || ' status is ' || status || '.'
        else user_name || ' ' || access_key_id || ' created ' || to_char(create_date , 'DD-Mon-YYYY') ||
        ' (' || extract(day from current_timestamp - create_date) || ' days).'
      end reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_access_key;
  EOQ
}

query "iam_user_console_access_mfa_enabled" {
  sql = <<-EOQ
    select
      user_arn as resource,
      case
        when password_enabled and not mfa_active then 'alarm'
        else 'ok'
      end as status,
      case
        when not password_enabled then user_name || ' password login disabled.'
        when password_enabled and not mfa_active then user_name || ' password login enabled but no MFA device configured.'
        else user_name || ' password login enabled and MFA device configured.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_credential_report;
  EOQ
}

query "iam_user_mfa_enabled" {
  sql = <<-EOQ
    select
      user_arn as resource,
      case
        when not mfa_active then 'alarm'
        else 'ok'
      end as status,
      case
        when not mfa_active then user_name || ' MFA device not configured.'
        else user_name || ' MFA device configured.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_credential_report;
  EOQ
}

query "iam_user_no_inline_attached_policies" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when inline_policies is null and attached_policy_arns is null then 'ok'
        else 'alarm'
      end status,
      name || ' has ' || coalesce(jsonb_array_length(inline_policies),0) || ' inline and ' ||
        coalesce(jsonb_array_length(attached_policy_arns),0) || ' directly attached policies.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_iam_user;
  EOQ
}

query "iam_user_unused_credentials_90" {
  sql = <<-EOQ
    select
      user_arn as resource,
      case
        when user_name = '<root_account>'
          then 'info'
        when password_enabled and password_last_used is null and password_last_changed < (current_date - interval '90' day)
          then 'alarm'
        when password_enabled and password_last_used  < (current_date - interval '90' day)
          then 'alarm'
        when access_key_1_active and access_key_1_last_used_date is null and access_key_1_last_rotated < (current_date - interval '90' day)
          then 'alarm'
        when access_key_1_active and access_key_1_last_used_date  < (current_date - interval '90' day)
          then 'alarm'
        when access_key_2_active and access_key_2_last_used_date is null and access_key_2_last_rotated < (current_date - interval '90' day)
          then 'alarm'
        when access_key_2_active and access_key_2_last_used_date  < (current_date - interval '90' day)
          then 'alarm'
        else 'ok'
      end status,
      user_name ||
        case
          when not password_enabled
            then ' password not enabled,'
          when password_enabled and password_last_used is null
            then ' password created ' || to_char(password_last_changed, 'DD-Mon-YYYY') || ' never used,'
          else
            ' password used ' || to_char(password_last_used, 'DD-Mon-YYYY') || ','
        end ||
        case
          when not access_key_1_active
            then ' key 1 not enabled,'
          when access_key_1_active and access_key_1_last_used_date is null
            then ' key 1 created ' || to_char(access_key_1_last_rotated, 'DD-Mon-YYYY') || ' never used,'
          else
            ' key 1 used ' || to_char(access_key_1_last_used_date, 'DD-Mon-YYYY') || ','
        end ||
          case
          when not access_key_2_active
            then ' key 2 not enabled.'
          when access_key_2_active and access_key_2_last_used_date is null
            then ' key 2 created ' || to_char(access_key_2_last_rotated, 'DD-Mon-YYYY') || ' never used.'
          else
            ' key 2 used ' || to_char(access_key_2_last_used_date, 'DD-Mon-YYYY') || '.'
        end
      as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_credential_report;
  EOQ
}

query "iam_user_in_group" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when jsonb_array_length(groups) = 0 then 'alarm'
        else 'ok'
      end as status,
      case
        when jsonb_array_length(groups) = 0 then title || ' not associated with any IAM group.'
        else title || ' associated with IAM group.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_iam_user;
  EOQ
}

query "iam_group_user_role_no_inline_policies" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when inline_policies is null then 'ok'
        else 'alarm'
      end status,
      'User ' || title || ' has ' || coalesce(jsonb_array_length(inline_policies), 0) || ' inline policies.' as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_user
    union
    select
      arn as resource,
      case
        when inline_policies is null then 'ok'
        else 'alarm'
      end status,
      'Role ' || title || ' has ' || coalesce(jsonb_array_length(inline_policies), 0) || ' inline policies.' as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_role
    where
      arn not like '%service-role/%'
    union
    select
      arn as resource,
      case
        when inline_policies is null then 'ok'
        else 'alarm'
      end status,
      'Group ' || title || ' has ' || coalesce(jsonb_array_length(inline_policies), 0) || ' inline policies.' as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_group;
  EOQ
}

query "iam_support_role" {
  sql = <<-EOQ
    -- pgFormatter-ignore
    with support_role_count as
    (
      select
        'arn:' || a.partition || ':::' || a.account_id as resource,
        count(policy_arn),
        a.account_id,
        a._ctx
      from
        aws_account as a
        left join aws_iam_role as r on r.account_id = a.account_id
        left join jsonb_array_elements_text(attached_policy_arns) as policy_arn  on true
      where
        split_part(policy_arn, '/', 2) = 'AWSSupportAccess'
        or policy_arn is null
      group by
        a.account_id,
        a.partition,
        a._ctx
    )
    select
      resource,
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count = 1 then 'AWSSupportAccess policy attached to 1 role.'
        when count > 1 then 'AWSSupportAccess policy attached to ' || count || ' roles.'
        else 'AWSSupportAccess policy not attached to any role.'
      end  as reason
      ${local.common_dimensions_global_sql}
    from
      support_role_count;
  EOQ
}

query "iam_account_password_policy_min_length_14" {
  sql = <<-EOQ
    select
      'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when minimum_password_length >= 14 then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_password_length is null then 'No password policy set.'
        else 'Minimum password length set to ' || minimum_password_length || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
  EOQ
}

query "iam_account_password_policy_reuse_24" {
  sql = <<-EOQ
    select
      'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when password_reuse_prevention >= 24 then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_password_length is null then 'No password policy set.'
        when password_reuse_prevention is null then 'Password reuse prevention not set.'
        else 'Password reuse prevention set to ' || password_reuse_prevention || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
  EOQ
}

query "iam_account_password_policy_one_lowercase_letter" {
  sql = <<-EOQ
    select
      'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when require_lowercase_characters then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_password_length is null then 'No password policy set.'
        when require_lowercase_characters then 'Lowercase character required.'
        else 'Lowercase character not required.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
  EOQ
}

query "iam_account_password_policy_one_uppercase_letter" {
  sql = <<-EOQ
    select
      'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when require_uppercase_characters then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_password_length is null then 'No password policy set.'
        when require_uppercase_characters then 'Uppercase character required.'
        else 'Uppercase character not required.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
  EOQ
}

query "iam_account_password_policy_one_number" {
  sql = <<-EOQ
    select
      'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when require_numbers then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_password_length is null then 'No password policy set.'
        when require_numbers then 'Number required.'
        else 'Number not required.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
  EOQ
}

query "iam_password_policy_expire_90" {
  sql = <<-EOQ
    select
      'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when max_password_age <= 90 then 'ok'
        else 'alarm'
      end as status,
      case
        when max_password_age is null then 'Password expiration not set.'
        else 'Password expiration set to ' || max_password_age || ' days.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
  EOQ
}

query "iam_account_password_policy_one_symbol" {
  sql = <<-EOQ
    select
      'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when require_symbols then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_password_length is null then 'No password policy set.'
        when require_symbols then 'Symbol required.'
        else 'Symbol not required.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
  EOQ
}

query "iam_all_policy_no_service_wild_card" {
  sql = <<-EOQ
    with wildcard_action_policies as (
      select
        arn,
        count(*) as statements_num
      from
        aws_iam_policy,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        not is_aws_managed
        and s ->> 'Effect' = 'Allow'
        and resource = '*'
        and (
          action like '%:*'
          or action = '*'
        )
      group by
        arn
    )
    select
      p.arn as resource,
      case
        when w.arn is null then 'ok'
        else 'alarm'
      end status,
      p.name || ' contains ' || coalesce(w.statements_num,0)  ||
        ' statements that allow action "*" on at least 1 AWS service on resource "*".' as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      aws_iam_policy as p
      left join wildcard_action_policies as w on p.arn = w.arn
    where
      not p.is_aws_managed;
  EOQ
}

query "iam_policy_custom_no_blocked_kms_actions" {
  sql = <<-EOQ
    with kms_blocked_actions as (
      select
        arn,
        count(*) as statements_num
      from
        aws_iam_policy,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        not is_aws_managed
        and s ->> 'Effect' = 'Allow'
        and action like any(array['kms:decrypt', 'kms:reencryptfrom'])
      group by
        arn
    )
    select
      p.arn as resource,
      case
        when w.arn is null then 'ok'
        else 'alarm'
      end status,
      p.name || ' contains ' || coalesce(w.statements_num,0)  || ' statements that allow blocked actions on AWS KMS keys.' as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      aws_iam_policy as p
      left join kms_blocked_actions as w on p.arn = w.arn
    where
      not p.is_aws_managed;
  EOQ
}

query "iam_policy_inline_no_blocked_kms_actions" {
  sql = <<-EOQ
    with iam_resource_types as (
      select
        arn,
        inline_policies_std,
        name,
        account_id,
        region,
        _ctx
      from
        aws_iam_user
      union
      select
        arn,
        inline_policies_std,
        name,
        account_id,
        region,
        _ctx
      from
        aws_iam_role
      union
      select
        arn,
        inline_policies_std,
        name,
        account_id,
        region,
        _ctx
      from
        aws_iam_group
    ),
    kms_blocked_actions as (
      select
        arn,
        count(*) as statements_num
      from
        iam_resource_types,
        jsonb_array_elements(inline_policies_std) as policy_std,
        jsonb_array_elements(policy_std -> 'PolicyDocument' -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        s ->> 'Effect' = 'Allow'
        and action like any(array['kms:decrypt','kms:decrypt*', 'kms:reencryptfrom', 'kms:*', 'kms:reencrypt*'])
      group by
        arn
    )
    select
      u.arn as resource,
      case
        when w.arn is null then 'ok'
        else 'alarm'
      end status,
      u.name || ' contains ' || coalesce(w.statements_num,0)  || ' inline policy statement(s) that allow blocked actions on AWS KMS keys.' as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "u.")}
    from
      iam_resource_types as u
      left join kms_blocked_actions as w on u.arn = w.arn;
  EOQ
}

query "iam_policy_custom_no_assume_role" {
  sql = <<-EOQ
    with filter_users as (
      select
        user_id,
        name,
        policies
      from
        aws_iam_user,
        jsonb_array_elements_text(inline_policies) as policies
      where
        policies like '%AssumeRole%'
    )
    select
      u.arn as resource,
      case
        when fu.user_id is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when fu.user_id is not null then u.name || ' custom policies allow STS Role assumption.'
        else u.name || ' custom policies does not allow STS Role assumption.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "u.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "u.")}
    from
      aws_iam_user as u
      left join filter_users as fu on u.user_id = fu.user_id
    order by
    u.name;
  EOQ
}

query "iam_user_hardware_mfa_enabled" {
  sql = <<-EOQ
    select
      u.arn as resource,
      case
        when serial_number is null then 'alarm'
        when serial_number like any(array['%mfa%','%sms-mfa%']) then 'info'
        else 'ok'
      end as status,
      case
        when serial_number is null then u.name || ' MFA hardware device not configured.'
        when serial_number like any(array['%mfa%','%sms-mfa%']) then u.name || ' MFA enabled, but the MFA associated is a virtual device.'
        else u.name || ' hardware MFA device enabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "u.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "u.")}
    from
      aws_iam_virtual_mfa_device as m
      right join aws_iam_user as u on m.user_id = u.user_id;
  EOQ
}

query "iam_user_with_administrator_access_mfa_enabled" {
  sql = <<-EOQ
    with admin_users as (
      select
        user_id,
        name,
        attachments
      from
        aws_iam_user,
        jsonb_array_elements_text(attached_policy_arns) as attachments
      where
        split_part(attachments, '/', 2) = 'AdministratorAccess'
    )
    select
      u.arn as resource,
      case
        when au.user_id is null then 'skip'
        when au.user_id is not null and u.mfa_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when au.user_id is null then u.name || ' does not have administrator access.'
        when au.user_id is not null and u.mfa_enabled then u.name || ' has MFA token enabled.'
        else u.name || ' has MFA token disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "u.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "u.")}
    from
      aws_iam_user as u
      left join admin_users au on u.user_id = au.user_id
    order by
      u.name;
  EOQ
}

query "iam_managed_policy_attached_to_role" {
  sql = <<-EOQ
    with role_attached_policies as (
      select
        jsonb_array_elements_text(attached_policy_arns) as policy_arn
      from
        aws_iam_role
    )
    select
      arn as resource,
      case
        when arn in (select policy_arn from role_attached_policies) then 'ok'
        else 'alarm'
      end as status,
      case
        when arn in (select policy_arn from role_attached_policies) then title || ' attached to IAM role.'
        else title || ' not attached to IAM role.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_iam_policy
    where
      is_aws_managed;
  EOQ
}

query "iam_custom_managed_policy_attached_to_role" {
  sql = <<-EOQ
    with role_attached_policies as (
      select
        jsonb_array_elements_text(attached_policy_arns) as policy_arn
      from
        aws_iam_role
    )
    select
      arn as resource,
      case
        when arn in (select policy_arn from role_attached_policies) then 'ok'
        else 'alarm'
      end as status,
      case
        when arn in (select policy_arn from role_attached_policies) then title || ' attached to IAM role.'
        else title || ' not attached to IAM role.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_iam_policy
    where
      not is_aws_managed;
  EOQ
}

query "iam_policy_unused" {
  sql = <<-EOQ
    with in_use_policies as (
      select
        attached_policy_arns
      from
        aws_iam_user
      union
      select
        attached_policy_arns
      from
        aws_iam_group
      where
        jsonb_array_length(users) > 0
      union
      select
        attached_policy_arns
      from
        aws_iam_role
    )
    select
      arn as resource,
      case
        when arn in (select jsonb_array_elements_text(attached_policy_arns) from in_use_policies) then 'ok'
        else 'alarm'
      end as status,
      case
        when arn in (select jsonb_array_elements_text(attached_policy_arns) from in_use_policies) then title || ' in use.'
        else title || ' not in use.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_iam_policy;
  EOQ
}

query "iam_custom_policy_unused" {
  sql = <<-EOQ
    with in_use_policies as (
      select
        attached_policy_arns
      from
        aws_iam_user
      union
      select
        attached_policy_arns
      from
        aws_iam_group
      where
        jsonb_array_length(users) > 0
      union
      select
        attached_policy_arns
      from
        aws_iam_role
    )
    select
      arn as resource,
      case
        when arn in (select jsonb_array_elements_text(attached_policy_arns) from in_use_policies) then 'ok'
        else 'alarm'
      end as status,
      case
        when arn in (select jsonb_array_elements_text(attached_policy_arns) from in_use_policies) then title || ' in use.'
        else title || ' not in use.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_iam_policy
    where
      not is_aws_managed;
  EOQ
}

query "iam_access_analyzer_enabled_without_findings" {
  sql = <<-EOQ
    with accessanalyzer_findings as (
      select
        a.status as status,
        f.access_analyzer_arn as arn,
        a.region,
        a.account_id,
        a.tags,
        a.name,
        count(*)
      from
        aws_accessanalyzer_analyzer as a
        left join aws_accessanalyzer_finding as f on f.access_analyzer_arn = a.arn
      group by
        f.access_analyzer_arn,
        a.status,
        a.region,
        a.account_id,
        a.tags,
        a.name
    )
    select
      f.arn as resource,
      case
        -- Skip any regions that are disabled in the account.
        when r.steampipe_available = false then 'skip'
        when r.opt_in_status = 'not-opted-in' then 'skip'
        when f.status = 'ACTIVE' and f.arn is null then 'ok'
        when f.status = 'ACTIVE' and f.arn is not null then 'alarm'
        when f.status = 'NOT_AVAILABLE' then 'alarm'
        else 'alarm'
      end as status,
      case
        when r.steampipe_available = false then r.region || ' is not available in the current connection configuration.'
        when r.opt_in_status = 'not-opted-in' then r.region || ' region is disabled.'
        when f.status = 'ACTIVE' and f.arn is null then f.name || ' does not have active findings in region ' || r.region || '.'
        when f.status = 'ACTIVE' and f.arn is not null then f.name || ' has active findings in region ' || r.region || '.'
        when f.status = 'NOT_AVAILABLE' then f.name || ' is not enabled in region ' || r.region || '.'
        else 'IAM Access Analyzer is not active in region ' || r.region || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join accessanalyzer_findings as f on f.region = r.region and f.account_id = r.account_id;
  EOQ
}

query "iam_custom_policy_unattached_no_star_star" {
  sql = <<-EOQ
    with bad_policies as (
      select
        arn,
        count(*) as num_bad_statements
      from
        aws_iam_policy,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        not is_aws_managed
        and not is_attached
        and s ->> 'Effect' = 'Allow'
        and resource = '*'
        and (
          (action = '*'
          or action = '*:*'
          )
        )
      group by
        arn
    )
    select
      p.arn as resource,
      case
        when bad.arn is null then 'ok'
        else 'alarm'
      end status,
      p.name || ' contains ' || coalesce(bad.num_bad_statements, 0) ||
        ' statements that allow action "*" on resource "*".' as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      aws_iam_policy as p
      left join bad_policies as bad on p.arn = bad.arn
    where
      not p.is_aws_managed
      and not is_attached;
  EOQ
}

query "iam_policy_no_full_access_to_cloudtrail" {
  sql = <<-EOQ
    with cloudtrail_full_access_policies as (
      select
        arn,
        count(*) as statements_num
      from
        aws_iam_policy,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        not is_aws_managed
        and s ->> 'Effect' = 'Allow'
        and resource = '*'
        and action = 'cloudtrail:*'
      group by
        arn
    )
    select
      p.arn as resource,
      case
        when w.arn is null then 'ok'
        else 'alarm'
      end status,
      p.name || ' contains ' || coalesce(w.statements_num,0) ||
        ' statements that allow action "*" on at cloudtrail service on resource "*".' as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      aws_iam_policy as p
      left join cloudtrail_full_access_policies as w on p.arn = w.arn
    where
      not p.is_aws_managed;
  EOQ
}

query "iam_policy_no_full_access_to_kms" {
  sql = <<-EOQ
   with kms_full_access_policies as (
    select
      arn,
      count(*) as statements_num
    from
      aws_iam_policy,
      jsonb_array_elements(policy_std -> 'Statement') as s,
      jsonb_array_elements_text(s -> 'Resource') as resource,
      jsonb_array_elements_text(s -> 'Action') as action
    where
      not is_aws_managed
      and s ->> 'Effect' = 'Allow'
      and resource = '*'
      and action = 'kms:*'
    group by
      arn
  )
  select
    p.arn as resource,
    case
      when w.arn is null then 'ok'
      else 'alarm'
    end status,
    p.name || ' contains ' || coalesce(w.statements_num,0) ||
      ' statements that allow action "*" on at cloudtrail service on resource "*".' as reason
    ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
    ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
  from
    aws_iam_policy as p
    left join kms_full_access_policies as w on p.arn = w.arn
  where
    not p.is_aws_managed;
  EOQ
}

query "iam_access_analyzer_enabled" {
  sql = <<-EOQ
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        -- Skip any regions that are disabled in the account.
        when r.opt_in_status = 'not-opted-in' then 'skip'
        when aa.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when r.opt_in_status = 'not-opted-in' then r.region || ' region is disabled.'
        when aa.arn is not null then aa.name ||  ' enabled in ' || r.region || '.'
        else 'Access Analyzer not enabled in ' || r.region || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
    from
      aws_region as r
      left join aws_accessanalyzer_analyzer as aa on r.account_id = aa.account_id and r.region = aa.region;
  EOQ
}

query "iam_account_password_policy_strong_min_length_8" {
  sql = <<-EOQ
    select
      'arn:' || a.partition || ':::' || a.account_id as resource,
      case
        when
          minimum_password_length >= 8
          and require_lowercase_characters = 'true'
          and require_uppercase_characters = 'true'
          and require_numbers = 'true'
          and require_symbols = 'true'
        then 'ok'
        else 'alarm'
      end as status,
      case
        when minimum_password_length is null then 'No password policy set.'
        when
          minimum_password_length >= 8
          and require_lowercase_characters = 'true'
          and require_uppercase_characters = 'true'
          and require_numbers = 'true'
          and require_symbols = 'true'
        then 'Strong password policies configured.'
        else 'Password policy ' ||
          concat_ws(', ',
            case when minimum_password_length < 8 then ('minimum password length set to ' || minimum_password_length) end,
            case when not (require_lowercase_characters = 'true') then 'lowercase characters not required' end,
            case when not (require_uppercase_characters = 'true') then 'uppercase characters not required' end,
            case when not (require_numbers) then 'numbers not required' end,
            case when not (require_symbols) then 'symbols not required' end
          ) || '.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      aws_account as a
      left join aws_iam_account_password_policy as pol on a.account_id = pol.account_id;
  EOQ
}

query "iam_policy_all_attached_no_star_star" {
  sql = <<-EOQ
    with star_access_policies as (
      select
        arn,
        is_aws_managed,
        count(*) as num_bad_statements
      from
        aws_iam_policy,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        s ->> 'Effect' = 'Allow'
        and resource = '*'
        and (
          (action = '*'
          or action = '*:*'
          )
        )
        and is_attached
      group by
        arn,
        is_aws_managed
    )
    select
      p.arn as resource,
      case
        when s.arn is not null and s.is_aws_managed then 'info'
        when s.arn is null then 'ok'
        else 'alarm'
      end status,
      case
        when s.arn is not null and s.is_aws_managed then p.name || ' is an AWS managed policy with ' || coalesce(s.num_bad_statements, 0) || ' statements that allow action "*" on resource "*".'
        else p.name || ' contains ' || coalesce(s.num_bad_statements, 0) || ' statements that allow action "*" on resource "*".'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      aws_iam_policy as p
      left join star_access_policies as s on p.arn = s.arn
    where
      p.is_attached;
  EOQ
}

query "iam_policy_custom_attached_no_star_star" {
  sql = <<-EOQ
    -- This query checks the customer managed policies having * access and attached to IAM resource(s)
    with star_access_policies as (
      select
        arn,
        count(*) as num_bad_statements
      from
        aws_iam_policy,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        not is_aws_managed
        and s ->> 'Effect' = 'Allow'
        and resource = '*'
        and (
          (action = '*'
          or action = '*:*'
          )
        )
        and is_attached
      group by arn
    )
    select
      p.arn as resource,
      case
        when s.arn is null then 'ok'
        else 'alarm'
      end status,
      p.name || ' contains ' || coalesce(s.num_bad_statements,0)  || ' statements that allow action "*" on resource "*".' as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      aws_iam_policy as p
      left join star_access_policies as s on p.arn = s.arn
    where
      not p.is_aws_managed;
  EOQ
}

query "iam_root_last_used" {
  sql = <<-EOQ
    select
      user_arn as resource,
      case
        when password_last_used >= (current_date - interval '90' day) then 'alarm'
        when access_key_1_last_used_date <= (current_date - interval '90' day)  then 'alarm'
        when access_key_2_last_used_date <= (current_date - interval '90' day)  then 'alarm'
        else 'ok'
      end as status,
      case
        when password_last_used is null then 'Root never logged in with password.'
        else 'Root password used ' || to_char(password_last_used , 'DD-Mon-YYYY') || ' (' || extract(day from current_timestamp - password_last_used) || ' days).'
      end ||
      case
        when access_key_1_last_used_date is null then ' Access Key 1 never used.'
        else ' Access Key 1 used ' || to_char(access_key_1_last_used_date , 'DD-Mon-YYYY') || ' (' || extract(day from current_timestamp - access_key_1_last_used_date) || ' days).'
      end ||
        case
        when access_key_2_last_used_date is null then ' Access Key 2 never used.'
        else ' Access Key 2 used ' || to_char(access_key_2_last_used_date , 'DD-Mon-YYYY') || ' (' || extract(day from current_timestamp - access_key_2_last_used_date) || ' days).'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_credential_report
    where
      user_name = '<root_account>';
  EOQ
}

query "iam_server_certificate_not_expired" {
  sql = <<-EOQ
    select
      arn as resource,
      case when expiration < (current_date - interval '1' second) then 'alarm'
      else 'ok'
      end as status,
      case when expiration < (current_date - interval '1' second) then
        name || ' expired ' || to_char(expiration, 'DD-Mon-YYYY') || '.'
      else
        name || ' valid until ' || to_char(expiration, 'DD-Mon-YYYY')  || '.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_iam_server_certificate;
  EOQ
}

query "iam_user_access_keys_and_password_at_setup" {
  sql = <<-EOQ
    select
      user_arn as resource,
      case
        -- alarm when password is enabled and the key was created within 10 seconds of the user
        when password_enabled and (extract(epoch from (access_key_1_last_rotated - user_creation_time)) < 10) then 'alarm'
        else 'ok'
      end as status,
      case
        when not password_enabled then user_name || ' password login disabled.'
        when access_key_1_last_rotated is null then user_name || ' has no access keys.'
        when password_enabled and (extract(epoch from (access_key_1_last_rotated - user_creation_time)) < 10)
          then user_name || ' has access key created during user creation and password login enabled.'
        else user_name || ' has access key not created during user creation.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_credential_report;
  EOQ
}

query "iam_user_no_policies" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when attached_policy_arns is null then 'ok'
        else 'alarm'
      end status,
      name || ' has ' || coalesce(jsonb_array_length(attached_policy_arns),0) || ' attached policies.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_global_sql}
    from
      aws_iam_user;
  EOQ
}

query "iam_user_one_active_key" {
  sql = <<-EOQ
    select
      u.arn as resource,
      case
        when count(distinct k.access_key_id) > 1 then 'alarm'
        else 'ok'
      end as status,
      u.arn || ' has ' || count(distinct k.access_key_id) || ' active access key(s).' as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "u.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "u.")}
    from
      aws_iam_user as u
      left join aws_iam_access_key as k
        on k.akas::text like '%' || u.arn || '%'  -- convert jsonb to text and check if arn exists
    where
      k.status = 'Active'
      or k.status is null
    group by
      u.arn, u.account_id, u.tags, u._ctx;
  EOQ
}

query "iam_user_unused_credentials_45" {
  sql = <<-EOQ
    select
      user_arn as resource,
      case
        --root_account will have always password associated even though AWS credential report returns 'not_supported' for password_enabled
        when user_name = '<root_account>'
          then 'info'
        when password_enabled and password_last_used is null and password_last_changed < (current_date - interval '45' day)
          then 'alarm'
        when password_enabled and password_last_used  < (current_date - interval '45' day)
          then 'alarm'
        when access_key_1_active and access_key_1_last_used_date is null and access_key_1_last_rotated < (current_date - interval '45' day)
          then 'alarm'
        when access_key_1_active and access_key_1_last_used_date  < (current_date - interval '45' day)
          then 'alarm'
        when access_key_2_active and access_key_2_last_used_date is null and access_key_2_last_rotated < (current_date - interval '45' day)
          then 'alarm'
        when access_key_2_active and access_key_2_last_used_date  < (current_date - interval '45' day)
          then 'alarm'
        else 'ok'
      end status,
      user_name ||
        case
          when not password_enabled
            then ' password not enabled,'
          when password_enabled and password_last_used is null
            then ' password created ' || to_char(password_last_changed, 'DD-Mon-YYYY') || ' never used,'
          else
            ' password used ' || to_char(password_last_used, 'DD-Mon-YYYY') || ','
        end ||
        case
          when not access_key_1_active
            then ' key 1 not enabled,'
          when access_key_1_active and access_key_1_last_used_date is null
            then ' key 1 created ' || to_char(access_key_1_last_rotated, 'DD-Mon-YYYY') || ' never used,'
          else
            ' key 1 used ' || to_char(access_key_1_last_used_date, 'DD-Mon-YYYY') || ','
        end ||
          case
          when not access_key_2_active
            then ' key 2 not enabled.'
          when access_key_2_active and access_key_2_last_used_date is null
            then ' key 2 created ' || to_char(access_key_2_last_rotated, 'DD-Mon-YYYY') || ' never used.'
          else
            ' key 2 used ' || to_char(access_key_2_last_used_date, 'DD-Mon-YYYY') || '.'
        end
      as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_credential_report;
  EOQ
}

query "iam_role_unused_60" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when role_last_used_date <= (current_date - interval '60' day) or role_last_used_date is null
          then 'alarm'
        else 'ok'
      end as status,
      case
        when role_last_used_date is null
          then name || ' was never used.'
        else
          name || ' was last used ' || to_char(role_last_used_date , 'DD-Mon-YYYY') || ' (' || extract(day from current_date - role_last_used_date) || ' days ago).'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_role;
  EOQ
}

query "iam_user_group_role_cloudshell_fullaccess_restricted" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when attached_policy_arns @> '["arn:aws:iam::aws:policy/AWSCloudShellFullAccess"]' then 'alarm'
        else 'ok'
      end status,
      case
        when attached_policy_arns @> '["arn:aws:iam::aws:policy/AWSCloudShellFullAccess"]' then  'User ' || title || ' has access to AWSCloudShellFullAccess.'
        else 'User ' || title || ' access to AWSCloudShellFullAccess is restricted.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_user
    union
    select
      arn as resource,
      case
        when attached_policy_arns @> '["arn:aws:iam::aws:policy/AWSCloudShellFullAccess"]' then 'alarm'
        else 'ok'
      end status,
      case
        when attached_policy_arns @> '["arn:aws:iam::aws:policy/AWSCloudShellFullAccess"]' then  'Role ' || title || ' has access to AWSCloudShellFullAccess.'
        else 'Role ' || title || ' access to AWSCloudShellFullAccess is restricted.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_role
    union
    select
      arn as resource,
      case
        when attached_policy_arns @> '["arn:aws:iam::aws:policy/AWSCloudShellFullAccess"]' then 'alarm'
        else 'ok'
      end status,
      case
        when attached_policy_arns @> '["arn:aws:iam::aws:policy/AWSCloudShellFullAccess"]' then  'Group ' || title || ' has access to AWSCloudShellFullAccess.'
        else 'Group ' || title || ' access to AWSCloudShellFullAccess is restricted.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_group;
  EOQ
}

query "iam_role_cross_account_read_only_access_policy" {
  sql = <<-EOQ
    with read_only_access_roles as (
      select
        *
      from
        aws_iam_role,
        jsonb_array_elements_text(attached_policy_arns) as a
      where
        a = 'arn:aws:iam::aws:policy/ReadOnlyAccess'
    ), read_only_access_roles_with_cross_account_access as (
      select
        arn
      from
        read_only_access_roles,
        jsonb_array_elements(assume_role_policy_std -> 'Statement') as stmt,
        jsonb_array_elements_text( stmt -> 'Principal' -> 'AWS' ) as p
      where
        stmt ->> 'Effect' = 'Allow'
        and (
          p = '*'
          or not (p like '%' || account_id || '%')
        )
    )
    select
      r.arn as resource,
      case
        when ar.arn is null then 'skip'
        when c.arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when ar.arn is null then r.title || ' not associated with ReadOnlyAccess policy.'
        when c.arn is not null then r.title || ' associated with ReadOnlyAccess cross account access.'
        else r.title || ' associated ReadOnlyAccess without cross account access.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "r.")}
    from
      aws_iam_role as r
      left join read_only_access_roles as ar on r.arn = ar.arn
      left join read_only_access_roles_with_cross_account_access as c on c.arn = r.arn;
  EOQ
}

query "iam_security_audit_role" {
  sql = <<-EOQ
    with security_audit_role_count as(
      select
        'arn:' || a.partition || ':::' || a.account_id as resource,
        count(policy_arn),
        a.account_id,
        a._ctx
      from
        aws_account as a
        left join aws_iam_role as r on r.account_id = a.account_id
        left join jsonb_array_elements_text(attached_policy_arns) as policy_arn on true
      where
        policy_arn = 'arn:aws:iam::aws:policy/SecurityAudit'
      group by
        a.account_id,
        a.partition,
        a._ctx
    )
    select
      resource,
      case
        when count > 0 then 'ok'
        else 'alarm'
      end as status,
      case
        when count = 1 then 'SecurityAudit policy attached to 1 role.'
        when count > 1 then 'SecurityAudit policy attached to ' || count || ' roles.'
        else 'SecurityAudit policy not attached to any role.'
      end as reason
      ${local.common_dimensions_global_sql}
    from
      security_audit_role_count;
  EOQ
}

query "iam_policy_custom_no_permissive_role_assumption" {
  sql = <<-EOQ
    with bad_policies as (
      select
        arn,
        count(*) as num
      from
        aws_iam_policy,
        jsonb_array_elements(policy_std -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        not is_aws_managed
        and s ->> 'Effect' = 'Allow'
        and resource = '*'
        and (
          ( action = '*'
            or action = 'sts:*'
            or action = 'sts:AssumeRole'
          )
        )
      group by
        arn
    )
    select
      p.arn as resource,
      case
        when b.arn is not null then 'alarm'
        else 'ok'
      end as status,
      p.name || ' contains ' || coalesce(b.num, 0) ||
          ' statements that allow overly permissive STS role assumption.' as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "p.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      aws_iam_policy as p
      left join bad_policies as b on p.arn = b.arn
    where
        not is_aws_managed;
  EOQ
}

query "iam_inline_policy_no_administrative_privileges" {
  sql = <<-EOQ
    with full_administrative_privilege_policies as (
      select
        arn,
        inline_policies_std,
        name,
        account_id,
        region,
        _ctx,
        'iam_user' as type
      from
        aws_iam_user
      union
      select
        arn,
        inline_policies_std,
        name,
        account_id,
        region,
        _ctx,
        'iam_role' as type
      from
        aws_iam_role
      union
      select
        arn,
        inline_policies_std,
        name,
        account_id,
        region,
        _ctx,
        'iam_group' as type
      from
        aws_iam_group
    ),
    bad_policies as (
      select
        arn,
        count(*) as statements_num
      from
        full_administrative_privilege_policies,
        jsonb_array_elements(inline_policies_std) as policy_std,
        jsonb_array_elements(policy_std -> 'PolicyDocument' -> 'Statement') as s,
        jsonb_array_elements_text(s -> 'Resource') as resource,
        jsonb_array_elements_text(s -> 'Action') as action
      where
        s ->> 'Effect' = 'Allow'
        and resource = '*'
        and (
          (action = '*'
          or action = '*:*'
          )
        )
      group by
        arn
    )
    select
      p.arn as resource,
      case
        when bad.arn is null then 'ok'
        else 'alarm'
      end status,
      p.name || ' contains ' || coalesce(bad.statements_num,0)  ||
        ' statements that allow action "*" on resource "*".' as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "p.")}
    from
      full_administrative_privilege_policies as p
      left join bad_policies as bad on p.arn = bad.arn;
  EOQ
}

query "iam_user_console_access_unused_45" {
  sql = <<-EOQ
    select
      user_arn as resource,
      case
        when not password_enabled then 'ok'
        when password_enabled and password_last_used is null then 'alarm'
        when password_enabled and password_last_used < (current_date - interval '45' day) then 'alarm'
        else 'ok'
      end status,
      user_name ||
        case
          when not password_enabled then ' password not enabled.'
          when password_enabled and password_last_used is null then ' password created ' || to_char(password_last_changed, 'DD-Mon-YYYY') || ' never used.'
          else ' password used ' || to_char(password_last_used, 'DD-Mon-YYYY') || '.'
        end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_credential_report;
  EOQ
}

query "iam_user_access_key_unused_45" {
  sql = <<-EOQ
    select
      user_arn as resource,
      case
        when not access_key_1_active then 'ok'
        when access_key_1_active and access_key_1_last_used_date is null then 'alarm'
        when access_key_1_active and access_key_1_last_used_date < (current_date - interval '45' day) then 'alarm'
        when not access_key_2_active then 'ok'
        when access_key_2_active and access_key_2_last_used_date is null then 'alarm'
        when access_key_2_active and access_key_2_last_used_date  < (current_date - interval '45' day) then 'alarm'
        else 'ok'
      end as status,
      user_name ||
        case
          when not access_key_1_active then ' key 1 not enabled,'
          when access_key_1_active and access_key_1_last_used_date is null then ' key 1 created ' || to_char(access_key_1_last_rotated, 'DD-Mon-YYYY') || ' never used,'
          else ' key 1 used ' || to_char(access_key_1_last_used_date, 'DD-Mon-YYYY') || ','
        end ||
        case
          when not access_key_2_active then ' key 2 not enabled.'
          when access_key_2_active and access_key_2_last_used_date is null then ' key 2 created ' || to_char(access_key_2_last_rotated, 'DD-Mon-YYYY') || ' never used.'
          else ' key 2 used ' || to_char(access_key_2_last_used_date, 'DD-Mon-YYYY') || '.'
        end as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_credential_report;
  EOQ
}

query "iam_role_no_administrator_access_policy_attached" {
  sql = <<-EOQ
    with admin_roles as (
      select
        arn,
        name,
        attachments
      from
        aws_iam_role,
        jsonb_array_elements_text(attached_policy_arns) as attachments
      where
        split_part(attachments, '/', 2) = 'AdministratorAccess'
    )
    select
      r.arn as resource,
      case
        when ar.arn is not null then 'alarm'
        else 'ok'
      end as status,
      case
        when ar.arn is not null then r.name || ' have AdministratorAccess policy attached.'
        else r.name || ' does not have AdministratorAccess policy attached.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "r.")}
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "r.")}
    from
      aws_iam_role as r
      left join admin_roles ar on r.arn = ar.arn
    order by
      r.name;
  EOQ
}

query "iam_user_access_key_age_365" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':iam::' || account_id || ':user/' || user_name || '/accesskey/' || access_key_id as resource,
      case
        when create_date <= (current_date - interval '365' day) then 'alarm'
        else 'ok'
      end status,
      user_name || ' ' || access_key_id || ' created ' || to_char(create_date , 'DD-Mon-YYYY') ||
        ' (' || extract(day from current_timestamp - create_date) || ' days).'
      as reason
      ${local.common_dimensions_global_sql}
    from
      aws_iam_access_key;
  EOQ
}

query "iam_role_cross_account_write_access_policy" {
  sql = <<-EOQ
    with cross_account_write_policies as (
      select
        r.arn as role_arn,
        r.account_id,
        r.region,
        p.arn as policy_arn,
        p.policy_std
      from
        aws_iam_role as r
        cross join jsonb_array_elements_text(r.attached_policy_arns) as policy_arn
        join aws_iam_policy as p on p.arn = policy_arn
      where
        p.policy_std -> 'Statement' @> '[{"Effect": "Allow", "Principal": {"AWS": ["*"]}}]'
        or p.policy_std -> 'Statement' @> '[{"Effect": "Allow", "Principal": {"Service": ["*"]}}]'
        and (
          p.policy_std -> 'Statement' @> '[{"Action": ["*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Put*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Delete*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Create*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Update*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Modify*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Attach*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Detach*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Replace*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Tag*"]}]'
          or p.policy_std -> 'Statement' @> '[{"Action": ["*:Untag*"]}]'
        )
    )
    select
      r.arn as resource,
      case
        when c.role_arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when c.role_arn is null then 'Role does not have cross-account write access'
        else 'Role has cross-account write access'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "r.")}
    from
      aws_iam_role as r
      left join cross_account_write_policies as c on r.arn = c.role_arn;
  EOQ
}