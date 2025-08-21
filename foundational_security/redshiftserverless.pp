locals {
  foundational_security_redshiftserverless_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/RedshiftServerless"
  })
}

benchmark "foundational_security_redshiftserverless" {
  title         = "Redshift Serverless"
  documentation = file("./foundational_security/docs/foundational_security_redshiftserverless.md")
  children = [
    control.foundational_security_redshiftserverless_1,
    control.foundational_security_redshiftserverless_2,
    control.foundational_security_redshiftserverless_3,
    control.foundational_security_redshiftserverless_5,
    control.foundational_security_redshiftserverless_6,
    control.foundational_security_redshiftserverless_7
  ]

  tags = merge(local.foundational_security_redshiftserverless_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_redshiftserverless_1" {
  title         = "1 Amazon Redshift Serverless workgroups should use enhanced VPC routing"
  description   = "This control checks whether enhanced VPC routing is enabled for an Amazon Redshift Serverless workgroup. The control fails if enhanced VPC routing is disabled for the workgroup."
  severity      = "medium"
  query         = query.redshiftserverless_workgroup_enhanced_vpc_routing_enabled
  documentation = file("./foundational_security/docs/foundational_security_redshiftserverless_1.md")

  tags = merge(local.foundational_security_redshiftserverless_common_tags, {
    foundational_security_item_id  = "redshiftserverless_1"
    foundational_security_category = "resources_within_vpc"
  })
}

control "foundational_security_redshiftserverless_2" {
  title         = "2 Connections to Redshift Serverless workgroups should be required to use SSL"
  description   = "This control checks whether connections to an Amazon Redshift Serverless workgroup are required to encrypt data in transit. The control fails if the require_ssl configuration parameter for the workgroup is set to false."
  severity      = "medium"
  query         = query.redshiftserverless_workgroup_encryption_in_transit_enabled
  documentation = file("./foundational_security/docs/foundational_security_redshiftserverless_2.md")

  tags = merge(local.foundational_security_redshiftserverless_common_tags, {
    foundational_security_item_id  = "redshiftserverless_2"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_redshiftserverless_3" {
  title         = "3 Redshift Serverless workgroups should prohibit public access"
  description   = "This control checks whether public access is disabled for an Amazon Redshift Serverless workgroup. It evaluates the publiclyAccessible property of a Redshift Serverless workgroup. The control fails if public access is enabled (true) for the workgroup."
  severity      = "high"
  query         = query.redshiftserverless_workgroup_restrict_public_access
  documentation = file("./foundational_security/docs/foundational_security_redshiftserverless_3.md")

  tags = merge(local.foundational_security_redshiftserverless_common_tags, {
    foundational_security_item_id  = "redshiftserverless_3"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_redshiftserverless_5" {
  title         = "5 Redshift Serverless namespaces should not use the default admin username"
  description   = "This control checks whether the admin username for an Amazon Redshift Serverless namespace is the default admin username, admin. The control fails if the admin username for the Redshift Serverless namespace is admin. You can optionally specify a list of admin usernames for the control to include in the evaluation."
  severity      = "medium"
  query         = query.redshiftserverless_namespace_no_default_admin_username
  documentation = file("./foundational_security/docs/foundational_security_redshiftserverless_5.md")

  tags = merge(local.foundational_security_redshiftserverless_common_tags, {
    foundational_security_item_id  = "redshiftserverless_5"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_redshiftserverless_6" {
  title         = "6 Redshift Serverless namespaces should export logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon Redshift Serverless namespace is configured to export connection and user logs to Amazon CloudWatch Logs. The control fails if the Redshift Serverless namespace isn't configured to export the logs to CloudWatch Logs."
  severity      = "medium"
  query         = query.redshiftserverless_namespace_export_connection_and_user_log_to_cloudwatch
  documentation = file("./foundational_security/docs/foundational_security_redshiftserverless_6.md")

  tags = merge(local.foundational_security_redshiftserverless_common_tags, {
    foundational_security_item_id  = "redshiftserverless_6"
    foundational_security_category = "logging"
  })
}

control "foundational_security_redshiftserverless_7" {
  title         = "7 Redshift Serverless namespaces should not use the default database name"
  description   = "This control checks whether an Amazon Redshift Serverless namespace uses the default database name, dev. The control fails if the Redshift Serverless namespace uses the default database name, dev."
  severity      = "medium"
  query         = query.redshiftserverless_namespace_no_default_database_username
  documentation = file("./foundational_security/docs/foundational_security_redshiftserverless_7.md")

  tags = merge(local.foundational_security_redshiftserverless_common_tags, {
    foundational_security_item_id  = "redshiftserverless_7"
    foundational_security_category = "resource_configuration"
  })
}


