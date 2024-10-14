benchmark "ffiec_d_1_g" {
  title       = "Governance (G)"
  description = "Governance includes oversight, strategies, policies, and IT asset management to implement an effective governance of the cybersecurity program."
  children = [
    benchmark.ffiec_d_1_g_it_b_1
  ]

  tags = local.ffiec_common_tags
}

benchmark "ffiec_d_1_g_it_b_1" {
  title       = "D1.G.IT.B.1"
  description = "An inventory of organizational assets (e.g., hardware, software, data, and systems hosted externally) is maintained."
  children = [
    control.ebs_attached_volume_delete_on_termination_enabled,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.vpc_eip_associated
  ]

  tags = local.ffiec_common_tags
}
