locals {
  conformance_pack_emr_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EMR"
  })
}

control "emr_account_public_access_blocked" {
  title       = "EMR account public access should be blocked"
  description = "Manage access to resources in the AWS Cloud by ensuring Amazon EMR clusters cannot be made public."
  query       = query.emr_account_public_access_blocked

  tags = merge(local.conformance_pack_emr_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

control "emr_cluster_kerberos_enabled" {
  title       = "EMR cluster Kerberos should be enabled"
  description = "The access permissions and authorizations can be managed and incorporated with the principles of least privilege and separation of duties, by enabling Kerberos for AWS EMR clusters."
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
    nydfs_23                               = "true"
    pci_dss_v40                            = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "emr_cluster_master_nodes_no_public_ip" {
  title       = "EMR cluster master nodes should not have public IP addresses"
  description = "Manage access to the AWS Cloud by ensuring AWS EMR cluster master nodes cannot be publicly accessed."
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
    nydfs_23                               = "true"
    pci_dss_v321                           = "true"
    rbi_cyber_security                     = "true"
    rbi_itf_nbfc                           = "true"
    soc_2                                  = "true"
  })
}

control "emr_cluster_security_configuration_enabled" {
  title       = "EMR clusters should have security configuration enabled"
  description = "Ensure EMR cluster have security configuration enabled. This control fails if security configuration is not enabled for EMR cluster."
  query       = query.emr_cluster_security_configuration_enabled

  tags = local.conformance_pack_emr_common_tags
}

control "emr_cluster_encryption_at_rest_enabled" {
  title       = "EMR clusters encryption at rest should be enabled"
  description = "This control checks whether EMR clusters have encryption at rest enabled. The check fails if encryption at rest is not enabled as sensitive data should be protected."
  query       = query.emr_cluster_encryption_at_rest_enabled

  tags = local.conformance_pack_emr_common_tags
}

control "emr_cluster_encryption_in_transit_enabled" {
  title       = "EMR clusters encryption in transit should be enabled"
  description = "This control checks whether EMR clusters have encryption in transit enabled. This control fails if an EMR cluster isn't encrypted in transit."
  query       = query.emr_cluster_encryption_in_transit_enabled

  tags = merge(local.conformance_pack_emr_common_tags, {
    nist_csf_v2 = "true"
  })
}

control "emr_cluster_local_disk_encryption_enabled" {
  title       = "EMR clusters local disk encryption should be enabled"
  description = "This control checks whether EMR cluster have local disk encryption enabled. This control fails if an EMR cluster local disk isn't encrypted."
  query       = query.emr_cluster_local_disk_encryption_enabled

  tags = local.conformance_pack_emr_common_tags
}

control "emr_cluster_local_disk_encrypted_with_cmk" {
  title       = "EMR cluster local disks should be encrypted with CMK"
  description = "Ensure EMR cluster local disk are encrypted using CMK. This control fails if an EMR cluster local disk isn't encrypted with CMK."
  query       = query.emr_cluster_local_disk_encrypted_with_cmk

  tags = local.conformance_pack_emr_common_tags
}

control "emr_cluster_encryption_at_rest_with_sse_kms" {
  title       = "EMR clusters server side encryption (SSE KMS) enabled with KMS"
  description = "This control checks whether EMR clusters server side encryption (SSE KMS) is enabled with KMS. The check fails if encryption at rest is not enabled with SSE-KMS."
  query       = query.emr_cluster_encryption_at_rest_with_sse_kms

  tags = local.conformance_pack_emr_common_tags
}

control "emr_cluster_encryption_at_rest_with_cse_cmk" {
  title       = "EMR clusters client side encryption (CSE CMK) enabled with CMK"
  description = "This control checks whether EMR client side encryption (CSE CMK) is enabled with CMK. The check fails if encryption at rest is not enabled with CSE-CMK."
  query       = query.emr_cluster_encryption_at_rest_with_cse_cmk

  tags = local.conformance_pack_emr_common_tags
}

control "emr_security_configuration_encryption_at_rest_enabled" {
  title         = "Amazon EMR security configurations should be encrypted at rest"
  description   = "This control checks whether an Amazon EMR security configuration has encryption at rest enabled. The control fails if the security configuration doesn't enable encryption at rest."
  query         = query.emr_security_configuration_encryption_at_rest_enabled

  tags = local.conformance_pack_emr_common_tags
}

control "emr_security_configuration_encryption_in_transit_enabled" {
  title         = "Amazon EMR security configurations should be encrypted in transit"
  description   = "This control checks whether an Amazon EMR security configuration has encryption in transit enabled. The control fails if the security configuration doesn't enable encryption in transit."
  query         = query.emr_security_configuration_encryption_in_transit_enabled

  tags = local.conformance_pack_emr_common_tags
}

query "emr_account_public_access_blocked" {
  sql = <<-EOQ
    with emr_port_configuration as(
      select
        region,
        account_id
      from
        aws_emr_block_public_access_configuration,
        jsonb_array_elements(permitted_public_security_group_rule_ranges) as r
      where
        (r -> 'MaxRange')::int = 22
        and (r-> 'MinRange')::int = 22
        and block_public_security_group_rules
    )
    select
      'arn:' || c.partition || '::' || c.region || ':' || c.account_id as resource,
      case
        when not block_public_security_group_rules then 'alarm'
        when block_public_security_group_rules and p.region is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when not block_public_security_group_rules then c.region || ' EMR block public access disabled.'
        when block_public_security_group_rules and p.region is not null then c.region || ' EMR block public access enabled.'
        else c.region || ' EMR block public access enabled for ports other than 22.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_emr_block_public_access_configuration as c
      left join emr_port_configuration as p on p.region = c.region and p.account_id = c.account_id
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

query "emr_cluster_security_configuration_enabled" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when security_configuration is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when security_configuration is not null then title || ' security configuration enabled.'
        else title || ' security configuration disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_emr_cluster;
  EOQ
}

query "emr_cluster_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when s.name is null then 'alarm'
        when s.name is not null and (encryption_configuration -> 'EnableAtRestEncryption')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when s.name is null then c.title || ' security configuration disabled.'
        when s.name is not null and (encryption_configuration -> 'EnableAtRestEncryption')::bool then c.title || ' encryption at rest enabled.'
        else c.title || ' encryption at rest disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_emr_cluster as c
      left join aws_emr_security_configuration as s on c.security_configuration = s.name and s.region = s.region and s.account_id = c.account_id;
  EOQ
}

