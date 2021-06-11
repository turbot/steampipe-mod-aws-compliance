locals {
  conformance_pack_redshift_common_tags = {
    service = "redshift"
  }
}

control "redshift_cluster_encryption_in_transit_enabled" {
  title       = "Redshift cluster encryption in transit should be enabled"
  description = "Ensure that your Amazon Redshift clusters require TLS/SSL encryption to connect to SQL clients."
  sql         = query.redshift_cluster_encryption_in_transit_enabled.sql
  tags        = local.conformance_pack_redshift_common_tags
}

control "redshift_cluster_encryption_logging_enabled" {
  title       = "Audit logging and encryption should be enabled for Redshift cluster"
  description = "To protect data at rest, ensure that encryption is enabled for your Amazon Redshift clusters. You must also ensure that required configurations are deployed on Amazon Redshift clusters. The audit logging should be enabled to provide information about connections and user activities in the database."
  sql         = query.redshift_cluster_encryption_logging_enabled.sql
  tags        = local.conformance_pack_redshift_common_tags
}

control "redshift_cluster_prohibit_public_access" {
  title       = "Redshift cluster should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Redshift clusters are not public."
  sql         = query.redshift_cluster_prohibit_public_access.sql
  tags        = local.conformance_pack_redshift_common_tags
}
