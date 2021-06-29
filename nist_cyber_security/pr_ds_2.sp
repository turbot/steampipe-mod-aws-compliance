benchmark "nist_cyber_security_pr_ds_2" {
  title       = "PR.DS-2"
  description = "Data-in-transit is protected."

  children = [
    control.elb_application_lb_redirect_http_request_to_https,
    control.elb_classic_lb_use_ssl_certificate,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_ds_2"
  })
}
