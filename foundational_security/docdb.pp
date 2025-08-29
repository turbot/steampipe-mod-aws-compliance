locals {
  foundational_security_docdb_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/DocumentDB"
  })
}

benchmark "foundational_security_docdb" {
  title         = "DocumentDB"
  documentation = file("./foundational_security/docs/foundational_security_docdb.md")
  children = [
    control.foundational_security_docdb_1,
    control.foundational_security_docdb_2,
    control.foundational_security_docdb_3,
    control.foundational_security_docdb_4,
    control.foundational_security_docdb_5,
    control.foundational_security_docdb_6
  ]

  tags = merge(local.foundational_security_docdb_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_docdb_1" {
  title         = "1 Amazon DocumentDB clusters should be encrypted at rest"
  description   = "This control checks whether an Amazon DocumentDB cluster is encrypted at rest. The control fails if an Amazon DocumentDB cluster isn't encrypted at rest."
  severity      = "medium"
  query         = query.docdb_cluster_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_docdb_1.md")

  tags = merge(local.foundational_security_docdb_common_tags, {
    foundational_security_item_id  = "docdb_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_docdb_2" {
  title         = "2 Amazon DocumentDB clusters should have an adequate backup retention period"
  description   = "This control checks whether an Amazon DocumentDB cluster has a backup retention period greater than or equal to 7 days. The control fails if the backup retention period is less than 7 days."
  severity      = "medium"
  query         = query.docdb_cluster_backup_retention_period_7_days
  documentation = file("./foundational_security/docs/foundational_security_docdb_2.md")

  tags = merge(local.foundational_security_docdb_common_tags, {
    foundational_security_item_id  = "docdb_2"
    foundational_security_category = "backups_enabled"
  })
}

control "foundational_security_docdb_3" {
  title         = "3 Amazon DocumentDB manual cluster snapshots should not be public"
  description   = "This control checks whether an Amazon DocumentDB manual cluster snapshot is public. The control fails if the manual cluster snapshot is public."
  severity      = "critical"
  query         = query.docdb_cluster_snapshot_restrict_public_access
  documentation = file("./foundational_security/docs/foundational_security_docdb_3.md")

  tags = merge(local.foundational_security_docdb_common_tags, {
    foundational_security_item_id  = "docdb_3"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_docdb_4" {
  title         = "4 Amazon DocumentDB clusters should publish audit logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon DocumentDB cluster publishes audit logs to Amazon CloudWatch Logs. The control fails if the cluster doesn't publish audit logs to CloudWatch Logs."
  severity      = "medium"
  query         = query.docdb_cluster_instance_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_docdb_4.md")

  tags = merge(local.foundational_security_docdb_common_tags, {
    foundational_security_item_id  = "docdb_4"
    foundational_security_category = "logging"
  })
}

control "foundational_security_docdb_5" {
  title         = "5 Amazon DocumentDB clusters should have deletion protection enabled"
  description   = "This control checks whether an Amazon DocumentDB cluster has deletion protection enabled. The control fails if the cluster doesn't have deletion protection enabled."
  severity      = "medium"
  query         = query.docdb_cluster_deletion_protection_enabled
  documentation = file("./foundational_security/docs/foundational_security_docdb_5.md")

  tags = merge(local.foundational_security_docdb_common_tags, {
    foundational_security_item_id  = "docdb_5"
    foundational_security_category = "data_deletion_protection"
  })
}

control "foundational_security_docdb_6" {
  title         = "6 Amazon DocumentDB clusters should be encrypted in transit"
  description   = "This controls checks whether an Amazon DocumentDB cluster requires TLS for connections to the cluster. The control fails if the cluster parameter group associated with the cluster is not in sync, or the TLS cluster parameter is set to disabled or enabled."
  severity      = "medium"
  query         = query.docdb_cluster_encryption_in_transit_enabled
  documentation = file("./foundational_security/docs/foundational_security_docdb_6.md")

  tags = merge(local.foundational_security_docdb_common_tags, {
    foundational_security_item_id  = "docdb_6"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}
