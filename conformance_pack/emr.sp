locals {
  conformance_pack_emr_common_tags = {
    service = "emr"
  }
}

control "emr_cluster_kerberos_enabled" {
  title       = "EMR cluster kerberos should be enabled"
  description = "The access permissions and authorizations can be managed and incorporated with the principles of least privilege and separation of duties, by enabling Kerberos for Amazon EMR clusters."
  sql         = query.emr_cluster_kerberos_enabled.sql
  tags        = local.conformance_pack_emr_common_tags
}

control "emr_cluster_master_nodes_no_public_ip" {
  title       = "EMR cluster master nodes should be with no public ip"
  description = "Manage access to the AWS Cloud by ensuring Amazon EMR cluster master nodes cannot be publicly accessed."
  sql         = query.emr_cluster_master_nodes_no_public_ip.sql
  tags        = local.conformance_pack_emr_common_tags
}