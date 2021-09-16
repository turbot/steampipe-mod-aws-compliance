locals {
  extra_checks_common_tags = {
    extra_checks  = "true"
    plugin        = "aws"
  }
}

benchmark "extra_checks" {
  title       = "Extra Checks"
  description = "This extra checks benchmark is a set of controls to use the secure AWS environment and to maintain security and data protection in the cloud."
  children = [
    benchmark.group_cloudfront,
    benchmark.group_cloudtrail,
    benchmark.group_ec2,
    benchmark.group_es,
    benchmark.group_iam,
    benchmark.group_kms,
    benchmark.group_route53,
    benchmark.group_sns,
    benchmark.group_sqs,
  ]
  tags = local.extra_checks_common_tags
}
