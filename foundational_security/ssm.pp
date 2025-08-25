locals {
  foundational_security_ssm_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/SSM"
  })
}

benchmark "foundational_security_ssm" {
  title         = "SSM"
  documentation = file("./foundational_security/docs/foundational_security_ssm.md")
  children = [
    control.foundational_security_ssm_1,
    control.foundational_security_ssm_2,
    control.foundational_security_ssm_3,
    control.foundational_security_ssm_4,
    control.foundational_security_ssm_6,
    control.foundational_security_ssm_7
  ]

  tags = merge(local.foundational_security_ssm_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_ssm_1" {
  title         = "1 EC2 instances should be managed by AWS Systems Manager"
  description   = "This control checks whether the EC2 instances in your account are managed by AWS Systems Manager. Systems Manager is an AWS service that you can use to view and control your AWS infrastructure. To help you to maintain security and compliance, Systems Manager scans your managed instances. A managed instance is a machine that is configured for use with Systems Manager. Systems Manager then reports or takes corrective action on any policy violations that it detects. Systems Manager also helps you to configure and maintain your managed instances."
  severity      = "medium"
  query         = query.ec2_instance_ssm_managed
  documentation = file("./foundational_security/docs/foundational_security_ssm_1.md")

  tags = merge(local.foundational_security_ssm_common_tags, {
    foundational_security_item_id  = "ssm_1"
    foundational_security_category = "inventory"
  })
}

control "foundational_security_ssm_2" {
  title         = "2 All EC2 instances managed by Systems Manager should be compliant with patching requirements"
  description   = "This control checks whether the compliance status of the Amazon EC2 Systems Manager patch compliance is COMPLIANT or non compliant after the patch installation on the instance. It only checks instances that are managed by Systems Manager Patch Manager."
  severity      = "high"
  query         = query.ssm_managed_instance_compliance_patch_compliant
  documentation = file("./foundational_security/docs/foundational_security_ssm_2.md")

  tags = merge(local.foundational_security_ssm_common_tags, {
    foundational_security_item_id  = "ssm_2"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_ssm_3" {
  title         = "3 Instances managed by Systems Manager should have an association compliance status of COMPLIANT"
  description   = "This control checks whether the status of the AWS Systems Manager association compliance is COMPLIANT or non compliant after the association is run on an instance. The control passes if the association compliance status is COMPLIANT."
  severity      = "low"
  query         = query.ssm_managed_instance_compliance_association_compliant
  documentation = file("./foundational_security/docs/foundational_security_ssm_3.md")

  tags = merge(local.foundational_security_ssm_common_tags, {
    foundational_security_item_id  = "ssm_3"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_ssm_4" {
  title         = "4 SSM documents should not be public"
  description   = "This control checks whether AWS Systems Manager documents that are owned by the account are public. This control fails if SSM documents with the owner Self are public."
  severity      = "critical"
  query         = query.ssm_document_prohibit_public_access
  documentation = file("./foundational_security/docs/foundational_security_ssm_4.md")

  tags = merge(local.foundational_security_ssm_common_tags, {
    foundational_security_item_id  = "ssm_4"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_ssm_6" {
  title         = "6 SSM Automation should have CloudWatch logging enabled"
  description   = "This control checks whether Amazon CloudWatch logging is enabled for AWS Systems Manager (SSM) Automation. The control fails if CloudWatch logging isn't enabled for SSM Automation."
  severity      = "medium"
  query         = query.ssm_automation_cloudwatch_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_ssm_6.md")

  tags = merge(local.foundational_security_ssm_common_tags, {
    foundational_security_item_id  = "ssm_6"
    foundational_security_category = "logging"
  })
}

control "foundational_security_ssm_7" {
  title         = "7 SSM documents should have the block public sharing setting enabled"
  description   = "This control checks whether the block public sharing setting is enabled for AWS Systems Manager documents. The control fails if the block public sharing setting is disabled for Systems Manager documents."
  severity      = "critical"
  query         = query.ssm_document_block_public_sharing_setting_enabled
  documentation = file("./foundational_security/docs/foundational_security_ssm_7.md")

  tags = merge(local.foundational_security_ssm_common_tags, {
    foundational_security_item_id  = "ssm_7"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}