benchmark "hipaa_security_rule_2003_164_312_c_1" {
  title       = "164.312(c)(1) Integrity"
  description = "Implement policies and procedures to protect electronic protected health information from improper alteration or destruction."
  children = [
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
    control.cloudtrail_trail_validation_enabled,
    control.dax_cluster_encryption_at_rest_enabled,
    control.dynamodb_table_encryption_enabled,
    control.ebs_attached_volume_encryption_enabled,
    control.ebs_encryption_by_default_enabled,
    control.eks_cluster_secrets_encrypted,
    control.elb_classic_lb_use_tls_https_listeners,
    control.es_domain_encryption_at_rest_enabled,
    control.es_domain_node_to_node_encryption_enabled,
    control.opensearch_domain_encryption_at_rest_enabled,
    control.opensearch_domain_https_required,
    control.opensearch_domain_node_to_node_encryption_enabled,
    control.rds_db_instance_encryption_at_rest_enabled,
    control.rds_db_snapshot_encrypted_at_rest,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.redshift_cluster_kms_enabled,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_versioning_enabled
  ]

  tags = merge(local.hipaa_security_rule_2003_164_312_common_tags, {
    hipaa_security_rule_2003_item_id = "164_312_c_1"
  })
}
