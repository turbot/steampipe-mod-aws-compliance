locals {
  foundational_security_secretsmanager_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/SecretsManager"
  })
}

benchmark "foundational_security_secretsmanager" {
  title         = "Secrets Manager"
  documentation = file("./foundational_security/docs/foundational_security_secretsmanager.md")
  children = [
    control.foundational_security_secretsmanager_1,
    control.foundational_security_secretsmanager_2,
    control.foundational_security_secretsmanager_3,
    control.foundational_security_secretsmanager_4
  ]

  tags = merge(local.foundational_security_secretsmanager_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_secretsmanager_1" {
  title         = "1 Secrets Manager secrets should have automatic rotation enabled"
  description   = "This control checks whether a secret stored in AWS Secrets Manager is configured with automatic rotation. Secrets Manager helps you improve the security posture of your organization. Secrets include database credentials, passwords, and third-party API keys. You can use Secrets Manager to store secrets centrally, encrypt secrets automatically, control access to secrets, and rotate secrets safely and automatically."
  severity      = "medium"
  query         = query.secretsmanager_secret_automatic_rotation_enabled
  documentation = file("./foundational_security/docs/foundational_security_secretsmanager_1.md")

  tags = merge(local.foundational_security_secretsmanager_common_tags, {
    foundational_security_item_id  = "secretsmanager_1"
    foundational_security_category = "secure_development"
  })
}

control "foundational_security_secretsmanager_2" {
  title         = "2 Secrets Manager secrets configured with automatic rotation should rotate successfully"
  description   = "This control checks whether an AWS Secrets Manager secret rotated successfully based on the rotation schedule. The control fails if RotationOccurringAsScheduled is false. The control does not evaluate secrets that do not have rotation configured."
  severity      = "medium"
  query         = query.secretsmanager_secret_rotated_as_scheduled
  documentation = file("./foundational_security/docs/foundational_security_secretsmanager_2.md")

  tags = merge(local.foundational_security_secretsmanager_common_tags, {
    foundational_security_item_id  = "secretsmanager_2"
    foundational_security_category = "secure_development"
  })
}

control "foundational_security_secretsmanager_3" {
  title         = "3 Remove unused Secrets Manager secrets"
  description   = "This control checks whether an AWS Secrets Manager secret has been accessed within the specified time frame. The control fails if a secret is unused beyond the specified time frame. Unless you provide a custom parameter value for the access period, Security Hub uses a default value of 90 days"
  severity      = "medium"
  query         = query.secretsmanager_secret_unused_90_day
  documentation = file("./foundational_security/docs/foundational_security_secretsmanager_3.md")

  tags = merge(local.foundational_security_secretsmanager_common_tags, {
    foundational_security_item_id  = "secretsmanager_3"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_secretsmanager_4" {
  title         = "4 Secrets Manager secrets should be rotated within a specified number of days"
  description   = "This control checks whether your secrets have been rotated at least once within 90 days. Rotating secrets can help you to reduce the risk of an unauthorized use of your secrets in your AWS account. Examples include database credentials, passwords, third-party API keys, and even arbitrary text. If you do not change your secrets for a long period of time, the secrets are more likely to be compromised."
  severity      = "medium"
  query         = query.secretsmanager_secret_automatic_rotation_lambda_enabled
  documentation = file("./foundational_security/docs/foundational_security_secretsmanager_4.md")

  tags = merge(local.foundational_security_secretsmanager_common_tags, {
    foundational_security_item_id  = "secretsmanager_4"
    foundational_security_category = "secure_access_management"
  })
}
