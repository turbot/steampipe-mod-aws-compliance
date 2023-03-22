benchmark "cis_controls_v8_ig1_12" {
  title       = "12 Network Infrastructure Management"
  description = "Establish, implement, and actively manage (track, report, correct) network devices, in order to prevent attackers from exploiting vulnerable network services and access points."
  children = [
    benchmark.cis_controls_v8_ig1_12_1
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_12_1" {
  title       = "12.1 Ensure Network Infrastructure is Up-to-Date"
  description = "Ensure network infrastructure is kept up-to-date. Example implementations include running the latest stable release of software and/or using currently supported network-as-a-service (NaaS) offerings. Review software versions monthly, or more frequently, to verify software support."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}
