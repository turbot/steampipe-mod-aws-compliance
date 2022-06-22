benchmark "d_1_g" {
  title       = "Governance"
  description = "Governance includes oversight, strategies, policies, and IT asset management to implement an effective governance of the cybersecurity program."
  children = [
    benchmark.d_1_g_it_b_1
  ]

  tags = local.d_1_common_tags
}

benchmark "d_1_g_it_b_1" {
  title       = "D1.G.IT.B.1"
  description = "An inventory of organizational assets (e.g., hardware, software, data, and systems hosted externally) is maintained."
  children = [
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.ebs_volume_unused,
    control.ebs_attached_volume_delete_on_termination_enabled,
    control.vpc_eip_associated
  ]

  tags = merge(local.d_1_common_tags, {
    ffiec_item_id = "d_1_g_it_b_1"
  })
}
