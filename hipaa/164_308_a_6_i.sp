locals {
  hipaa_164_308_a_6_i_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "164_308_a_6_i"
  })
}

benchmark "hipaa_164_308_a_6_i" {
  title         = "164.308(a)(6)(i) Security incident procedures"
   description  = "Implement policies and procedures to address security incidents."
  #documentation = file("./hipaa/docs/hipaa_164_308_a_6_i.md")
  children = [
    control.hipaa_164_308_a_6_i_guardduty_enabled,
  ]
  tags          = local.hipaa_164_308_a_6_i_common_tags
}

control "hipaa_164_308_a_6_i_guardduty_enabled" {
  title         = "GuardDuty should be enabled"
  description   = "Amazon GuardDuty can help to monitor and detect potential cybersecurity events by using threat intelligence feeds."
  sql           = query.guardduty_enabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_6_i_guardduty_enabled.md")

  tags = merge(local.hipaa_164_308_a_6_i_common_tags, {
    service     = "guardduty"
  })
}
