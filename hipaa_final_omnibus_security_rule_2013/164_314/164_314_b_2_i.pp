benchmark "hipaa_final_omnibus_security_rule_2013_164_314_b_2_i" {
  title       = "164.314(b)(2)(i)"
  description = "Implement administrative, physical, and technical safeguards that reasonably and appropriately protect the confidentiality, integrity, and availability of the electronic protected health information that it creates, receives, maintains, or transmits on behalf of the group health plan."
  children = [
    control.cloudtrail_trail_logs_encrypted_with_kms_cmk,
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
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_default_encryption_enabled,
    control.s3_bucket_default_encryption_enabled_kms,
    control.s3_bucket_enforces_ssl,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.sagemaker_endpoint_configuration_encryption_at_rest_enabled,
    control.sagemaker_notebook_instance_encryption_at_rest_enabled,
    control.vpc_configured_to_use_vpc_endpoints
  ]

  tags = merge(local.hipaa_final_omnibus_security_rule_2013_164_314_common_tags, {
    hipaa_final_omnibus_security_rule_2013_item_id = "164_314_b_2_i"
  })
}
