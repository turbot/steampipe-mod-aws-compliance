locals {
  conformance_pack_ec2_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/EC2"
  })
}

control "ec2_ebs_default_encryption_enabled" {
  title       = "EBS default encryption should be enabled"
  description = "To help protect data at rest, ensure that encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  query       = query.ec2_ebs_default_encryption_enabled

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_detailed_monitoring_enabled" {
  title       = "EC2 instance detailed monitoring should be enabled"
  description = "Enable this rule to help improve Amazon Elastic Compute Cloud (Amazon EC2) instance monitoring on the Amazon EC2 console, which displays monitoring graphs with a 1-minute period for the instance."
  query       = query.ec2_instance_detailed_monitoring_enabled

  tags = merge(local.conformance_pack_ec2_common_tags, {
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_4                      = "true"
    nist_csf                               = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_not_use_multiple_enis" {
  title       = "EC2 instances should not use multiple ENIs"
  description = "This control checks whether an EC2 instance uses multiple Elastic Network Interfaces (ENIs) or Elastic Fabric Adapters (EFAs). This control passes if a single network adapter is used. The control includes an optional parameter list to identify the allowed ENIs."
  query       = query.ec2_instance_not_use_multiple_enis

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf = "true"
  })
}

control "ec2_instance_no_amazon_key_pair" {
  title       = "EC2 instances should not use key pairs in running state"
  description = "This control checks whether running EC2 instances are using key pairs. The control fails if a running EC2 instance uses a key pair."
  query       = query.ec2_instance_no_amazon_key_pair

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf = "true"
  })
}

