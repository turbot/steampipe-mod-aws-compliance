locals {
  extra_checks_common_tags = merge(local.aws_compliance_common_tags,{
    extra_checks = "true"
  })
}

benchmark "extra_checks" {
  title         = "Extra Checks"
  documentation = file("./extra_checks/docs/extra_checks_overview.md")
  children = [
    benchmark.extra_checks_acm,
    benchmark.extra_checks_apigateway,
    benchmark.extra_checks_cloudformation,
    benchmark.extra_checks_cloudfront,
    benchmark.extra_checks_ec2,
    benchmark.extra_checks_ecr,
    benchmark.extra_checks_ecs,
    benchmark.extra_checks_efs,
    benchmark.extra_checks_eks,
    benchmark.extra_checks_elb,
    benchmark.extra_checks_es,
    benchmark.extra_checks_glue,
    benchmark.extra_checks_iam,
    benchmark.extra_checks_kinesis,
    benchmark.extra_checks_kms,
    benchmark.extra_checks_lambda,
    benchmark.extra_checks_rds,
    benchmark.extra_checks_route53,
    benchmark.extra_checks_s3,
    benchmark.extra_checks_sagemaker,
    benchmark.extra_checks_securityhub,
    benchmark.extra_checks_sns,
    benchmark.extra_checks_sqs,
    benchmark.extra_checks_vpc,
  ]

  tags = merge(local.extra_checks_common_tags, {
    type = "Benchmark"
  })
}
