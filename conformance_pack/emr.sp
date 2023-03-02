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
    ffiec              = "true"
    gxp_21_cfr_part_11 = "true"
    hipaa              = "true"
    nist_800_171_rev_2 = "true"
    nist_800_53_rev_4  = "true"
    nist_csf           = "true"
  })
}

control "emr_cluster_master_nodes_no_public_ip" {
  title       = "EMR cluster master nodes should not have public IP addresses"
  description = "Manage access to the AWS Cloud by ensuring Amazon EMR cluster master nodes cannot be publicly accessed."
  query       = query.emr_cluster_master_nodes_no_public_ip

  tags = merge(local.conformance_pack_emr_common_tags, {
    audit_manager_pci_v321_requirement_1 = "true"
    audit_manager_pci_v321_requirement_2 = "true"
    cisa_cyber_essentials                = "true"
    fedramp_low_rev_4                    = "true"
    fedramp_moderate_rev_4               = "true"
    ffiec                                = "true"
    gxp_21_cfr_part_11                   = "true"
    hipaa                                = "true"
    nist_800_171_rev_2                   = "true"
    nist_800_53_rev_4                    = "true"
    nist_800_53_rev_5                    = "true"
    nist_csf                             = "true"
    rbi_cyber_security                   = "true"
  })
}
