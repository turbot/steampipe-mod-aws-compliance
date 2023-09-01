locals {
  all_controls_elasticbeanstalk_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/ElasticBeanstalk"
  })
}

benchmark "all_controls_elasticbeanstalk" {
  title       = "ElasticBeanstalk"
  description = "This section contains recommendations for configuring ElasticBeanstalk resources."
  children = [
    control.elastic_beanstalk_enhanced_health_reporting_enabled
  ]

  tags = merge(local.all_controls_elasticbeanstalk_common_tags, {
    type = "Benchmark"
  })
}
