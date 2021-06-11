locals {
  rbi_annex_i_7_2_common_tags = merge(local.rbi_common_tags, {
    rbi_item_id = "annex_i_7_2"
  })
}

benchmark "rbi_annex_i_7_2" {
  title       = "Annex_I(7.2)"
  description = "TODO"
  children = [
    control.rbi_annex_i_7_2_iam_account_password_policy_strong_min_reuse_24
  ]
  tags = local.rbi_annex_i_7_2_common_tags
}

control "rbi_annex_i_7_2_iam_account_password_policy_strong_min_reuse_24" {
  title       = "Password policies for IAM users should have strong configurations"
  description = "The identities and the credentials are issued, managed, and verified based on an organizational IAM password policy. They meet or exceed requirements as stated by NIST SP 800-63 and the Centers for Internet Security (CIS) AWS Foundations Benchmark for password strength."
  sql         = query.iam_account_password_policy_strong_min_reuse_24.sql

  tags = merge(local.rbi_annex_i_7_2_common_tags, {
    service = "iam"
  })
}