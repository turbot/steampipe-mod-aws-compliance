benchmark "gxp_21_cfr_part_11_11_200" {
  title       = "11.200 Electronic signature components and controls"
  description = "Electronic signatures that are not biometric (i.e., not based on a physical feature, like a fingerprint) must be made up of at least two distinct parts  (i.e.,user ID and password). Biometric electronic signature (e.g., fingerprint scan, retinal scan) can only be used by the individuals to whom they are assigned."

  children = [
    benchmark.gxp_21_cfr_part_11_11_200_a
  ]

  tags = local.gxp_21_cfr_part_11_common_tags
}

benchmark "gxp_21_cfr_part_11_11_200_a" {
  title       = "11.200(a) Biometric electronic signature components and controls"
  description = "(a) Electronic signatures that are not based upon biometrics shall: (1) Employ at least two distinct identification components such as an identification code and password. (i) When an individual executes a series of signings during a single, continuous period of controlled system access, the first signing shall be executed using all electronic signature components; subsequent signings shall be executed using at least one electronic signature component that is only executable by, and designed to be used only by, the individual. (ii) When an individual executes one or more signings not performed during a single, continuous period of controlled system access, each signing shall be executed using all of the electronic signature components. (2) Be used only by their genuine owners; and (3) Be administered and executed to ensure that attempted use of an individual's electronic signature by anyone other than its genuine owner requires collaboration of two or more individuals."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.iam_root_user_hardware_mfa_enabled,
    control.iam_root_user_mfa_enabled,
    control.iam_root_user_no_access_keys,
    control.iam_user_access_key_age_90,
    control.iam_user_console_access_mfa_enabled,
    control.iam_user_mfa_enabled
  ]

  tags = local.gxp_21_cfr_part_11_common_tags
}
