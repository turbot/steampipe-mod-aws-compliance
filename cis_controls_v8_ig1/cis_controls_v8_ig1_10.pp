benchmark "cis_controls_v8_ig1_10" {
  title       = "10 Malware Defenses"
  description = "Prevent or control the installation, spread, and execution of malicious applications, code, or scripts on enterprise assets."
  children = [
    benchmark.cis_controls_v8_ig1_10_1,
    benchmark.cis_controls_v8_ig1_10_2
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_10_1" {
  title       = "10.1 Deploy and Maintain Anti-Malware Software"
  description = "Deploy and maintain anti-malware software on all enterprise assets."
  children = [
    control.guardduty_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}

benchmark "cis_controls_v8_ig1_10_2" {
  title       = "10.2 Configure Automatic Anti-Malware Signature Updates"
  description = "Configure automatic updates for anti-malware signature files on all enterprise assets."
  children = [
    control.guardduty_enabled
  ]

  tags = local.cis_controls_v8_ig1_common_tags
}
