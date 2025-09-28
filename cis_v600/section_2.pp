locals {
  cis_v600_2_common_tags = merge(local.cis_v600_common_tags, {
    cis_section_id = "2"
  })
}

benchmark "cis_v600_2" {
  title         = "2 Identity and Access Management"
  documentation = file("./cis_v600/docs/cis_v600_2.md")
  children = [
    control.cis_v600_2_1,
    control.cis_v600_2_2,
    control.cis_v600_2_3,
    control.cis_v600_2_4,
    control.cis_v600_2_5,
    control.cis_v600_2_6,
    control.cis_v600_2_7,
    control.cis_v600_2_8,
    control.cis_v600_2_9,
    control.cis_v600_2_10,
    control.cis_v600_2_11,
    control.cis_v600_2_12,
    control.cis_v600_2_13,
    control.cis_v600_2_14,
    control.cis_v600_2_15,
    control.cis_v600_2_16,
    control.cis_v600_2_17,
    control.cis_v600_2_18,
    control.cis_v600_2_19,
    control.cis_v600_2_20,
    control.cis_v600_2_21
  ]

  tags = merge(local.cis_v600_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v600_2_1" {
  title         = "2.1 Maintain current contact details"
  description   = "Ensure contact email and telephone details for AWS accounts are current and map to more than one individual in your organization."
  query         = query.manual_control
  documentation = file("./cis_v600/docs/cis_v600_2_1.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_2" {
  title         = "2.2 Ensure security contact information is registered"
  description   = "AWS provides customers with the option of specifying the contact information for account's security team. It is recommended that this information be provided."
  query         = query.account_alternate_contact_security_registered
  documentation = file("./cis_v600/docs/cis_v600_2_2.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_3" {
  title         = "2.3 Ensure no 'root' user account access key exists"
  description   = "The 'root' user account is the most privileged user in an AWS account. AWS Access Keys provide programmatic access to a given AWS account. It is recommended that all access keys associated with the 'root' user account be deleted."
  query         = query.iam_root_user_no_access_keys
  documentation = file("./cis_v600/docs/cis_v600_2_3.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_4" {
  title         = "2.4 Ensure MFA is enabled for the 'root' user account"
  description   = "The 'root' user account is the most privileged user in an AWS account. Multi-factor Authentication (MFA) adds an extra layer of protection on top of a username and password. With MFA enabled, when a user signs in to an AWS website, they will be prompted for their username and password as well as for an authentication code from their AWS MFA device."
  query         = query.iam_root_user_account_console_access_mfa_enabled
  documentation = file("./cis_v600/docs/cis_v600_2_4.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_5" {
  title         = "2.5 Ensure hardware MFA is enabled for the 'root' user account"
  description   = "The 'root' user account is the most privileged user in an AWS account. MFA adds an extra layer of protection on top of a username and password. With MFA enabled, when a user signs in to an AWS website, they will be prompted for their username and password as well as for an authentication code from their AWS MFA device. For Level 2, it is recommended that the 'root' user account be protected with a hardware MFA."
  query         = query.iam_root_user_hardware_mfa_enabled
  documentation = file("./cis_v600/docs/cis_v600_2_5.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.5"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_6" {
  title         = "2.6 Eliminate use of the 'root' user for administrative and daily tasks"
  description   = "With the creation of an AWS account, a 'root user' is created that cannot be disabled ordeleted. That user has unrestricted access to and control over all resources in the AWS account. It is highly recommended that the use of this account be avoided for everyday tasks."
  query         = query.iam_root_last_used
  documentation = file("./cis_v600/docs/cis_v600_2_6.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_7" {
  title         = "2.7 Ensure IAM password policy requires minimum length of 14 or greater"
  description   = "Password policies are, in part, used to enforce password complexity requirements. IAM password policies can be used to ensure passwords are at least a given length. It is recommended that the password policy require a minimum password length 14."
  query         = query.iam_account_password_policy_min_length_14
  documentation = file("./cis_v600/docs/cis_v600_2_7.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.7"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_8" {
  title         = "2.8 Ensure IAM password policy prevents password reuse"
  description   = "IAM password policies can prevent the reuse of a given password by the same user. It is recommended that the password policy prevent the reuse of passwords."
  query         = query.iam_account_password_policy_reuse_24
  documentation = file("./cis_v600/docs/cis_v600_2_8.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.8"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_9" {
  title         = "2.9 Ensure multi-factor authentication (MFA) is enabled for all IAM users that have a console password"
  description   = "Multi-Factor Authentication (MFA) adds an extra layer of authentication assurance beyond traditional credentials. With MFA enabled, when a user signs in to the AWS Console, they will be prompted for their user name and password as well as for an authentication code from their physical or virtual MFA token. It is recommended that MFA be enabled for all accounts that have a console password."
  query         = query.iam_user_console_access_mfa_enabled
  documentation = file("./cis_v600/docs/cis_v600_2_9.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.9"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_10" {
  title         = "2.10 Do not create access keys during initial setup for IAM users with a console password"
  description   = "AWS console defaults to no check boxes selected when creating a new IAM user. When creating the IAM User credentials you have to determine what type of access they require"
  query         = query.iam_user_access_keys_and_password_at_setup
  documentation = file("./cis_v600/docs/cis_v600_2_10.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_11" {
  title         = "2.11 Ensure credentials unused for 45 days or more are disabled"
  description   = "AWS IAM users can access AWS resources using different types of credentials, such as passwords or access keys. It is recommended that all credentials that have been unused for 45 days or more be deactivated or removed."
  query         = query.iam_user_unused_credentials_45
  documentation = file("./cis_v600/docs/cis_v600_2_11.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.11"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_12" {
  title         = "2.12 Ensure there is only one active access key for any single IAM user"
  description   = "Access keys are long-term credentials for an IAM user or the AWS account 'root' user. You can use access keys to sign programmatic requests to the AWS CLI or AWS API (directly or using the AWS SDK)"
  query         = query.iam_user_one_active_key
  documentation = file("./cis_v600/docs/cis_v600_2_12.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.12"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_13" {
  title         = "2.13 Ensure access keys are rotated every 90 days or less"
  description   = "Access keys consist of an access key ID and secret access key, which are used to sign programmatic requests that you make to AWS. AWS users need their own access keys to make programmatic calls to AWS from the AWS Command Line Interface (AWS CLI), Tools for Windows PowerShell, the AWS SDKs, or direct HTTP calls using the APIs fo"
  query         = query.iam_user_access_key_age_90
  documentation = file("./cis_v600/docs/cis_v600_2_13.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.13"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_14" {
  title         = "2.14 Ensure IAM users receive permissions only through groups"
  description   = "IAM users are granted access to services, functions, and data through IAM policies. There are four ways to define policies for a user: 1) Edit the user policy directly, also known as an inline or user policy; 2) attach a policy directly to a user; 3) add the user to an IAM group that has an attached policy; 4) add the user to an IAM group that has an inline policy."
  query         = query.iam_user_no_inline_attached_policies
  documentation = file("./cis_v600/docs/cis_v600_2_14.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.14"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_15" {
  title         = "2.15 Ensure IAM policies that allow full \"*:*\" administrative privileges are not attached"
  description   = "IAM policies are the means by which privileges are granted to users, groups, or roles. It is recommended and considered standard security advice to grant least privilege—that is, granting only the permissions required to perform a task. Determine what users need to do, and then craft policies for them that allow the users to perform only those tasks, instead of granting full administrative privileges."
  query         = query.iam_policy_all_attached_no_star_star
  documentation = file("./cis_v600/docs/cis_v600_2_15.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.15"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_16" {
  title         = "2.16 Ensure a support role has been created to manage incidents with AWS Support"
  description   = "AWS provides a support center that can be used for incident notification and response, as well as technical support and customer services. Create an IAM Role, with the appropriate policy assigned, to allow authorized users to manage incidents with AWS Support."
  query         = query.iam_support_role
  documentation = file("./cis_v600/docs/cis_v600_2_16.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.16"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_17" {
  title         = "2.17 Ensure IAM instance roles are used for AWS resource access from instances"
  description   = "AWS access from within AWS instances can be done by either encoding AWS keys into AWS API calls or by assigning the instance to a role which has an appropriate permissions policy for the required access."
  query         = query.ec2_instance_using_iam_instance_role
  documentation = file("./cis_v600/docs/cis_v600_2_17.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.17"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_18" {
  title         = "2.18 Ensure that all expired SSL/TLS certificates stored in AWS IAM are removed"
  description   = "To enable HTTPS connections to your website or application in AWS, you need an SSL/TLS server certificate. You can use AWS Certificate Manager (ACM) or IAM to store and deploy server certificates. Use IAM as a certificate manager only when you must support HTTPS connections in a region that is not supported by ACM. IAM securely encrypts your private keys and stores the encrypted version in IAM SSL certificate storage. IAM supports deploying server certificates in all regions, but you must obtain your certificate from an external provider for use with AWS. You cannot upload an ACM certificate to IAM. Additionally, you cannot manage your certificates from the IAM Console."
  query         = query.iam_server_certificate_not_expired
  documentation = file("./cis_v600/docs/cis_v600_2_18.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.18"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_19" {
  title         = "2.19 Ensure that IAM External Access Analyzer is enabled for all regions"
  description   = "Enable the IAM External Access Analyzer regarding all resources in each active AWS region."
  query         = query.iam_access_analyzer_enabled
  documentation = file("./cis_v600/docs/cis_v600_2_19.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.19"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_20" {
  title         = "2.20 Ensure IAM users are managed centrally via identity federation or AWS Organizations for multi-account environments"
  description   = "In multi-account environments, IAM user centralization facilitates greater user control. User access beyond the initial account is then provided via role assumption. Centralization of users can be accomplished through federation with an external identity provider or through the use of AWS Organizations."
  query         = query.manual_control
  documentation = file("./cis_v600/docs/cis_v600_2_20.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.20"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/IAM"
  })
}

control "cis_v600_2_21" {
  title         = "2.21 Ensure access to AWSCloudShellFullAccess is restricted"
  description   = "AWS CloudShell is a convenient way of running CLI commands against AWS services; a managed IAM policy ('AWSCloudShellFullAccess') provides full access to CloudShell, which allows file upload and download capability between a user's local system and the CloudShell environment. Within the CloudShell environment, a user has sudo permissions and can access the internet. Therefore, it is feasible to install file transfer software, for example, and move data from CloudShell to external internet servers."
  query         = query.iam_user_group_role_cloudshell_fullaccess_restricted
  documentation = file("./cis_v600/docs/cis_v600_2_21.md")

  tags = merge(local.cis_v600_2_common_tags, {
    cis_item_id = "2.21"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/IAM"
  })
}
