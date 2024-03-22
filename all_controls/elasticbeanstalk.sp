locals {
  all_controls_elasticbeanstalk_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/ElasticBeanstalk"
  })
}

benchmark "all_controls_elasticbeanstalk" {
  title       = "Elastic Beanstalk"
  description = "This section contains recommendations for configuring Elastic Beanstalk resources."
  children = [
    control.elastic_beanstalk_enhanced_health_reporting_enabled,
    control.elastic_beanstalk_environment_logs_to_cloudwatch
  ]

  tags = merge(local.all_controls_elasticbeanstalk_common_tags, {
    type = "Benchmark"
  })
}