query "emr_cluster_encryption_in_transit_enabled" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when s.name is null then 'alarm'
        when s.name is not null and (encryption_configuration -> 'EnableInTransitEncryption')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when s.name is null then c.title || ' security configuration disabled.'
        when s.name is not null and (encryption_configuration -> 'EnableInTransitEncryption')::bool then c.title || ' encryption in transit enabled.'
        else c.title || ' encryption in transit disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_emr_cluster as c
      left join aws_emr_security_configuration as s on c.security_configuration = s.name and s.region = s.region and s.account_id = c.account_id;
  EOQ
}

query "emr_cluster_local_disk_encryption_enabled" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when s.name is null then 'alarm'
        when s.name is not null
          and (encryption_configuration -> 'EnableAtRestEncryption')::bool
          and (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'LocalDiskEncryptionConfiguration') is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when s.name is null then c.title || ' security configuration disabled.'
        when s.name is not null
          and (encryption_configuration -> 'EnableAtRestEncryption')::bool
          and (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'LocalDiskEncryptionConfiguration') is not null then c.title || ' local disk encryption enabled.'
        else c.title || ' local disk encryption disabled.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_emr_cluster as c
      left join aws_emr_security_configuration as s on c.security_configuration = s.name and s.region = s.region and s.account_id = c.account_id;
  EOQ
}

