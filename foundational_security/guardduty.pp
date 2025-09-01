locals {
  foundational_security_guardduty_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/GuardDuty"
  })
}

benchmark "foundational_security_guardduty" {
  title         = "GuardDuty"
  documentation = file("./foundational_security/docs/foundational_security_guardduty.md")
  children = [
    control.foundational_security_guardduty_1,
    control.foundational_security_guardduty_5,
    control.foundational_security_guardduty_6,
    control.foundational_security_guardduty_7,
    control.foundational_security_guardduty_8,
    control.foundational_security_guardduty_9,
    control.foundational_security_guardduty_10,
    control.foundational_security_guardduty_11,
    control.foundational_security_guardduty_12,
    control.foundational_security_guardduty_13
  ]

  tags = merge(local.foundational_security_guardduty_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_guardduty_1" {
  title         = "1 GuardDuty should be enabled"
  description   = "This control checks whether Amazon GuardDuty is enabled in your GuardDuty account and Region. It is highly recommended that you enable GuardDuty in all supported AWS Regions. Doing so allows GuardDuty to generate findings about unauthorized or unusual activity, even in Regions that you do not actively use. This also allows GuardDuty to monitor CloudTrail events for global AWS services such as IAM."
  severity      = "high"
  query         = query.guardduty_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_1.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_1"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_guardduty_5" {
  title         = "5 GuardDuty EKS Audit Log Monitoring should be enabled"
  description   = "This control checks whether GuardDuty EKS Audit Log Monitoring is enabled. For a standalone account, the control fails if GuardDuty EKS Audit Log Monitoring is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have EKS Audit Log Monitoring enabled."
  severity      = "high"
  query         = query.guardduty_detector_eks_audit_log_monitoring_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_5.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_5"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_guardduty_6" {
  title         = "6 GuardDuty Lambda Protection should be enabled"
  description   = "This control checks whether GuardDuty Lambda Protection is enabled. For a standalone account, the control fails if GuardDuty Lambda Protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have Lambda Protection enabled."
  severity      = "high"
  query         = query.guardduty_detector_lambda_protection_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_6.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_6"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_guardduty_7" {
  title         = "7 GuardDuty EKS Runtime Monitoring should be enabled"
  description   = "This control checks whether GuardDuty EKS Runtime Monitoring with automated agent management is enabled. For a standalone account, the control fails if GuardDuty EKS Runtime Monitoring with automated agent management is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have EKS Runtime Monitoring with automated agent management enabled."
  severity      = "medium"
  query         = query.guardduty_detector_eks_runtime_monitoring_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_7.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_7"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_guardduty_8" {
  title         = "8 GuardDuty Malware Protection for EC2 should be enabled"
  description   = "This control checks whether GuardDuty Malware Protection is enabled. For a standalone account, the control fails if GuardDuty Malware Protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have Malware Protection enabled."
  severity      = "high"
  query         = query.guardduty_detector_ec2_malware_protection_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_8.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_8"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_guardduty_9" {
  title         = "9 GuardDuty RDS Protection should be enabled"
  description   = "This control checks whether GuardDuty RDS Protection is enabled. For a standalone account, the control fails if GuardDuty RDS Protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have RDS Protection enabled."
  severity      = "high"
  query         = query.guardduty_detector_rds_protection_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_9.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_9"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_guardduty_10" {
  title         = "10 GuardDuty S3 Protection should be enabled"
  description   = "This control checks whether GuardDuty S3 Protection is enabled. For a standalone account, the control fails if GuardDuty S3 Protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have S3 Protection enabled."
  severity      = "high"
  query         = query.guardduty_detector_s3_protection_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_10.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_10"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_guardduty_11" {
  title         = "11 GuardDuty Runtime Monitoring should be enabled"
  description   = "This control checks whether Runtime Monitoring is enabled in Amazon GuardDuty. For a standalone account, the control fails if GuardDuty Runtime Monitoring is disabled for the account. In a multi-account environment, the control fails if GuardDuty Runtime Monitoring is disabled for the delegated GuardDuty administrator account and all member accounts."
  severity      = "high"
  query         = query.guardduty_detector_runtime_monitoring_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_11.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_11"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_guardduty_12" {
  title         = "12 GuardDuty ECS Runtime Monitoring should be enabled"
  description   = "This control checks whether the Amazon GuardDuty automated security agent is enabled for runtime monitoring of Amazon ECS clusters on AWS Fargate. For a standalone account, the control fails if the security agent is disabled for the account. In a multi-account environment, the control fails if the security agent is disabled for the delegated GuardDuty administrator account and all member accounts."
  severity      = "medium"
  query         = query.guardduty_detector_ecs_runtime_monitoring_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_12.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_12"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_guardduty_13" {
  title         = "13 GuardDuty EC2 Runtime Monitoring should be enabled"
  description   = "This control checks whether the Amazon GuardDuty automated security agent is enabled for runtime monitoring of Amazon EC2 instances. For a standalone account, the control fails if the security agent is disabled for the account. In a multi-account environment, the control fails if the security agent is disabled for the delegated GuardDuty administrator account and all member accounts."
  severity      = "medium"
  query         = query.guardduty_detector_ec2_runtime_monitoring_enabled
  documentation = file("./foundational_security/docs/foundational_security_guardduty_13.md")

  tags = merge(local.foundational_security_guardduty_common_tags, {
    foundational_security_item_id  = "guardduty_13"
    foundational_security_category = "detection_services"
  })
}
