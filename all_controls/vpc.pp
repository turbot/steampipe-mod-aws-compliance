locals {
  all_controls_vpc_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/VPC"
  })
}

benchmark "all_controls_vpc" {
  title       = "VPC"
  description = "This section contains recommendations for configuring VPC resources."
  children = [
    control.vpc_block_public_access_restrict_internet_gateway_traffic,
    control.vpc_configured_to_use_interface_endpoint_for_docker_registry,
    control.vpc_configured_to_use_interface_endpoint_for_ecr_api,
    control.vpc_configured_to_use_interface_endpoint_for_ssm_contacts,
    control.vpc_configured_to_use_interface_endpoint_for_ssm_incidents,
    control.vpc_configured_to_use_interface_endpoint_for_ssm,
    control.vpc_configured_to_use_vpc_endpoints,
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_eip_associated,
    control.vpc_endpoint_service_acceptance_required_enabled,
    control.vpc_flow_logs_enabled,
    control.vpc_gateway_endpoint_restrict_public_access,
    control.vpc_igw_attached_to_authorized_vpc,
    control.vpc_in_more_than_one_region,
    control.vpc_network_acl_remote_administration,
    control.vpc_network_acl_unused,
    control.vpc_not_in_use,
    control.vpc_peering_connection_no_cross_account_access,
    control.vpc_peering_connection_route_table_least_privilege,
    control.vpc_route_table_restrict_public_access_to_igw,
    control.vpc_security_group_allows_ingress_authorized_ports,
    control.vpc_security_group_allows_ingress_to_cassandra_ports,
    control.vpc_security_group_allows_ingress_to_memcached_port,
    control.vpc_security_group_allows_ingress_to_mongodb_ports,
    control.vpc_security_group_allows_ingress_to_oracle_ports,
    control.vpc_security_group_associated_to_eni,
    control.vpc_security_group_not_uses_launch_wizard_sg,
    control.vpc_security_group_remote_administration_ipv4,
    control.vpc_security_group_remote_administration_ipv6,
    control.vpc_security_group_remote_administration,
    control.vpc_security_group_restrict_ingress_cifs_port_all,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_kafka_port,
    control.vpc_security_group_restrict_ingress_kibana_port,
    control.vpc_security_group_restrict_ingress_rdp_all,
    control.vpc_security_group_restrict_ingress_redis_port,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all,
    control.vpc_security_group_restricted_common_ports,
    control.vpc_security_group_unused,
    control.vpc_subnet_auto_assign_public_ip_disabled,
    control.vpc_subnet_multi_az_enabled,
    control.vpc_subnet_public_and_private,
    control.vpc_vpn_connection_logging_enabled,
    control.vpc_vpn_tunnel_up
  ]

  tags = merge(local.all_controls_vpc_common_tags, {
    type = "Benchmark"
  })
}
