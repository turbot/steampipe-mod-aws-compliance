benchmark "nist_cyber_security_id_ra_3" {
  title       = "ID.RA-3"
  description = "Asset vulnerabilities are identified and documented."

  children = [
    control.guardduty_enabled,
    control.securityhub_enabled
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "id_ra_3"

  })
}
