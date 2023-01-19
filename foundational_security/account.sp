locals {
  foundational_security_account_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/Account"
  })
}

benchmark "foundational_security_account" {
  title         = "Account"
  documentation = file("./foundational_security/docs/foundational_security_account.md")
  children = [
    control.foundational_security_account_1
  ]

  tags = merge(local.foundational_security_account_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_account_1" {
  title         = "1 Security contact information should be provided for an AWS account"
  description   = "This control checks if an Amazon Web Services (AWS) account has security contact information. The control fails if security contact information is not provided for the account."
  severity      = "medium"
  query         = query.account_alternate_contact_security_registered
  documentation = file("./foundational_security/docs/foundational_security_account_1.md")

  tags = merge(local.foundational_security_account_common_tags, {
    foundational_security_item_id  = "account_1"
    foundational_security_category = "resource_configuration"
  })
}
