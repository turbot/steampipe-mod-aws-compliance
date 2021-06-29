benchmark "nist_cyber_security_de_dp_5" {
  title       = "DE.DP-5"
  description = "Detection processes are continuously improved."

  children = [
    control.ec2_instance_detailed_monitoring_enabled,
  ]

  tags = merge(local.nist_cyber_security_common_tags, {
    nist_cyber_security_item_id = "de_dp_5"
  })
}