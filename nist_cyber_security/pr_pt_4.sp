benchmark "nist_cyber_security_pr_pt_4" {
  title       = "PR.PT-4"
  description = "Communications and control networks are protected."

  children = [
    control.ec2_instance_in_vpc,
    control.es_domain_in_vpc,
    control.lambda_function_in_vpc,
    control.rds_db_instance_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "pr_pt_4"
  })
}
