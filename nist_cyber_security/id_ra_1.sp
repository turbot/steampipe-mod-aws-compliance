benchmark "nist_cyber_security_id_ra_1" {
  title       = "ID.RA-1"
  description = "Asset vulnerabilities are identified and documented."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled,
    control.ssm_managed_instance_compliance_patch_compliant,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "id_ra_1"
  })
}