query "emr_cluster_local_disk_encrypted_with_cmk" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when s.name is null then 'alarm'
        when (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'LocalDiskEncryptionConfiguration') is null then 'alarm'
        when s.name is not null
          and (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'LocalDiskEncryptionConfiguration') is not null
          and  (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'LocalDiskEncryptionConfiguration' ->> 'EncryptionKeyProviderType') = 'Custom' then 'ok'
        else 'alarm'
      end as status,
      case
        when s.name is null then c.title || ' security configuration disabled.'
        when (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'LocalDiskEncryptionConfiguration') is null then c.title || ' local disk not encrypted.'
        when s.name is not null
          and (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'LocalDiskEncryptionConfiguration') is not null
          and  (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'LocalDiskEncryptionConfiguration' ->> 'EncryptionKeyProviderType') = 'Custom' then c.title || ' local disk encrypted with CMK.'
        else c.title || ' local disk not encrypted with CMK.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_emr_cluster as c
      left join aws_emr_security_configuration as s on c.security_configuration = s.name and s.region = s.region and s.account_id = c.account_id;
  EOQ
}

query "emr_cluster_encryption_at_rest_with_sse_kms" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when s.name is null then 'alarm'
        when not (encryption_configuration -> 'EnableAtRestEncryption')::bool then 'alarm'
        when (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'S3EncryptionConfiguration' ->> 'EncryptionMode') = 'SSE-KMS' then 'ok'
        else 'alarm'
      end as status,
      case
        when s.name is null then c.title || ' security configuration disabled.'
        when not (encryption_configuration -> 'EnableAtRestEncryption')::bool then c.title || ' encryption at rest disabled.'
        when (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'S3EncryptionConfiguration' ->> 'EncryptionMode') = 'SSE-KMS' then c.title || ' encryption at rest enabled with SSE KMS.'
        else c.title || ' encryption at rest not enabled with SSE KMS.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_emr_cluster as c
      left join aws_emr_security_configuration as s on c.security_configuration = s.name and s.region = s.region and s.account_id = c.account_id;
  EOQ
}

query "emr_cluster_encryption_at_rest_with_cse_cmk" {
  sql = <<-EOQ
    select
      cluster_arn as resource,
      case
        when s.name is null then 'alarm'
        when not (encryption_configuration -> 'EnableAtRestEncryption')::bool then 'alarm'
        when (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'S3EncryptionConfiguration' ->> 'EncryptionMode') = 'CSE-Custom' then 'ok'
        else 'alarm'
      end as status,
      case
        when s.name is null then c.title || ' security configuration disabled.'
        when not (encryption_configuration -> 'EnableAtRestEncryption')::bool then c.title || ' encryption at rest disabled.'
        when (encryption_configuration -> 'AtRestEncryptionConfiguration' -> 'S3EncryptionConfiguration' ->> 'EncryptionMode') = 'CSE-Custom' then c.title || ' encryption at rest enabled with CSE-CMK.'
        else c.title || ' encryption at rest not enabled with CSE-CMK.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "c.")}
    from
      aws_emr_cluster as c
      left join aws_emr_security_configuration as s on c.security_configuration = s.name and s.region = s.region and s.account_id = c.account_id;
  EOQ
}

query "emr_security_configuration_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when (encryption_configuration -> 'EnableAtRestEncryption')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (encryption_configuration -> 'EnableAtRestEncryption')::bool then title || ' encryption at rest enabled.'
        else title || ' encryption at rest disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_emr_security_configuration;
  EOQ
}

query "emr_security_configuration_encryption_in_transit_enabled" {
  sql = <<-EOQ
    select
      name as resource,
      case
        when (encryption_configuration -> 'EnableInTransitEncryption')::bool then 'ok'
        else 'alarm'
      end as status,
      case
        when (encryption_configuration -> 'EnableInTransitEncryption')::bool then title || ' encryption in transit enabled.'
        else title || ' encryption in transit disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_emr_security_configuration;
  EOQ
}