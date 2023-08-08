locals {
  foundational_security_neptune_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Neptune"
  })
}

benchmark "foundational_security_neptune" {
  title         = "Neptune"
  documentation = file("./foundational_security/docs/foundational_security_neptune.md")
  children = [
    control.foundational_security_neptune_1,
    control.foundational_security_neptune_2,
    control.foundational_security_neptune_3,
    control.foundational_security_neptune_4,
    control.foundational_security_neptune_5,
    control.foundational_security_neptune_6,
    control.foundational_security_neptune_7,
    control.foundational_security_neptune_8
  ]

  tags = merge(local.foundational_security_neptune_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_neptune_1" {
  title         = "1 Neptune DB clusters should be encrypted at rest"
  description   = "This control checks whether a Neptune DB cluster is encrypted at rest. The control fails if a Neptune DB cluster isn't encrypted at rest."
  severity      = "medium"
  query         = query.neptune_db_cluster_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_neptune_1.md")

  tags = merge(local.foundational_security_neptune_common_tags, {
    foundational_security_item_id  = "neptune_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_neptune_2" {
  title         = "2 Neptune DB clusters should publish audit logs to CloudWatch Logs"
  description   = "This control checks whether a Neptune DB cluster publishes audit logs to Amazon CloudWatch Logs. The control fails if a Neptune DB cluster doesn't publish audit logs to CloudWatch Logs. EnableCloudWatchLogsExport should be set to Audit."
  severity      = "medium"
  query         = query.neptune_db_cluster_audit_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_neptune_2.md")

  tags = merge(local.foundational_security_neptune_common_tags, {
    foundational_security_item_id  = "neptune_2"
    foundational_security_category = "logging"
  })
}

control "foundational_security_neptune_3" {
  title         = "3 Neptune DB cluster snapshots should not be public"
  description   = "This control checks whether a Neptune manual DB cluster snapshot is public. The control fails if a Neptune manual DB cluster snapshot is public."
  severity      = "medium"
  query         = query.neptune_db_cluster_snapshot_prohibit_public_access
  documentation = file("./foundational_security/docs/foundational_security_neptune_3.md")

  tags = merge(local.foundational_security_neptune_common_tags, {
    foundational_security_item_id  = "neptune_3"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_neptune_4" {
  title         = "4 Neptune DB clusters should have deletion protection enabled"
  description   = "This control checks if a Neptune DB cluster has deletion protection enabled. The control fails if a Neptune DB cluster doesn't have deletion protection enabled."
  severity      = "low"
  query         = query.neptune_db_cluster_deletion_protection_enabled
  documentation = file("./foundational_security/docs/foundational_security_neptune_4.md")

  tags = merge(local.foundational_security_neptune_common_tags, {
    foundational_security_item_id  = "neptune_4"
    foundational_security_category = "data_deletion_protection"
  })
}

control "foundational_security_neptune_5" {
  title         = "5 Neptune DB clusters should have automated backups enabled"
  description   = "This control checks whether a Neptune DB cluster has automated backups enabled, and a backup retention period greater than or equal to 7 days. The control fails if backups aren't enabled for the Neptune DB cluster, or if the retention period is less than 7 days."
  severity      = "medium"
  query         = query.neptune_db_cluster_automated_backup_enabled
  documentation = file("./foundational_security/docs/foundational_security_neptune_5.md")

  tags = merge(local.foundational_security_neptune_common_tags, {
    foundational_security_item_id  = "neptune_5"
    foundational_security_category = "backups_enabled"
  })
}

control "foundational_security_neptune_6" {
  title         = "6 Neptune DB cluster snapshots should be encrypted at rest"
  description   = "This control checks whether a Neptune DB cluster snapshot is encrypted at rest. The control fails if a Neptune DB cluster isn't encrypted at rest."
  severity      = "medium"
  query         = query.neptune_db_cluster_snapshot_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_neptune_6.md")

  tags = merge(local.foundational_security_neptune_common_tags, {
    foundational_security_item_id  = "neptune_6"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_neptune_7" {
  title         = "7 Neptune DB clusters should have IAM database authentication enabled"
  description   = "This control checks if a Neptune DB cluster has IAM database authentication enabled. The control fails if IAM database authentication isn't enabled for a Neptune DB cluster."
  severity      = "medium"
  query         = query.neptune_db_cluster_iam_authentication_enabled
  documentation = file("./foundational_security/docs/foundational_security_neptune_7.md")

  tags = merge(local.foundational_security_neptune_common_tags, {
    foundational_security_item_id  = "neptune_7"
    foundational_security_category = "passwordless_authentication"
  })
}

control "foundational_security_neptune_8" {
  title         = "8 Neptune DB clusters should be configured to copy tags to snapshots"
  description   = "This control checks if a Neptune DB cluster is configured to copy all tags to snapshots when the snapshots are created. The control fails if a Neptune DB cluster isn't configured to copy tags to snapshots."
  severity      = "low"
  query         = query.neptune_db_cluster_copy_tags_to_snapshot_enabled
  documentation = file("./foundational_security/docs/foundational_security_neptune_8.md")

  tags = merge(local.foundational_security_neptune_common_tags, {
    foundational_security_item_id  = "neptune_8"
    foundational_security_category = "tagging"
  })
}
