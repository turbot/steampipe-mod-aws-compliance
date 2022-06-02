locals {
  conformance_pack_elasticbeanstalk_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/ElasticBeanstalk"
  })
}

control "elastic_beanstalk_enhanced_health_reporting_enabled" {
  title       = "Elastic Beanstalk enhanced health reporting should be enabled"
  description = "AWS Elastic Beanstalk enhanced health reporting enables a more rapid response to changes in the health of the underlying infrastructure. These changes could result in a lack of availability of the application. Elastic Beanstalk enhanced health reporting provides a status descriptor to gauge the severity of the identified issues and identify possible causes to investigate."
  sql         = query.elastic_beanstalk_enhanced_health_reporting_enabled.sql

  tags = merge(local.conformance_pack_elasticbeanstalk_common_tags, {
    fedramp_low_rev_4      = "true"
    fedramp_moderate_rev_4 = "true"
    nist_800_53_rev_5      = "true"
  })
}