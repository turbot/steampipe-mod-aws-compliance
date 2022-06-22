locals {
  conformance_pack_cloudformation_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudFormation"
  })
}

control "cloudformation_stack_output_no_secrets" {
  title       = "CloudFormation stacks output should not have any secrets"
  description = ""
  sql         = query.cloudformation_stack_output_no_secrets.sql

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    extra_checks = "true"
  })
}