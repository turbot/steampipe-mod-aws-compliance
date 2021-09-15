locals {
  extra_checks_sns_common_tags = merge(local.extra_checks_common_tags, {
    service = "sns"
  })
}

benchmark "group_sns" {
  title       = "SNS Extra Checks"
  description = "This group of SNS extra checks shows results of controls related to SNS service."
  children = [
    control.sns_topic_policy_no_public_access
  ]

  tags = local.extra_checks_sns_common_tags
}

control "sns_topic_policy_no_public_access" {
  title       = "Check if SNS topics have policy set as Public"
  description = "Publicly accessible services could expose sensible data to bad actors. Ensure there is a business requirement for service to be public."
  sql         = query.sns_topic_policy_no_public_access.sql

  tags = merge(local.extra_checks_sns_common_tags, {
    extra_check_category = "infrastructure_security"
  })
}