locals {
  conformance_pack_rds_common_tags = {
    service = "rds"
  }
}

control "rds_db_instance_backup_enabled" {
  title       = "RDS db instance backup should be enabled"
  description = "The backup feature of Amazon RDS creates backups of your databases and transaction logs."
  sql         = query.rds_db_instance_backup_enabled.sql
  tags        = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_encryption_at_rest_enabled" {
  title       = "RDS DB instance encryption at rest should be enabled"
  description = "To help protect data at rest, ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) instances."
  sql         = query.rds_db_instance_encryption_at_rest_enabled.sql
  tags        = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_multiple_az_enabled" {
  title       = "RDS db instance multiple az should be enabled"
  description = "Multi-AZ support in Amazon Relational Database Service (Amazon RDS) provides enhanced availability and durability for database instances."
  sql         = query.rds_db_instance_multiple_az_enabled.sql
  tags        = local.conformance_pack_rds_common_tags
}

control "rds_db_instance_prohibit_public_access" {
  title       = "RDS DB instances should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  sql         = query.rds_db_instance_prohibit_public_access.sql
  tags        = local.conformance_pack_rds_common_tags
}

control "rds_db_snapshot_encrypted_at_rest" {
  title       = "RDS DB snapshot should be encrypted at rest"
  description = "Ensure that encryption is enabled for your Amazon Relational Database Service (Amazon RDS) snapshots."
  sql         = query.rds_db_snapshot_encrypted_at_rest.sql
  tags        = local.conformance_pack_rds_common_tags
}

control "rds_snapshot_prohibit_public_access" {
  title       = "RDS snapshot should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  sql         = query.rds_snapshot_prohibit_public_access.sql
  tags        = local.conformance_pack_rds_common_tags
}
