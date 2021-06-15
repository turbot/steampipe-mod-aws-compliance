locals {
  common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_312_e_1"
  })
}

benchmark "hipaa_164_312_e_1" {
  title       = "164.312(e)(1) Transmission security"
  description = "Implement technical security measures to guard against unauthorized access to electronic protected health information that is being transmitted over an electronic communications network."
  children = [
    control.ec2_instance_in_vpc,
    control.elb_classic_lb_use_ssl_certificate,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.redshift_cluster_encryption_in_transit_enabled,
    control.s3_bucket_enforces_ssl,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
  ]
  tags = local.common_tags
}