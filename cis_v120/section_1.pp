locals {
  cis_v120_1_common_tags = merge(local.cis_v120_common_tags, {
    cis_section_id = "1"
  })
}

benchmark "cis_v120_1" {
  title         = "1 Identity and Access Management"
  documentation = file("./cis_v120/docs/cis_v120_1.md")
  children = [
    control.cis_v120_1_1,
    control.cis_v120_1_2,
    control.cis_v120_1_3,
    control.cis_v120_1_4,
    control.cis_v120_1_5,
    control.cis_v120_1_6,
    control.cis_v120_1_7,
    control.cis_v120_1_8,
    control.cis_v120_1_9,
    control.cis_v120_1_10,
    control.cis_v120_1_11,
    control.cis_v120_1_12,
    control.cis_v120_1_13,
    control.cis_v120_1_14,
    control.cis_v120_1_15,
    control.cis_v120_1_16,
    control.cis_v120_1_17,
    control.cis_v120_1_18,
    control.cis_v120_1_19,
    control.cis_v120_1_20,
    control.cis_v120_1_21,
    control.cis_v120_1_22
  ]

  tags = merge(local.cis_v120_1_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v120_1_1" {
  title         = "1.1 Avoid the use of the \"root\" account"
  description   = "The \"root\" account has unrestricted access to all resources in the AWS account. It is highly recommended that the use of this account be avoided."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_1_1.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.1"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_2" {
  title         = "1.2 Ensure multi-factor authentication (MFA) is enabled for all IAM users that have a console password"
  description   = "Multi-Factor Authentication (MFA) adds an extra layer of protection on top of a user name and password. With MFA enabled, when a user signs in to an AWS website, they will be prompted for their user name and password as well as for an authentication code from their AWS MFA device. It is recommended that MFA be enabled for all accounts that have a console password."
  query         = query.iam_user_console_access_mfa_enabled
  documentation = file("./cis_v120/docs/cis_v120_1_2.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.2"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_3" {
  title         = "1.3 Ensure credentials unused for 90 days or greater are disabled"
  description   = "AWS IAM users can access AWS resources using different types of credentials, such as passwords or access keys. It is recommended that all credentials that have been unused in 90 or greater days be removed or deactivated."
  query         = query.iam_user_unused_credentials_90
  documentation = file("./cis_v120/docs/cis_v120_1_3.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.3"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_4" {
  title         = "1.4 Ensure access keys are rotated every 90 days or less"
  description   = "Access keys consist of an access key ID and secret access key, which are used to sign programmatic requests that you make to AWS. AWS users need their own access keys to make programmatic calls to AWS from the AWS Command Line Interface (AWS CLI), Tools for Windows PowerShell, the AWS SDKs, or direct HTTP calls using the APIs for individual AWS services. It is recommended that all access keys be regularly rotated."
  query         = query.iam_user_access_key_age_90
  documentation = file("./cis_v120/docs/cis_v120_1_4.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.4"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_5" {
  title         = "1.5 Ensure IAM password policy requires at least one uppercase letter"
  description   = "Password policies are, in part, used to enforce password complexity requirements. IAM password policies can be used to ensure password are comprised of different character sets. It is recommended that the password policy require at least one uppercase letter."
  query         = query.iam_account_password_policy_one_uppercase_letter
  documentation = file("./cis_v120/docs/cis_v120_1_5.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.5"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_6" {
  title         = "1.6 Ensure IAM password policy require at least one lowercase letter"
  description   = "Password policies are, in part, used to enforce password complexity requirements. IAM password policies can be used to ensure password are comprised of different character sets. It is recommended that the password policy require at least one lowercase letter."
  query         = query.iam_account_password_policy_one_lowercase_letter
  documentation = file("./cis_v120/docs/cis_v120_1_6.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.6"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_7" {
  title         = "1.7 Ensure IAM password policy require at least one symbol"
  description   = "Password policies are, in part, used to enforce password complexity requirements. IAM password policies can be used to ensure password are comprised of different character sets. It is recommended that the password policy require at least one symbol."
  query         = query.iam_account_password_policy_one_symbol
  documentation = file("./cis_v120/docs/cis_v120_1_7.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.7"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_8" {
  title         = "1.8 Ensure IAM password policy require at least one number"
  description   = "Password policies are, in part, used to enforce password complexity requirements. IAM password policies can be used to ensure password are comprised of different character sets. It is recommended that the password policy require at least one number."
  query         = query.iam_account_password_policy_one_number
  documentation = file("./cis_v120/docs/cis_v120_1_8.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.8"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_9" {
  title         = "1.9 Ensure IAM password policy requires minimum length of 14 or greater"
  description   = "Password policies are, in part, used to enforce password complexity requirements. IAM password policies can be used to ensure password are at least a given length. It is recommended that the password policy require a minimum password length 14."
  query         = query.iam_account_password_policy_min_length_14
  documentation = file("./cis_v120/docs/cis_v120_1_9.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.9"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_10" {
  title         = "1.10 Ensure IAM password policy prevents password reuse"
  description   = "IAM password policies can prevent the reuse of a given password by the same user. It is recommended that the password policy prevent the reuse of passwords."
  query         = query.iam_account_password_policy_reuse_24
  documentation = file("./cis_v120/docs/cis_v120_1_10.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.10"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_11" {
  title         = "1.11 Ensure IAM password policy expires passwords within 90 days or less"
  description   = "IAM password policies can require passwords to be rotated or expired after a given number of days. It is recommended that the password policy expire passwords after 90 days or less."
  query         = query.iam_password_policy_expire_90
  documentation = file("./cis_v120/docs/cis_v120_1_11.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.11"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_12" {
  title         = "1.12 Ensure no root account access key exists"
  description   = "The root account is the most privileged user in an AWS account. AWS Access Keys provide programmatic access to a given AWS account. It is recommended that all access keys associated with the root account be removed."
  query         = query.iam_root_user_no_access_keys
  documentation = file("./cis_v120/docs/cis_v120_1_12.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.12"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_13" {
  title         = "1.13 Ensure MFA is enabled for the \"root\" account"
  description   = "The root account is the most privileged user in an AWS account. MFA adds an extra layer of protection on top of a user name and password. With MFA enabled, when a user signs in to an AWS website, they will be prompted for their user name and password as well as for an authentication code from their AWS MFA device."
  query         = query.iam_root_user_mfa_enabled
  documentation = file("./cis_v120/docs/cis_v120_1_13.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.13"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_14" {
  title         = "1.14 Ensure hardware MFA is enabled for the \"root\" account"
  description   = "The root account is the most privileged user in an AWS account. MFA adds an extra layer of protection on top of a user name and password. With MFA enabled, when a user signs in to an AWS website, they will be prompted for their user name and password as well as for an authentication code from their AWS MFA device. For Level 2, it is recommended that the root account be protected with a hardware MFA."
  query         = query.iam_root_user_hardware_mfa_enabled
  documentation = file("./cis_v120/docs/cis_v120_1_14.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.14"
    cis_level   = "2"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_15" {
  title         = "1.15 Ensure security questions are registered in the AWS account"
  description   = "The AWS support portal allows account owners to establish security questions that can be used to authenticate individuals calling AWS customer service for support. It is recommended that security questions be established."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_1_15.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.15"
    cis_level   = "1"
    cis_type    = "not_scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_16" {
  title         = "1.16 Ensure IAM policies are attached only to groups or roles"
  description   = "By default, IAM users, groups, and roles have no access to AWS resources. IAM policies are the means by which privileges are granted to users, groups, or roles. It is recommended that IAM policies be applied directly to groups and roles but not users."
  query         = query.iam_user_no_policies
  documentation = file("./cis_v120/docs/cis_v120_1_16.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.16"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_17" {
  title         = "1.17 Maintain current contact details"
  description   = "Ensure contact email and telephone details for AWS accounts are current and map to more than one individual in your organization. An AWS account supports a number of contact details, and AWS will use these to contact the account owner if activity judged to be in breach of Acceptable Use Policy or indicative of likely security compromise is observed by the AWS Abuse team. Contact details should not be for a single individual, as circumstances may arise where that individual is unavailable."
  query         = query.manual_control
  documentation = file("./cis_v120/docs/cis_v120_1_17.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.17"
    cis_level   = "1"
    cis_type    = "not_scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_18" {
  title         = "1.18 Ensure security contact information is registered"
  description   = "AWS provides customers with the option of specifying the contact information for account's security team. It is recommended that this information be provided."
  query         = query.account_alternate_contact_security_registered
  documentation = file("./cis_v120/docs/cis_v120_1_18.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.18"
    cis_level   = "1"
    cis_type    = "not_scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_19" {
  title         = "1.19 Ensure IAM instance roles are used for AWS resource access from instances"
  description   = "AWS access from within AWS instances can be done by either encoding AWS keys into AWS API calls or by assigning the instance to a role which has an appropriate permissions policy for the required access. \"AWS Access\" means accessing the APIs of AWS in order to access AWS resources or manage AWS account resources."
  query         = query.ec2_instance_using_iam_instance_role
  documentation = file("./cis_v120/docs/cis_v120_1_19.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.19"
    cis_level   = "2"
    cis_type    = "not_scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_20" {
  title         = "1.20 Ensure a support role has been created to manage incidents with AWS Support"
  description   = "AWS provides a support center that can be used for incident notification and response, as well as technical support and customer services. Create an IAM Role to allow authorized users to manage incidents with AWS Support."
  query         = query.iam_support_role
  documentation = file("./cis_v120/docs/cis_v120_1_20.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.20"
    cis_level   = "1"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_21" {
  title         = "1.21 Do not setup access keys during initial user setup for all IAM users that have a console password"
  description   = "AWS console defaults the checkbox for creating access keys to enabled. This results in many access keys being generated unnecessarily. In addition to unnecessary credentials, it also generates unnecessary management work in auditing and rotating these keys."
  query         = query.iam_user_access_keys_and_password_at_setup
  documentation = file("./cis_v120/docs/cis_v120_1_21.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.21"
    cis_level   = "1"
    cis_type    = "not_scored"
    service     = "AWS/IAM"
  })
}

control "cis_v120_1_22" {
  title         = "1.22 Ensure IAM policies that allow full \"*:*\" administrative privileges are not created"
  description   = "IAM policies are the means by which privileges are granted to users, groups, or roles. It is recommended and considered a standard security advice to grant least privilege—that is, granting only the permissions required to perform a task. Determine what users need to do and then craft policies for them that let the users perform only those tasks, instead of allowing full administrative privileges."
  query         = query.iam_policy_all_attached_no_star_star
  documentation = file("./cis_v120/docs/cis_v120_1_22.md")

  tags = merge(local.cis_v120_1_common_tags, {
    cis_item_id = "1.22"
    cis_level   = "2"
    cis_type    = "scored"
    service     = "AWS/IAM"
  })
}
