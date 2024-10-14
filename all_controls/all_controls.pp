locals {
  all_controls_common_tags = merge(local.aws_compliance_common_tags, {
    type = "Benchmark"
  })
}

benchmark "all_controls" {
  title       = "All Controls"
  description = "This benchmark contains all controls grouped by service to help you detect resource configurations that do not meet best practices."
  children = [
    benchmark.all_controls_account,
    benchmark.all_controls_acm,
    benchmark.all_controls_apigateway,
    benchmark.all_controls_appstream,
    benchmark.all_controls_appsync,
    benchmark.all_controls_athena,
    benchmark.all_controls_autoscaling,
    benchmark.all_controls_backup,
    benchmark.all_controls_cloudformation,
    benchmark.all_controls_cloudfront,
    benchmark.all_controls_cloudtrail,
    benchmark.all_controls_cloudwatch,
    benchmark.all_controls_codebuild,
    benchmark.all_controls_codedeploy,
    benchmark.all_controls_config,
    benchmark.all_controls_dax,
    benchmark.all_controls_directoryservice,
    benchmark.all_controls_dlm,
    benchmark.all_controls_dms,
    benchmark.all_controls_docdb,
    benchmark.all_controls_drs,
    benchmark.all_controls_dynamodb,
    benchmark.all_controls_ebs,
    benchmark.all_controls_ec2,
    benchmark.all_controls_ecr,
    benchmark.all_controls_ecs,
    benchmark.all_controls_efs,
    benchmark.all_controls_eks,
    benchmark.all_controls_elasticache,
    benchmark.all_controls_elasticbeanstalk,
    benchmark.all_controls_elb,
    benchmark.all_controls_emr,
    benchmark.all_controls_es,
    benchmark.all_controls_eventbridge,
    benchmark.all_controls_fsx,
    benchmark.all_controls_glacier,
    benchmark.all_controls_glue,
    benchmark.all_controls_guardduty,
    benchmark.all_controls_iam,
    benchmark.all_controls_kinesis,
    benchmark.all_controls_kms,
    benchmark.all_controls_lambda,
    benchmark.all_controls_lightsail,
    benchmark.all_controls_mq,
    benchmark.all_controls_msk,
    benchmark.all_controls_neptune,
    benchmark.all_controls_networkfirewall,
    benchmark.all_controls_opensearch,
    benchmark.all_controls_organization,
    benchmark.all_controls_pca,
    benchmark.all_controls_rds,
    benchmark.all_controls_redshift,
    benchmark.all_controls_route53,
    benchmark.all_controls_s3,
    benchmark.all_controls_sagemaker,
    benchmark.all_controls_secretsmanager,
    benchmark.all_controls_securityhub,
    benchmark.all_controls_sfn,
    benchmark.all_controls_sns,
    benchmark.all_controls_sqs,
    benchmark.all_controls_ssm,
    benchmark.all_controls_vpc,
    benchmark.all_controls_waf,
    benchmark.all_controls_wafv2,
    benchmark.all_controls_workspaces
  ]

  tags = local.all_controls_common_tags
}
