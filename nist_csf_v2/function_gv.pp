benchmark "nist_csf_v2_gv" {
  title       = "Govern (GV)"
  description = "The organization's cybersecurity risk management strategy, expectations, and policy are established, communicated, and monitored."
  children = [
    benchmark.nist_csf_v2_gv_oc,
    benchmark.nist_csf_v2_gv_rm,
    benchmark.nist_csf_v2_gv_rr,
    benchmark.nist_csf_v2_gv_sc
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_oc" {
  title       = "Organizational Context (GV.OC)"
  description = "The circumstances — mission, stakeholder expectations, dependencies, and legal, regulatory, and contractual requirements — surrounding the organization's cybersecurity risk management decisions are understood."
  children = [
    benchmark.nist_csf_v2_gv_oc_02,
    benchmark.nist_csf_v2_gv_oc_03
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_oc_02" {
  title       = "GV.OC-02"
  description = "Internal and external stakeholders are understood, and their needs and expectations regarding cybersecurity risk management are understood and considered."
  children = [
    control.account_part_of_organizations,
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_group_user_role_no_inline_policies
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_oc_03" {
  title       = "GV.OC-03"
  description = "Legal, regulatory, and contractual requirements regarding cybersecurity — including privacy and civil liberties obligations — are understood and managed."
  children = [
    control.iam_policy_no_star_star,
    control.ssm_managed_instance_compliance_association_compliant,
    control.ssm_managed_instance_compliance_patch_compliant
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rm" {
  title       = "Risk Management Strategy (GV.RM)"
  description = "The organization's priorities, constraints, risk tolerance and appetite statements, and assumptions are established, communicated, and used to support operational risk decisions."
  children = [
    benchmark.nist_csf_v2_gv_rm_03
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rm_03" {
  title       = "GV.RM-03"
  description = "Cybersecurity risk management activities and outcomes are included in enterprise risk management processes."
  children = [
    control.iam_all_policy_no_service_wild_card,
    control.iam_policy_no_star_star
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rr" {
  title       = "Roles, Responsibilities, and Authorities (GV.RR)"
  description = "Cybersecurity roles, responsibilities, and authorities to foster accountability, performance assessment, and continuous improvement are established and communicated."
  children = [
    benchmark.nist_csf_v2_gv_rr_01,
    benchmark.nist_csf_v2_gv_rr_02,
    benchmark.nist_csf_v2_gv_rr_04
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rr_01" {
  title       = "GV.RR-01"
  description = "Organizational leadership is responsible and accountable for cybersecurity risk and fosters a culture that is risk-aware, ethical, and continually improving."
  children = [
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rr_02" {
  title       = "GV.RR-02"
  description = "Roles, responsibilities, and authorities related to cybersecurity risk management are established, communicated, understood, and enforced."
  children = [
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_rr_04" {
  title       = "GV.RR-04"
  description = "Cybersecurity is included in human resources practices."
  children = [
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_in_group,
    control.iam_user_mfa_enabled,
    control.iam_user_no_inline_attached_policies,
    control.iam_user_unused_credentials_90
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_sc" {
  title       = "Cybersecurity Supply Chain Risk Management (GV.SC)"
  description = "Cyber supply chain risk management processes are identified, established, managed, monitored, and improved by organizational stakeholders."
  children = [
    benchmark.nist_csf_v2_gv_sc_02
  ]
  tags = local.nist_csf_v2_common_tags
}

benchmark "nist_csf_v2_gv_sc_02" {
  title       = "GV.SC-02"
  description = "Cybersecurity roles and responsibilities for suppliers, customers, and partners are established, communicated, and coordinated internally and externally."
  children = [
    control.cloudwatch_cross_account_sharing,
    control.ec2_transit_gateway_auto_cross_account_attachment_disabled,
    control.iam_group_user_role_no_inline_policies,
    control.iam_custom_managed_policy_attached_to_role,
    control.sns_topic_policy_prohibit_cross_account_access
  ]
  tags = local.nist_csf_v2_common_tags
}