benchmark "nist_800_53_rev_4_ac_2_3" {
  title       = "AC-2(3) Disable Inactive Accounts"
  description = "The information system automatically disables inactive accounts after 90 days for user accounts."
  children = [
    control.iam_user_unused_credentials_90
  ]

  tags = local.nist_800_53_rev_4_common_tags
}