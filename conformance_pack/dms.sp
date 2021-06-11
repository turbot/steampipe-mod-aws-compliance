locals {
  conformance_pack_dms_common_tags = {
    service = "dms"
  }
}

control "dms_replication_instances_not_publicly_accessible" {
  title       = "AWS Database Migration Service replication instances should not be publicly accessible"
  description = "Manage access to the AWS Cloud by ensuring DMS replication instances cannot be publicly accessed."
  sql         = query.dms_replication_instances_not_publicly_accessible.sql
  tags        = local.conformance_pack_dms_common_tags
}
