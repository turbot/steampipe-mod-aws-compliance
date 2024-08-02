benchmark "nist_800_172_3_5" {
  title       = "3.5 Identification and Authentication"
  description = "IA controls are specific to the identification and authentication policies in an organization. This includes the identification and authentication of organizational and non-organizational users and how the management of those systems."
  children = [
    benchmark.nist_800_172_3_5_2_e
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_5_2_e" {
  title       = "3.5.2e Employ automated mechanisms for the generation, protection, rotation, and management of passwords for systems and system components that do not support multifactor authentication or complex account management"
  description = "In situations where static passwords or personal identification numbers (PIN) are used (e.g., certain system components do not support multifactor authentication or complex account management, such as separate system accounts for each user and logging), automated mechanisms (e.g., password managers) can automatically generate, rotate, manage, and store strong and different passwords for users and device accounts. For example, a router might have one administrator account, but an organization typically has multiple network administrators. Therefore, access management and accountability are problematic. A password manager uses techniques such as automated password rotation (in this example, for the router password) to allow a specific user to temporarily gain access to a device by checking out a temporary password and then checking the password back in to end the access. The password manager simultaneously logs these actions. One of the risks in using password managers is that an adversary may target the collection of passwords that the device generates. Therefore, it is important that these passwords are secured. Methods for protecting passwords include the use of multi-factor authentication to the password manager, encryption, or secured hardware (e.g., a hardware security module)."
  children = [
    control.iam_account_password_policy_strong_min_reuse_24,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_automatic_rotation_enabled
  ]

  tags = local.nist_800_172_common_tags
}
