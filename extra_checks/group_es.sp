locals {
  extra_checks_es_common_tags = merge(local.extra_checks_common_tags, {
    service = "es"
  })
}

benchmark "group_es" {
  title       = "ES Checks"
  description = "This group of es extra checks shows results of controls related to es service."
  children = [
    control.es_domain_logging_enabled
  ]

  tags = local.extra_checks_es_common_tags
}

control "es_domain_logging_enabled" {
  title       = "Check if Amazon Elasticsearch Service (ES) domains have logging enable"
  description = "Amazon ES exposes four Elasticsearch logs through Amazon CloudWatch Logs: error logs; search slow logs; index slow logs; and audit logs. Search slow logs and index slow logs are useful for troubleshooting performance and stability issues."
  sql         = query.es_domain_logging_enabled.sql

  tags = merge(local.extra_checks_es_common_tags, {
    extra_check_category = "logging_and_monitoring"
  })
}
