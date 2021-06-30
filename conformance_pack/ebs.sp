locals {
  conformance_pack_ebs_common_tags = {
    service = "ebs"
  }
}

control "ebs_snapshot_not_publicly_restorable" {
  title       = "EBS snapshots should not be publicly restorable"
  description = "Manage access to the AWS Cloud by ensuring EBS snapshots are not publicly restorable."
  sql         = query.ebs_snapshot_not_publicly_restorable.sql

  tags = merge(local.conformance_pack_ebs_common_tags, {
    hipaa               = "true"
    nist_cyber_security = "true"
    rbi_cyber_security  = "true"
  })
}

control "ebs_volume_encryption_at_rest_enabled" {
  title       = "EBS volume encryption at rest should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql         = query.ebs_volume_encryption_at_rest_enabled.sql

  tags = merge(local.conformance_pack_ebs_common_tags, {
    hipaa              = "true"
    rbi_cyber_security = "true"
  })
}

control "ebs_attached_volume_encryption_enabled" {
  title       = "EBS attached volume encryption should be enabled"
  description = "Because sensitive data can exist and to help protect data at rest, ensure encryption is enabled for your Amazon Elastic Block Store (Amazon EBS) volumes."
  sql         = query.ebs_attached_volume_encryption_enabled.sql

  tags = merge(local.conformance_pack_ebs_common_tags, {
    nist_cyber_security = "true"
    rbi_cyber_security  = "true"
  })
}

control "ebs_volume_in_backup_plan" {
  title       = "EBS volumes should be in a backup plan"
  description = "To help with data back-up processes, ensure your Amazon Elastic Block Store (Amazon EBS) volumes are a part of an AWS Backup plan."
  sql         = query.ebs_volume_in_backup_plan.sql

  tags = merge(local.conformance_pack_ebs_common_tags, {
    rbi_cyber_security = "true"
  })
}

control "ebs_volume_inuse" {
  title       = "EBS volumes should be attached to EC2 instances"
  description = "To help identifying the un attached volumes and the volumes that are delete on termination set to disabled"
  sql         = query.ebs_volume_inuse.sql

  tags = merge(local.conformance_pack_ebs_common_tags, {
    nist_cyber_security = "true"
  })
}