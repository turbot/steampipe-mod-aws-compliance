locals {
  foundational_security_dms_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/DMS"
  })
}

benchmark "foundational_security_dms" {
  title         = "DMS"
  documentation = file("./foundational_security/docs/foundational_security_dms.md")
  children = [
    control.foundational_security_dms_1,
    control.foundational_security_dms_6,
    control.foundational_security_dms_7,
    control.foundational_security_dms_8,
    control.foundational_security_dms_9,
    control.foundational_security_dms_10,
    control.foundational_security_dms_11,
    control.foundational_security_dms_12,
    control.foundational_security_dms_13
  ]

  tags = merge(local.foundational_security_dms_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_dms_1" {
  title         = "1 AWS Database Migration Service replication instances should not be public"
  description   = "This control checks whether AWS DMS replication instances are public. To do this, it examines the value of the PubliclyAccessible field. A private replication instance has a private IP address that you cannot access outside of the replication network. A replication instance should have a private IP address when the source and target databases are in the same network. The network must also be connected to the replication instance's VPC using a VPN, AWS Direct Connect, or VPC peering. To learn more about public and private replication instances, see Public and private replication instances in the AWS Database Migration Service User Guide."
  severity      = "critical"
  query         = query.dms_replication_instance_not_publicly_accessible
  documentation = file("./foundational_security/docs/foundational_security_dms_1.md")

  tags = merge(local.foundational_security_dms_common_tags, {
    foundational_security_item_id  = "dms_1"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_dms_6" {
  title         = "6 DMS replication instances should have automatic minor version upgrade enabled"
  description   = "This control checks if automatic minor version upgrade is enabled for an AWS DMS replication instance. The control fails if automatic minor version upgrade isn't enabled for a DMS replication instance."
  severity      = "medium"
  query         = query.dms_replication_instance_automatic_minor_version_upgrade_enabled
  documentation = file("./foundational_security/docs/foundational_security_dms_6.md")

  tags = merge(local.foundational_security_dms_common_tags, {
    foundational_security_item_id  = "dms_6"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}

control "foundational_security_dms_7" {
  title         = "7 DMS replication tasks for the target database should have logging enabled"
  description   = "This control checks whether logging is enabled with the minimum severity level of LOGGER_SEVERITY_DEFAULT for DMS replication tasks TARGET_APPLY and TARGET_LOAD. The control fails if logging isn't enabled for these tasks or if the minimum severity level is less than LOGGER_SEVERITY_DEFAULT."
  severity      = "medium"
  query         = query.dms_replication_task_target_database_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_dms_7.md")

  tags = merge(local.foundational_security_dms_common_tags, {
    foundational_security_item_id  = "dms_7"
    foundational_security_category = "logging"
  })
}

control "foundational_security_dms_8" {
  title         = "8 DMS replication tasks for the source database should have logging enabled"
  description   = "This control checks whether logging is enabled with the minimum severity level of LOGGER_SEVERITY_DEFAULT for DMS replication tasks SOURCE_CAPTURE and SOURCE_UNLOAD. The control fails if logging isn't enabled for these tasks or if the minimum severity level is less than LOGGER_SEVERITY_DEFAULT."
  severity      = "medium"
  query         = query.dms_replication_task_source_database_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_dms_8.md")

  tags = merge(local.foundational_security_dms_common_tags, {
    foundational_security_item_id  = "dms_8"
    foundational_security_category = "logging"
  })
}

control "foundational_security_dms_9" {
  title         = "9 DMS endpoints should use SSL"
  description   = "This control checks whether an AWS DMS endpoint uses an SSL connection. The control fails if the endpoint doesn't use SSL."
  severity      = "medium"
  query         = query.dms_endpoint_ssl_configured
  documentation = file("./foundational_security/docs/foundational_security_dms_9.md")

  tags = merge(local.foundational_security_dms_common_tags, {
    foundational_security_item_id  = "dms_9"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_dms_10" {
  title         = "10 DMS endpoints for Neptune databases should have IAM authorization enabled"
  description   = "This control checks whether an AWS DMS endpoint for an Amazon Neptune database is configured with IAM authorization. The control fails if the DMS endpoint doesn't have IAM authorization enabled."
  severity      = "medium"
  query         = query.dms_endpoint_neptune_database_iam_authorization_enabled
  documentation = file("./foundational_security/docs/foundational_security_dms_10.md")

  tags = merge(local.foundational_security_dms_common_tags, {
    foundational_security_item_id  = "dms_10"
    foundational_security_category = "passwordless_authentication"
  })
}

control "foundational_security_dms_11" {
  title         = "11 DMS endpoints for MongoDB should have an authentication mechanism enabled"
  description   = "This control checks whether an AWS DMS endpoint for MongoDB is configured with an authentication mechanism. The control fails if an authentication type isn't set for the endpoint."
  severity      = "medium"
  query         = query.dms_endpoint_mongo_db_authentication_enabled
  documentation = file("./foundational_security/docs/foundational_security_dms_11.md")

  tags = merge(local.foundational_security_dms_common_tags, {
    foundational_security_item_id  = "dms_11"
    foundational_security_category = "passwordless_authentication"
  })
}

control "foundational_security_dms_12" {
  title         = "12 DMS endpoints for Redis OSS should have TLS enabled"
  description   = "This control checks whether an AWS DMS endpoint for Redis OSS is configured with a TLS connection. The control fails if the endpoint doesn't have TLS enabled."
  severity      = "medium"
  query         = query.dms_endpoint_redis_tls_enabled
  documentation = file("./foundational_security/docs/foundational_security_dms_12.md")

  tags = merge(local.foundational_security_dms_common_tags, {
    foundational_security_item_id  = "dms_12"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_dms_13" {
  title         = "13 DMS replication instances should be configured to use multiple Availability Zones"
  description   = "This control checks whether an AWS Database Migration Service (AWS DMS) replication instance is configured to use multiple Availability Zones (Multi-AZ deployment). The control fails if the AWS DMS replication instance isn't configured to use a Multi-AZ deployment."
  severity      = "medium"
  query         = query.dms_replication_instance_multiple_az_enabled
  documentation = file("./foundational_security/docs/foundational_security_dms_13.md")

  tags = merge(local.foundational_security_dms_common_tags, {
    foundational_security_item_id  = "dms_13"
    foundational_security_category = "high_availability"
  })
}
