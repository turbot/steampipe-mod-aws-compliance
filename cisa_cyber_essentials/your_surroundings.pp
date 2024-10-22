benchmark "cisa_cyber_essentials_your_surroundings" {
  title       = "Your Surroundings"
  description = "As your organization's digital workplace, this is an essential element of your organization's Culture of Cyber Readiness. Your task for this element is to ensure only those who belong on your digital workplace have access to it."
  children = [
    benchmark.cisa_cyber_essentials_your_surroundings_1,
    benchmark.cisa_cyber_essentials_your_surroundings_2,
    benchmark.cisa_cyber_essentials_your_surroundings_3,
    benchmark.cisa_cyber_essentials_your_surroundings_4
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_your_surroundings_1" {
  title       = "Your Surroundings-1"
  description = "Learn who is on your network. Maintain inventories of network connections (user accounts, vendors, business partners, etc.)."
  children = [
    control.vpc_eip_associated,
    control.vpc_flow_logs_enabled,
    control.vpc_network_acl_unused
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_your_surroundings_2" {
  title       = "Your Surroundings-2"
  description = "Leverage multi-factor authentication for all users, starting with privileged, administrative and remote access users."
  children = [
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_your_surroundings_3" {
  title       = "Your Surroundings-3"
  description = "Grant access and admin permissions based on need-to-know and least privilege."
  children = [
    control.elb_application_network_lb_use_ssl_certificate,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys
  ]

  tags = local.cisa_cyber_essentials_common_tags
}

benchmark "cisa_cyber_essentials_your_surroundings_4" {
  title       = "Your Surroundings-4"
  description = "Leverage unique passwords for all user accounts."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24
  ]

  tags = local.cisa_cyber_essentials_common_tags
}
