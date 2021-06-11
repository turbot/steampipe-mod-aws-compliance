locals {
  conformance_pack_secretsmanager_common_tags = {
    service = "secretsmanager"
  }
}

control "secretsmanager_secret_automatic_rotation_enabled" {
  title       = "Secretsmanager secrets automatic rotation should be enabled"
  description = "This rule ensures AWS Secrets Manager secrets have rotation enabled. Rotating secrets on a regular schedule can shorten the period a secret is active, and potentially reduce the business impact if the secret is compromised."
  sql         = query.secretsmanager_secret_automatic_rotation_enabled.sql
  tags        = local.conformance_pack_secretsmanager_common_tags
}
