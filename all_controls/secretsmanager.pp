locals {
  all_controls_secretsmanager_common_tags = merge(local.all_controls_common_tags, {
    service = "AWS/SecretsManager"
  })
}

benchmark "all_controls_secretsmanager" {
  title       = "Secrets Manager"
  description = "This section contains recommendations for configuring Secrets Manager resources."
  children = [
    control.secretsmanager_secret_automatic_rotation_enabled,
    control.secretsmanager_secret_automatic_rotation_lambda_enabled,
    control.secretsmanager_secret_encrypted_with_kms_cmk,
    control.secretsmanager_secret_last_changed_90_day,
    control.secretsmanager_secret_last_changed_365_day,
    control.secretsmanager_secret_last_used_1_day,
    control.secretsmanager_secret_rotated_as_scheduled,
    control.secretsmanager_secret_unused_90_day
  ]

  tags = merge(local.all_controls_secretsmanager_common_tags, {
    type = "Benchmark"
  })
}
