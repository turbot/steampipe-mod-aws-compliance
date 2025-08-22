locals {
  foundational_security_common_tags = merge(local.aws_compliance_common_tags, {
    aws_foundational_security = "true"
  })
}

benchmark "foundational_security" {
  title         = "AWS Foundational Security Best Practices"
  description   = "The AWS Foundational Security Best Practices standard is a set of controls that detect when your deployed accounts and resources deviate from security best practices."
  documentation = file("./foundational_security/docs/foundational_security_overview.md")
  children = [
    benchmark.foundational_security_account,
    benchmark.foundational_security_acm,
    benchmark.foundational_security_apigateway,
    benchmark.foundational_security_appsync,
    benchmark.foundational_security_athena,
    benchmark.foundational_security_autoscaling,
    benchmark.foundational_security_backup,
    benchmark.foundational_security_cloudformation,
    benchmark.foundational_security_cloudfront,
    benchmark.foundational_security_cloudtrail,
    benchmark.foundational_security_codebuild,
    benchmark.foundational_security_cognito,
    benchmark.foundational_security_config,
    benchmark.foundational_security_connect,
    benchmark.foundational_security_datafirehose,
    benchmark.foundational_security_datasync,
    benchmark.foundational_security_dms,
    benchmark.foundational_security_docdb,
    benchmark.foundational_security_dynamodb,
    benchmark.foundational_security_ec2,
    benchmark.foundational_security_ecr,
    benchmark.foundational_security_ecs,
    benchmark.foundational_security_efs,
    benchmark.foundational_security_eks,
    benchmark.foundational_security_elasticache,
    benchmark.foundational_security_elasticbeanstalk,
    benchmark.foundational_security_elb,
    benchmark.foundational_security_emr,
    benchmark.foundational_security_es,
    benchmark.foundational_security_eventbridge,
    benchmark.foundational_security_fsx,
    benchmark.foundational_security_glue,
    benchmark.foundational_security_guardduty,
    benchmark.foundational_security_iam,
    benchmark.foundational_security_inspector,
    benchmark.foundational_security_kinesis,
    benchmark.foundational_security_kms,
    benchmark.foundational_security_lambda,
    benchmark.foundational_security_mq,
    benchmark.foundational_security_msk,
    benchmark.foundational_security_neptune,
    benchmark.foundational_security_networkfirewall,
    benchmark.foundational_security_opensearch,
    benchmark.foundational_security_pca,
    benchmark.foundational_security_rds,
    benchmark.foundational_security_redshift,
    benchmark.foundational_security_redshiftserverless,
    benchmark.foundational_security_route53,
    benchmark.foundational_security_s3,
    benchmark.foundational_security_sagemaker,
    benchmark.foundational_security_secretsmanager,
    benchmark.foundational_security_servicecatalog,
    benchmark.foundational_security_sfn,
    benchmark.foundational_security_sns,
    benchmark.foundational_security_sqs,
    benchmark.foundational_security_ssm,
    benchmark.foundational_security_transfer,
    benchmark.foundational_security_waf,
    benchmark.foundational_security_workspaces
  ]

  tags = merge(local.foundational_security_common_tags, {
    type = "Benchmark"
  })
}
