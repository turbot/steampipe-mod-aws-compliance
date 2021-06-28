benchmark "nist_cyber_security_id_am_6" {
  title       = "ID.AM-6"
  description = "Cybersecurity roles and responsibilities for the entire workforce and third-party stakeholders (e.g., suppliers, customers, partners) are established."

  children = [
    control.iam_user_in_group,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "id_am_6"
  })
}
