locals {
  foundational_security_elasticbeanstalk_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/ElasticBeanstalk"
  })
}

benchmark "foundational_security_elasticbeanstalk" {
  title         = "Elastic Beanstalk"
  documentation = file("./foundational_security/docs/foundational_security_elasticbeanstalk.md")
  children = [
    control.foundational_security_elasticbeanstalk_1,
    control.foundational_security_elasticbeanstalk_3
  ]

  tags = merge(local.foundational_security_elasticbeanstalk_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_elasticbeanstalk_1" {
  title         = "1 Elastic Beanstalk environments should have enhanced health reporting enabled"
  description   = "This control checks whether enhanced health reporting is enabled for your AWS Elastic Beanstalk environments.Elastic Beanstalk enhanced health reporting enables a more rapid response to changes in the health of the underlying infrastructure. These changes could result in a lack of availability of the application."
  severity      = "low"
  query         = query.elastic_beanstalk_enhanced_health_reporting_enabled
  documentation = file("./foundational_security/docs/foundational_security_elasticbeanstalk_1.md")

  tags = merge(local.foundational_security_elasticbeanstalk_common_tags, {
    foundational_security_item_id  = "elasticbeanstalk_1"
    foundational_security_category = "application_monitoring"
  })
}

control "foundational_security_elasticbeanstalk_3" {
  title         = "3 Elastic Beanstalk should stream logs to CloudWatch"
  description   = "This control checks whether an Elastic Beanstalk environment is configured to send logs to CloudWatch Logs. The control fails if an Elastic Beanstalk environment isn't configured to send logs to CloudWatch Logs. Optionally, you can provide a custom value for the RetentionInDays parameter if you want the control to pass only if logs are retained for the specified number of days before expiration."
  severity      = "high"
  query         = query.elastic_beanstalk_environment_logs_to_cloudwatch
  documentation = file("./foundational_security/docs/foundational_security_elasticbeanstalk_3.md")

  tags = merge(local.foundational_security_elasticbeanstalk_common_tags, {
    foundational_security_item_id  = "elasticbeanstalk_3"
    foundational_security_category = "logging"
  })
}
