locals {
  conformance_pack_cloudformation_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CloudFormation"
  })
}

control "cloudformation_stack_output_no_secrets" {
  title       = "CloudFormation stacks output should not have any secrets"
  description = "Ensure CloudFormation stacks outputs does not contain any secrets like user names, passwords, and tokens. This is recommended to remove secrtes as outputs cannot be encrypted resulting in any entity with basic read-metadata-only and access to CloudFormation outputs having access to these secrets."
  sql         = query.cloudformation_stack_output_no_secrets.sql

  tags = merge(local.conformance_pack_cloudformation_common_tags, {
    other_checks = "true"
  })
}