control "ec2_instance_in_vpc" {
  title       = "EC2 instances should be in a VPC"
  description = "Deploy Amazon Elastic Compute Cloud (Amazon EC2) instances within an Amazon Virtual Private Cloud (Amazon VPC) to enable secure communication between an instance and other services within the amazon VPC, without requiring an internet gateway, NAT device, or VPN connection."
  query       = query.ec2_instance_in_vpc

  tags = merge(local.conformance_pack_ec2_common_tags, {
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

control "ec2_instance_not_publicly_accessible" {
  title       = "EC2 instances should not have a public IP address"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elastic Compute Cloud (Amazon EC2) instances cannot be publicly accessed."
  query       = query.ec2_instance_not_publicly_accessible

  tags = merge(local.conformance_pack_ec2_common_tags, {
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

control "ec2_instance_no_high_level_finding_in_inspector_scan" {
  title       = "EC2 instances high level findings should not be there in inspector scans"
  description = "Amazon Inspector scans operating system packages installed on your Amazon EC2 instances for vulnerabilities and network reachability issues. Each finding has the name of the detected vulnerability and provides a severity rating, information about the affected resource, and details such as how to remediate the reported vulnerability."
  query       = query.ec2_instance_no_high_level_finding_in_inspector_scan

  tags = merge(local.conformance_pack_ec2_common_tags, {
    other_checks = "true"
  })
}

control "ec2_stopped_instance_30_days" {
  title       = "EC2 stopped instances should be removed in 30 days"
  description = "Enable this rule to help with the baseline configuration of Amazon Elastic Compute Cloud (Amazon EC2) instances by checking whether Amazon EC2 instances have been stopped for more than the allowed number of days, according to your organization's standards."
  query       = query.ec2_stopped_instance_30_days

  tags = merge(local.conformance_pack_ec2_common_tags, {
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
  })
}

control "ec2_instance_ebs_optimized" {
  title       = "EC2 instance should have EBS optimization enabled"
  description = "An optimized instance in Amazon Elastic Block Store (Amazon EBS) provides additional, dedicated capacity for Amazon EBS I/O operations."
  query       = query.ec2_instance_ebs_optimized

  tags = merge(local.conformance_pack_ec2_common_tags, {
    audit_manager_control_tower            = "true"
    cis_controls_v8_ig1                    = "true"
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_uses_imdsv2" {
  title       = "EC2 instances should use IMDSv2"
  description = "Ensure the Instance Metadata Service Version 2 (IMDSv2) method is enabled to help protect access and control of Amazon Elastic Compute Cloud (Amazon EC2) instance metadata."
  query       = query.ec2_instance_uses_imdsv2

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cis_controls_v8_ig1                    = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_53_rev_4                      = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
  })
}

control "ec2_instance_protected_by_backup_plan" {
  title       = "EC2 instances should be protected by backup plan"
  description = "Ensure if Amazon Elastic Compute Cloud (Amazon EC2) instances are protected by a backup plan. The rule is non compliant if the Amazon EC2 instance is not covered by a backup plan."
  query       = query.ec2_instance_protected_by_backup_plan

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cisa_cyber_essentials                  = "true"
    fedramp_low_rev_4                      = "true"
    fedramp_moderate_rev_4                 = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    gxp_eu_annex_11                        = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    hipaa_security_rule_2003               = "true"
    nist_800_171_rev_2                     = "true"
    nist_csf                               = "true"
    pci_dss_v321                           = "true"
    soc_2                                  = "true"
  })
}

control "ec2_instance_iam_profile_attached" {
  title       = "EC2 instances should have IAM profile attached"
  description = "Ensure if an Amazon Elastic Compute Cloud (Amazon EC2) instance has an Identity and Access Management (IAM) profile attached to it. This rule is non compliant if no IAM profile is attached to the Amazon EC2 instance."
  query       = query.ec2_instance_iam_profile_attached

  tags = merge(local.conformance_pack_ec2_common_tags, {
    cis_controls_v8_ig1                    = "true"
    ffiec                                  = "true"
    gxp_21_cfr_part_11                     = "true"
    hipaa_final_omnibus_security_rule_2013 = "true"
    nist_800_171_rev_2                     = "true"
    nist_800_53_rev_5                      = "true"
    nist_csf                               = "true"
  })
}

control "ec2_instance_publicly_accessible_iam_profile_attached" {
  title       = "Public EC2 instances should have IAM profile attached"
  description = "Ensure Amazon Elastic Compute Cloud (Amazon EC2) public instances have an Identity and Access Management (IAM) profile attached to them. This rule is non compliant if no IAM profile is attached to public Amazon EC2 instance."
  query       = query.ec2_instance_publicly_accessible_iam_profile_attached

  tags = merge(local.conformance_pack_ec2_common_tags, {
    other_checks = "true"
  })
}

control "ec2_instance_user_data_no_secrets" {
  title       = "EC2 instances user data should not have secrets"
  description = "User data is a metadata field of an EC2 instance that allows custom code to run after the instance is launched. It contains code which is exposed to any entity which has the most basic access to EC2, even read-only configurations. It is recommended to not use secrets in user data."
  query       = query.ec2_instance_user_data_no_secrets

  tags = merge(local.conformance_pack_ec2_common_tags, {
    other_checks = "true"
  })
}

control "ec2_transit_gateway_auto_cross_account_attachment_disabled" {
  title       = "EC2 transit gateways should have auto accept shared attachments disabled"
  description = "Ensure transit gateways have auto accept shared attachments feature disabled. If this setting is disabled, then any VPC that attempts to attach to a transit gateway will need to request authorization, and the account that owns the transit gateway will need to accept the authorization."
  query       = query.ec2_transit_gateway_auto_cross_account_attachment_disabled

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf     = "true"
    other_checks = "true"
  })
}

control "ec2_instance_no_launch_wizard_security_group" {
  title       = "EC2 instances should not be attached to 'launch wizard' security groups"
  description = "Ensure EC2 instances provisioned in your AWS account are not associated with security groups that have their name prefixed with 'launch-wizard', in order to enforce using secure and custom security groups that exercise the principle of least privilege."
  query       = query.ec2_instance_no_launch_wizard_security_group

  tags = merge(local.conformance_pack_ec2_common_tags, {
    other_checks = "true"
  })
}

control "ec2_instance_virtualization_type_no_paravirtual" {
  title       = "Paravirtual EC2 instance types should not be used"
  description = "This control checks whether the virtualization type of an EC2 instance is paravirtual. The control fails if the virtualizationType of the EC2 instance is set to paravirtual."
  query       = query.ec2_instance_virtualization_type_no_paravirtual

  tags = merge(local.conformance_pack_ec2_common_tags, {
    nist_csf = "true"
  })
}

control "ec2_ami_restrict_public_access" {
  title       = "EC2 AMIs should restrict public access"
  description = "This control checks whether EC2 AMIs are set as private or not. The control fails if the EC2 AMIs are set as public."
  query       = query.ec2_ami_restrict_public_access

  tags = merge(local.conformance_pack_ec2_common_tags, {
    other_checks = "true"
  })
}

query "ec2_ebs_default_encryption_enabled" {
  sql = <<-EOQ
    select
      'arn:' || partition || '::' || region || ':' || account_id as resource,
      case
        when not default_ebs_encryption_enabled then 'alarm'
        else 'ok'
      end as status,
      case
        when not default_ebs_encryption_enabled then region || ' default EBS encryption disabled.'
        else region || ' default EBS encryption enabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_ec2_regional_settings;
  EOQ
}

query "ec2_instance_detailed_monitoring_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when monitoring_state = 'enabled' then 'ok'
        else 'alarm'
      end as status,
      case
        when monitoring_state = 'enabled' then instance_id || ' detailed monitoring enabled.'
        else instance_id || ' detailed monitoring disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_not_use_multiple_enis" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when jsonb_array_length(network_interfaces) = 1 then 'ok'
        else 'alarm'
      end status,
      title || ' has ' || jsonb_array_length(network_interfaces) || ' ENI(s) attached.'
      as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_no_amazon_key_pair" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when instance_state <> 'running' then 'skip'
        when key_name is null then 'ok'
        else 'alarm'
      end as status,
      case
        when instance_state <> 'running' then title || ' is in ' || instance_state || ' state.'
        when key_name is null then title || ' not launched using amazon key pairs.'
        else title || ' launched using amazon key pairs.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_in_vpc" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when vpc_id is null then 'alarm'
        else 'ok'
      end as status,
      case
        when vpc_id is null then title || ' not in VPC.'
        else title || ' in VPC.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_not_publicly_accessible" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when public_ip_address is null then 'ok'
        else 'alarm'
      end as status,
      case
        when public_ip_address is null then instance_id || ' not publicly accessible.'
        else instance_id || ' publicly accessible.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_no_high_level_finding_in_inspector_scan" {
  sql = <<-EOQ
    with severity_list as (
      select
        distinct title ,
        a ->> 'Value' as instance_id
      from
        aws_inspector_finding,
        jsonb_array_elements(attributes) as a
      where
        severity = 'High'
        and asset_type = 'ec2-instance'
        and a ->> 'Key' = 'INSTANCE_ID'
      group by
        a ->> 'Value',
        title
    ), ec2_istance_list as (
      select
        distinct instance_id
      from
        severity_list
    )
    select
      arn as resource,
      case
        when l.instance_id is null then 'ok'
        else 'alarm'
      end as status,
      case
        when l.instance_id is null then i.title || ' has no high level finding in inspector scans.'
        else i.title || ' has ' || (select count(*) from severity_list where instance_id = i.instance_id) || ' high level findings in inspector scans.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join ec2_istance_list as l on i.instance_id = l.instance_id;
  EOQ
}

query "ec2_stopped_instance_30_days" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when instance_state not in ('stopped', 'stopping') then 'skip'
        when state_transition_time <= (current_date - interval '30' day) then 'alarm'
        else 'ok'
      end as status,
      case
        when instance_state not in ('stopped', 'stopping') then title || ' is in ' || instance_state || ' state.'
        else title || ' stopped since ' || to_char(state_transition_time , 'DD-Mon-YYYY') || ' (' || extract(day from current_timestamp - state_transition_time) || ' days).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_ebs_optimized" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when ebs_optimized then 'ok'
        else 'alarm'
      end as status,
      case
        when ebs_optimized then title || ' EBS optimization enabled.'
        else title || ' EBS optimization disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_uses_imdsv2" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when metadata_options ->> 'HttpTokens' = 'optional' then 'alarm'
        else 'ok'
      end as status,
      case
        when metadata_options ->> 'HttpTokens' = 'optional' then title || ' not configured to use Instance Metadata Service Version 2 (IMDSv2).'
        else title || ' configured to use Instance Metadata Service Version 2 (IMDSv2).'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_protected_by_backup_plan" {
  sql = <<-EOQ
    with backup_protected_instance as (
      select
        resource_arn as arn
      from
        aws_backup_protected_resource as b
      where
        resource_type = 'EC2'
    )
    select
      i.arn as resource,
      case
        when b.arn is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when b.arn is not null then i.title || ' is protected by backup plan.'
        else i.title || ' is not protected by backup plan.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join backup_protected_instance as b on i.arn = b.arn;
  EOQ
}

