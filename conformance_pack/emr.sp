locals {
  conformance_pack_emr_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EMR"
  })
}

control "emr_account_public_access_blocked" {
  title       = "EMR public access should be blocked at account level"
  description = "The block public access feature prevents a cluster in a public subnet from launching when any security group associated with the cluster has a rule that allows inbound traffic from IPv4 0.0.0.0/0 or IPv6 ::/0 (public access) on a port, unless the port has been specified as an exception - port 22 is an exception by default. This feature is enabled by default for each AWS Region in your AWS account and is not recommended to be turned off."
  query       = query.emr_account_public_access_blocked

  tags = merge(local.conformance_pack_emr_common_tags, {
    other_checks = "true"
  })
}

control "emr_cluster_kerberos_enabled" {
  title       = "EMR cluster Kerberos should be enabled"
  description = "The access permissions and authorizations can be managed and incorporated with the principles of least privilege and separation of duties, by enabling Kerberos for Amazon EMR clusters."
  query       = query.emr_cluster_kerberos_enabled

  tags = merge(local.conformance_pack_emr_common_tags, {
    cis_controls_v8_ig1                    = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    soc_2                                  = "true"
  })
}

control "emr_cluster_master_nodes_no_public_ip" {
  title       = "EMR cluster master nodes should not have public IP addresses"
  description = "Manage access to the AWS Cloud by ensuring Amazon EMR cluster master nodes cannot be publicly accessed."
  query       = query.emr_cluster_master_nodes_no_public_ip

  tags = merge(local.conformance_pack_emr_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    soc_2                                  = "true"
  })
}

query "emr_account_public_access_blocked" {
  sql = <<-EOQ
    select
      'arn:' || partition || '::' || region || ':' || account_id as resource,
      case
        when block_public_security_group_rules then 'ok'
        else 'alarm'
      end as status,
      case
        when block_public_security_group_rules then region || ' EMR block public access enabled.'
        else region || ' EMR block public access disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_emr_block_public_access_configuration;
  EOQ
}

query "emr_cluster_kerberos_enabled" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when kerberos_attributes is null then 'alarm'
        else 'ok'
      end as status,
      case
        when kerberos_attributes is null then title || ' Kerberos not enabled.'
        else title || ' Kerberos enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_emr_cluster;
  EOQ
}

query "emr_cluster_master_nodes_no_public_ip" {
  sql = <<-EOQ
    select
      c.cluster_arn as resource,
      case
        when c.status ->> 'State' not in ('RUNNING', 'WAITING') then 'skip'
        when s.map_public_ip_on_launch then 'alarm'
        else 'ok'
      end as status,
      case
        when c.status ->> 'State' not in ('RUNNING', 'WAITING') then c.title || ' is in ' || (c.status ->> 'State') || ' state.'
        when s.map_public_ip_on_launch then c.title || ' master nodes assigned with public IP.'
        else c.title || ' master nodes not assigned with public IP.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_emr_cluster as c
      left join aws_vpc_subnet as s on c.ec2_instance_attributes ->> 'Ec2SubnetId' = s.subnet_id;
  EOQ
}


