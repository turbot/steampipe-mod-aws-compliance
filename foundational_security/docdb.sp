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
    control.foundational_security_docdb_2
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