query "ec2_instance_iam_profile_attached" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when iam_instance_profile_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when iam_instance_profile_id is not null then title || ' IAM profile attached.'
        else title || ' IAM profile not attached.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_instance_publicly_accessible_iam_profile_attached" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when iam_instance_profile_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when iam_instance_profile_id is not null then title || ' IAM profile attached.'
        else title || ' IAM profile not attached.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance
    where
      public_ip_address is not null;
  EOQ
}

query "ec2_instance_user_data_no_secrets" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when user_data like any (array ['%pass%', '%secret%','%token%','%key%'])
          or user_data ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' then 'alarm'
        else 'ok'
      end as status,
      case
        when user_data like any (array ['%pass%', '%secret%','%token%','%key%'])
          or user_data ~ '(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]' then instance_id ||' potential secret found in user data.'
        else instance_id ||  ' no secrets found in user data.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_transit_gateway_auto_cross_account_attachment_disabled" {
  sql = <<-EOQ
    select
      transit_gateway_arn as resource,
      case
        when auto_accept_shared_attachments = 'enable' then 'alarm'
        else 'ok'
      end as status,
      case
        when auto_accept_shared_attachments = 'enable' then title || ' automatic shared account attachment enabled.'
        else title || ' automatic shared account attachment disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_transit_gateway;
  EOQ
}

