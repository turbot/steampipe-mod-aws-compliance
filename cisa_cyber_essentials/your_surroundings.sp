locals {
  cisa_cyber_essentials_your_surroundings_common_tags = merge(local.cisa_cyber_essentials_common_tags, {
    section = "your_surroundings"
  })
}

benchmark "cisa_cyber_essentials_your_surroundings" {
  title       = "Your Surroundings"
  description = "to do"
  children = [
    benchmark.cisa_cyber_essentials_your_surroundings_1,
    benchmark.cisa_cyber_essentials_your_surroundings_2,
    benchmark.cisa_cyber_essentials_your_surroundings_3,
    benchmark.cisa_cyber_essentials_your_surroundings_4,
  ]

  tags = local.cisa_cyber_essentials_your_surroundings_common_tags
}


benchmark "cisa_cyber_essentials_your_surroundings_1" {
  title       = "Your surroundings-1"
  description = "Learn what is on your network. Maintain inventories of hardware and software assets to know what is in play and at-risk from attack."
  children = [
    control.vpc_eip_associated,
    control.vpc_flow_logs_enabled,
    control.vpc_network_acl_unused,
  ]

  tags = merge(local.cisa_cyber_essentials_your_surroundings_common_tags, {
    item = "your_surroundings_1"
  })
}


benchmark "cisa_cyber_essentials_your_surroundings_2" {
  title       = "Your surroundings-2"
  description = "Learn what is on your network. Maintain inventories of hardware and software assets to know what is in play and at-risk from attack."
  children = [
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_root_user_hardware_mfa_enabled,
  ]

  tags = merge(local.cisa_cyber_essentials_your_surroundings_common_tags, {
    item = "your_surroundings_2"
  })
}


benchmark "cisa_cyber_essentials_your_surroundings_3" {
  title       = "Your surroundings-3"
  description = "Learn what is on your network. Maintain inventories of hardware and software assets to know what is in play and at-risk from attack."
  children = [
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys
  ]

  tags = merge(local.cisa_cyber_essentials_your_surroundings_common_tags, {
    item = "your_surroundings_1"
  })
}


benchmark "cisa_cyber_essentials_your_surroundings_4" {
  title       = "Your surroundings-4"
  description = "Learn what is on your network. Maintain inventories of hardware and software assets to know what is in play and at-risk from attack."
  children = [
    control.iam_account_password_policy_min_length_14
  ]

  tags = merge(local.cisa_cyber_essentials_your_surroundings_common_tags, {
    item = "your_surroundings_1"
  })
}
