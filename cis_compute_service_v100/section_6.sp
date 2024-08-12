locals {
  cis_compute_service_v100_6_common_tags = merge(local.cis_compute_service_v100_common_tags, {
    cis_section_id = "6"
  })
}

benchmark "cis_compute_service_v100_6" {
  title         = "6 Elastic Beanstalk"
  description   = "Amazon Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS. You simply upload your code and Elastic Beanstalk automatically handles the deployment, from capacity provisioning, load balancing, and automatic scaling to web application health monitoring, with ongoing fully managed patch and security updates."
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_6.md")
  children = [
    control.cis_compute_service_v100_6_1,
    control.cis_compute_service_v100_6_2,
    control.cis_compute_service_v100_6_3,
    control.cis_compute_service_v100_6_4
  ]

  tags = merge(local.cis_compute_service_v100_6_common_tags, {
    type = "Benchmark"
  })
}

control "cis_compute_service_v100_6_1" {
  title         = "6.1 Ensure Managed Platform updates is configured"
  description   = "AWS Elastic Beanstalk regularly releases platform updates to provide fixes, software updates, and new features. With managed platform updates, you can configure your environment to automatically upgrade to the latest version of a platform during a scheduled maintenance window."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_6_1.md")

  tags = merge(local.cis_compute_service_v100_6_common_tags, {
    cis_item_id = "6.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElasticBeanstalk"
  })
}

control "cis_compute_service_v100_6_2" {
  title         = "6.2 Ensure Persistent logs is setup and configured to S3"
  description   = "Elastic Beanstalk can be configured to automatically stream logs to the CloudWatch service."
  query         = query.elastic_beanstalk_environment_logs_to_cloudwatch
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_6_2.md")

  tags = merge(local.cis_compute_service_v100_6_common_tags, {
    cis_item_id = "6.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElasticBeanstalk"
  })
}

control "cis_compute_service_v100_6_3" {
  title         = "6.3 Ensure access logs are enabled"
  description   = "When you enable load balancing, your AWS Elastic Beanstalk environment is equipped with an Elastic Load Balancing load balancer to distribute traffic among the instances in your environment."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_6_3.md")

  tags = merge(local.cis_compute_service_v100_6_common_tags, {
    cis_item_id = "6.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElasticBeanstalk"
  })
}

control "cis_compute_service_v100_6_4" {
  title         = "6.4 Ensure that HTTPS is enabled on load balancer"
  description   = "The simplest way to use HTTPS with an Elastic Beanstalk environment is to assign a server certificate to your environment's load balancer."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_6_4.md")

  tags = merge(local.cis_compute_service_v100_6_common_tags, {
    cis_item_id = "6.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElasticBeanstalk"
  })
}