query "ec2_instance_no_launch_wizard_security_group" {
  sql = <<-EOQ
    with launch_wizard_sg_attached_instance as (
      select
        distinct arn as arn
      from
        aws_ec2_instance,
        jsonb_array_elements(security_groups) as sg
      where
        sg ->> 'GroupName' like 'launch-wizard%'
    )
    select
      i.arn as resource,
      case
        when sg.arn is null then 'ok'
        else 'alarm'
      end as status,
      case
        when sg.arn is null then i.title || ' not associated with launch-wizard security group.'
        else i.title || ' associated with launch-wizard security group.'
      end as reason
      ${local.tag_dimensions_sql}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "i.")}
    from
      aws_ec2_instance as i
      left join launch_wizard_sg_attached_instance as sg on i.arn = sg.arn;
  EOQ
}

query "ec2_instance_virtualization_type_no_paravirtual" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when virtualization_type = 'paravirtual' then 'alarm'
        else 'ok'
      end as status,
      title || ' virtualization type is ' || virtualization_type || '.' as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_ami_restrict_public_access" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':ec2:' || region || ':' || account_id || ':image/' || image_id as resource,
      case
        when public then 'alarm'
        else 'ok'
      end status,
      case
        when public then title || ' publicly accessible.'
        else title || ' not publicly accessible.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_ami;
  EOQ
}

# Non-Config rule query

query "ec2_classic_lb_connection_draining_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when connection_draining_enabled then 'ok'
        else 'alarm'
      end as status,
      case
        when connection_draining_enabled then title || ' connection draining enabled.'
        else title || ' connection draining disabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_classic_load_balancer;
  EOQ
}

query "ec2_instance_termination_protection_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when disable_api_termination then 'ok'
        else 'alarm'
      end status,
      case
        when disable_api_termination then instance_id || ' termination protection enabled.'
        else instance_id || ' termination protection disabled.'
      end reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_ec2_instance;
  EOQ
}

query "ec2_launch_template_not_publicly_accessible" {
  sql = <<-EOQ
    with public_launch_templates as (
      select
        i.tags ->> 'aws:ec2launchtemplate:id' as public_launch_template_id
      from
        aws_ec2_instance as i,
        jsonb_array_elements(launch_template_data -> 'NetworkInterfaces') as nic
      where
        (nic -> 'AssociatePublicIpAddress')::bool
    ),
    launch_templates_associated_instance as (
      select
        distinct tags ->> 'aws:ec2launchtemplate:id' as launch_template_id
      from
        aws_ec2_instance
    )
    select
      t.launch_template_id as resource,
      case
        when i.launch_template_id is null then 'skip'
        when t.launch_template_id in ( select public_launch_template_id from public_launch_templates ) then 'alarm'
        else 'ok'
      end as status,
      case
        when i.launch_template_id is null then t.title || ' does not launch any instance.'
        when t.launch_template_id in ( select public_launch_template_id from public_launch_templates ) then t.title || ' publicly accessible.'
        else t.title || ' not publicly accessible.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "t.")}
    from
      aws_ec2_launch_template as t
      left join launch_templates_associated_instance as i on i.launch_template_id = t.launch_template_id;
  EOQ
}