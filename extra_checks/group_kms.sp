locals {
  extra_checks_kms_common_tags = merge(local.extra_checks_common_tags, {
    service = "kms"
  })
}

benchmark "group_kms" {
  title       = "KMS Checks"
  description = "This group of KMS extra checks shows results of controls related to KMS service."
  children = [
    control.kms_cmk_not_public
  ]

  tags = local.extra_checks_kms_common_tags
}

control "kms_cmk_not_public" {
  title       = "Check exposed KMS keys"
  description = "Exposed KMS Keys or wide policy permissions my leave data unprotected. To determine the full extent of who or what currently has access to a customer master key (CMK) in AWS KMS; you must examine the CMK key policy; all grants that apply to the CMK; and potentially all AWS Identity and Access Management (IAM) policies. You might do this to determine the scope of potential usage of a CMK."
  sql         = query.kms_cmk_not_public.sql

  tags = merge(local.extra_checks_kms_common_tags, {
    extra_check_category = "data_protection"
  })
}
