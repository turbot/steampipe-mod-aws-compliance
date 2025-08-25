locals {
  foundational_security_efs_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/EFS"
  })
}

benchmark "foundational_security_efs" {
  title         = "EFS"
  documentation = file("./foundational_security/docs/foundational_security_efs.md")
  children = [
    control.foundational_security_efs_1,
    control.foundational_security_efs_2,
    control.foundational_security_efs_3,
    control.foundational_security_efs_4,
    control.foundational_security_efs_6,
    control.foundational_security_efs_7,
    control.foundational_security_efs_8
  ]

  tags = merge(local.foundational_security_efs_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_efs_1" {
  title         = "1 Amazon EFS should be configured to encrypt file data at rest using AWS KMS"
  description   = "This control checks whether Amazon Elastic File System is configured to encrypt the file data using AWS KMS."
  severity      = "medium"
  query         = query.efs_file_system_encrypt_data_at_rest
  documentation = file("./foundational_security/docs/foundational_security_efs_1.md")

  tags = merge(local.foundational_security_efs_common_tags, {
    foundational_security_item_id  = "efs_1"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_efs_2" {
  title         = "2 Amazon EFS volumes should be in backup plans"
  description   = "This control checks whether Amazon Elastic File System (Amazon EFS) file systems are added to the backup plans in AWS Backup. The control fails if Amazon EFS file systems are not included in the backup plans."
  severity      = "medium"
  query         = query.efs_file_system_protected_by_backup_plan
  documentation = file("./foundational_security/docs/foundational_security_efs_2.md")

  tags = merge(local.foundational_security_efs_common_tags, {
    foundational_security_item_id  = "efs_2"
    foundational_security_category = "backup"
  })
}

control "foundational_security_efs_3" {
  title         = "3 EFS access points should enforce a root directory"
  description   = "This control checks if Amazon EFS access points are configured to enforce a root directory. The control fails if the value of Path is set to / (the default root directory of the file system)."
  severity      = "medium"
  query         = query.efs_access_point_enforce_root_directory
  documentation = file("./foundational_security/docs/foundational_security_efs_3.md")

  tags = merge(local.foundational_security_efs_common_tags, {
    foundational_security_item_id  = "efs_3"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_efs_4" {
  title         = "4 EFS access points should enforce a user identity"
  description   = "This control checks whether Amazon EFS access points are configured to enforce a user identity. This control fails if a POSIX user identity is not defined while creating the EFS access point."
  severity      = "medium"
  query         = query.efs_access_point_enforce_user_identity
  documentation = file("./foundational_security/docs/foundational_security_efs_4.md")

  tags = merge(local.foundational_security_efs_common_tags, {
    foundational_security_item_id  = "efs_4"
    foundational_security_category = "secure_access_management"
  })
}

control "foundational_security_efs_6" {
  title         = "6 EFS mount targets should not be associated with subnets that assign public IP addresses on launch"
  description   = "This control checks whether an Amazon EFS mount target is associated with subnets that assign public IP addresses on launch. The control fails if the mount target is associated with subnets that assign public IP addresses on launch."
  severity      = "medium"
  query         = query.efs_mount_target_not_publicly_accessible
  documentation = file("./foundational_security/docs/foundational_security_efs_6.md")

  tags = merge(local.foundational_security_efs_common_tags, {
    foundational_security_item_id  = "efs_6"
    foundational_security_category = "resources_not_publicly_accessible"
  })
}

control "foundational_security_efs_7" {
  title         = "7 EFS file systems should have automatic backups enabled"
  description   = "This control checks whether an Amazon EFS file system has automatic backups enabled. This control fails if the EFS file system doesn't have automatic backups enabled."
  severity      = "medium"
  query         = query.efs_file_system_in_backup_plan
  documentation = file("./foundational_security/docs/foundational_security_efs_7.md")

  tags = merge(local.foundational_security_efs_common_tags, {
    foundational_security_item_id  = "efs_7"
    foundational_security_category = "backups_enabled"
  })
}

control "foundational_security_efs_8" {
  title         = "8 EFS file systems should be encrypted at rest"
  description   = "This control checks whether an Amazon EFS file system encrypts data with AWS Key Management Service (AWS KMS). The control fails if a file system isn't encrypted."
  severity      = "medium"
  query         = query.efs_file_system_encrypted_with_cmk
  documentation = file("./foundational_security/docs/foundational_security_efs_8.md")

  tags = merge(local.foundational_security_efs_common_tags, {
    foundational_security_item_id  = "efs_8"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}
