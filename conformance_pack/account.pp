locals {
  conformance_pack_account_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/Account"
  })
}

control "account_part_of_organizations" {
  title       = "AWS account should be part of AWS Organizations"
  description = "Ensure that an AWS account is part of AWS Organizations. The rule is non-compliant if an AWS account is not part of AWS Organizations or AWS Organizations master account ID does not match rule parameter MasterAccountId."
  query       = query.account_part_of_organizations

  tags = merge(local.conformance_pack_iam_common_tags, {
    acsc_essential_eight = "true"
    cis_controls_v8_ig1  = "true"
    gxp_21_cfr_part_11   = "true"
    nist_800_53_rev_5    = "true"
    nist_csf             = "true"
    nist_csf_v2          = "true"
    pci_dss_v40          = "true"
  })
}

control "account_alternate_contact_security_registered" {
  title       = "Security contact information should be provided for an AWS account"
  description = "This control checks if an AWS Web Services (AWS) account has security contact information. The control fails if security contact information is not provided for the account."
  query       = query.account_alternate_contact_security_registered

  tags = merge(local.conformance_pack_account_common_tags, {
    pci_dss_v40 = "true"
  })
}

query "account_alternate_contact_security_registered" {
  sql = <<-EOQ
    with alternate_security_contact as (
      select
        name,
        account_id
      from
        aws_account_alternate_contact
      where
        contact_type = 'SECURITY'
    ),
    account as (
      select
        arn,
        partition,
        title,
        account_id,
        _ctx
      from
        aws_account
    )
    select
      arn as resource,
      case
        when a.partition = 'aws-us-gov' then 'info'
        -- Name is a required field if setting a security contact
        when c.name is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when a.partition = 'aws-us-gov' then a.title || ' in GovCloud, manual verification required.'
        when c.name is not null then a.title || ' has security contact ' || c.name || ' registered.'
        else a.title || ' security contact not registered.'
      end as reason
      ${replace(local.common_dimensions_qualifier_global_sql, "__QUALIFIER__", "a.")}
    from
      account as a
      left join alternate_security_contact as c on  c.account_id = a.account_id;
  EOQ
}

query "account_part_of_organizations" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when organization_id is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when organization_id is not null then title || ' is part of organization(s).'
        else title || ' is not part of organization.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_account;
  EOQ
}
