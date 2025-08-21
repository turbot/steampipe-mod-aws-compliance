locals {
  foundational_security_fsx_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/FSx"
  })
}

benchmark "foundational_security_fsx" {
  title         = "FSx"
  documentation = file("./foundational_security/docs/foundational_security_fsx.md")
  children = [
    control.foundational_security_fsx_1,
    control.foundational_security_fsx_2,
    control.foundational_security_fsx_3,
    control.foundational_security_fsx_4,
    control.foundational_security_fsx_5
  ]

  tags = merge(local.foundational_security_fsx_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_fsx_1" {
  title         = "1 FSx for OpenZFS file systems should be configured to copy tags to backups and volumes"
  description   = "This control checks if an Amazon FSx for OpenZFS file system is configured to copy tags to backups and volumes. The control fails if the OpenZFS file system isn't configured to copy tags to backups and volumes."
  severity      = "low"
  query         = query.fsx_file_system_copy_tags_to_backup_and_volume_enabled
  documentation = file("./foundational_security/docs/foundational_security_fsx_1.md")

  tags = merge(local.foundational_security_fsx_common_tags, {
    foundational_security_item_id  = "fsx_1"
    foundational_security_category = "tagging"
  })
}

control "foundational_security_fsx_2" {
  title         = "2 FSx for Lustre file systems should be configured to copy tags to backups"
  description   = "This control checks whether an Amazon FSx for Lustre file system is configured to copy tags to backups and volumes. The control fails if the Lustre file system isn't configured to copy tags to backups and volumes."
  severity      = "low"
  query         = query.fsx_lustre_file_system_copy_tags_to_backup_enabled
  documentation = file("./foundational_security/docs/foundational_security_fsx_2.md")

  tags = merge(local.foundational_security_fsx_common_tags, {
    foundational_security_item_id  = "fsx_2"
    foundational_security_category = "tagging"
  })
}

control "foundational_security_fsx_3" {
  title         = "3 FSx for OpenZFS file systems should be configured for Multi-AZ deployment"
  description   = "This control checks whether an Amazon FSx for OpenZFS file system is configured to use the multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use the Multi-AZ deployment type."
  severity      = "medium"
  query         = query.fsx_openzfs_file_system_multi_az_deployment_enabled
  documentation = file("./foundational_security/docs/foundational_security_fsx_3.md")

  tags = merge(local.foundational_security_fsx_common_tags, {
    foundational_security_item_id  = "fsx_3"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_fsx_4" {
  title         = "4 FSx for NetApp ONTAP file systems should be configured for Multi-AZ deployment"
  description   = "This control checks whether an Amazon FSx for NetApp ONTAP file system is configured to use a multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use a Multi-AZ deployment type. You can optionally specify a list of deployment types to include in the evaluation."
  severity      = "medium"
  query         = query.fsx_netapp_ontap_file_system_multi_az_deployment_enabled
  documentation = file("./foundational_security/docs/foundational_security_fsx_4.md")

  tags = merge(local.foundational_security_fsx_common_tags, {
    foundational_security_item_id  = "fsx_4"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_fsx_5" {
  title         = "5 FSx for Windows File Server file systems should be configured for Multi-AZ deployment"
  description   = "This control checks whether an Amazon FSx for Windows File Server file system is configured to use the multiple Availability Zones (Multi-AZ) deployment type. The control fails if the file system isn't configured to use the Multi-AZ deployment type."
  severity      = "medium"
  query         = query.fsx_windows_file_system_multi_az_deployment_enabled
  documentation = file("./foundational_security/docs/foundational_security_fsx_5.md")

  tags = merge(local.foundational_security_fsx_common_tags, {
    foundational_security_item_id  = "fsx_5"
    foundational_security_category = "high_availability"
  })
}
