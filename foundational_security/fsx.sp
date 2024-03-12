locals {
  foundational_security_fsx_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/FSx"
  })
}

benchmark "foundational_security_fsx" {
  title         = "FSx"
  documentation = file("./foundational_security/docs/foundational_security_fsx.md")
  children = [
    control.foundational_security_fsx_1
  ]

  tags = merge(local.foundational_security_fsx_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_fsx_1" {
  title         = "1 FSx for OpenZFS file systems should be configured to copy tags to backups and volumes"
  description   = "This control checks if an Amazon FSx for OpenZFS file system is configured to copy tags to backups and volumes. The control fails if the OpenZFS file system isn't configured to copy tags to backups and volumes."
  severity      = "medium"
  query         = query.fsx_file_system_copy_tags_to_backup_and_volume_enabled
  documentation = file("./foundational_security/docs/foundational_security_fsx_1.md")

  tags = merge(local.foundational_security_fsx_common_tags, {
    foundational_security_item_id  = "fsx_1"
    foundational_security_category = "tagging"
  })
}
