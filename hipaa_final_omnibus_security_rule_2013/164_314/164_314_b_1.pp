benchmark "hipaa_final_omnibus_security_rule_2013_164_314_b_1" {
  title       = "164.314(b)(1) Requirements for group health plans"
  description = "Except when the only electronic protected health information disclosed to a plan sponsor is disclosed pursuant to 164.504(f)(1)(ii) or (iii), or as authorized under 164.508, a group health plan must ensure that its plan documents provide that the plan sponsor will reasonably and appropriately safeguard electronic protected health information created, received, maintained, or transmitted to or by the plan sponsor on behalf of the group health plan."
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
    hipaa_final_omnibus_security_rule_2013_item_id = "164_314_b_1"
  })
}
