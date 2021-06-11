locals {
  conformance_pack_elb_common_tags = {
    service = "elb"
  }
}

control "elb_application_classic_logging_enabled" {
  title       = "ELB application classic LB logging should be enabled"
  description = "Elastic Load Balancing activity is a central point of communication within an environment."
  sql         = query.elb_application_classic_logging_enabled.sql
  tags        = local.conformance_pack_elb_common_tags
}

control "elb_application_deletion_protection_enabled" {
  title       = "ELB application deletion protection should be enabled"
  description = "This rule ensures that Elastic Load Balancing has deletion protection enabled."
  sql         = query.elb_application_deletion_protection_enabled.sql
  tags        = local.conformance_pack_elb_common_tags
}

control "elb_classic_lb_use_ssl_certificate" {
  title       = "ELB classic LB should use SSL certificate"
  description = "Because sensitive data can exist and to help protect data at transit, ensure encryption is enabled for your Elastic Load Balancing."
  sql         = query.elb_classic_lb_use_ssl_certificate.sql
  tags        = local.conformance_pack_elb_common_tags
}
