locals {
  cis_v500_2_common_tags = merge(local.cis_v500_common_tags, {
    cis_section_id = "2"
  })
}

locals {
  cis_v500_2_1_common_tags = merge(local.cis_v500_2_common_tags, {
    cis_section_id = "2.1"
  })
  cis_v500_2_2_common_tags = merge(local.cis_v500_2_common_tags, {
    cis_section_id = "2.2"
  })
  cis_v500_2_3_common_tags = merge(local.cis_v500_2_common_tags, {
    cis_section_id = "2.3"
  })
}

benchmark "cis_v500_2" {
  title         = "2 Storage"
  documentation = file("./cis_v500/docs/cis_v500_2.md")
  children = [
    benchmark.cis_v500_2_1,
    benchmark.cis_v500_2_2,
    benchmark.cis_v500_2_3
  ]

  tags = merge(local.cis_v500_2_common_tags, {
    type = "Benchmark"
  })
}

benchmark "cis_v500_2_1" {
  title         = "2.1 Simple Storage Service (S3)"
  documentation = file("./cis_v500/docs/cis_v500_2_1.md")
  children = [
    control.cis_v500_2_1_1,
    control.cis_v500_2_1_2,
    control.cis_v500_2_1_3,
    control.cis_v500_2_1_4
  ]

  tags = merge(local.cis_v500_2_1_common_tags, {
    service = "AWS/S3"
    type    = "Benchmark"
  })
}

control "cis_v500_2_1_1" {
  title         = "2.1.1 Ensure S3 Bucket Policy is set to deny HTTP requests"
  description   = "At the Amazon S3 bucket level, you can configure permissions through a bucket policy, making the objects accessible only through HTTPS."
  documentation = file("./cis_v500/docs/cis_v500_2_1_1.md")
  query         = query.s3_bucket_enforces_ssl

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.1"
    cis_level   = "2"
    cis_type    = "automated"
    service     = "AWS/S3"
  })
}

control "cis_v500_2_1_2" {
  title         = "2.1.2 Ensure MFA Delete is enabled on S3 buckets"
  description   = "Once MFA Delete is enabled on your sensitive and classified S3 bucket, it requires the user to provide two forms of authentication."
  documentation = file("./cis_v500/docs/cis_v500_2_1_2.md")
  query         = query.s3_bucket_mfa_delete_enabled

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.2"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/S3"
  })
}

control "cis_v500_2_1_3" {
  title         = "2.1.3 Ensure all data in Amazon S3 has been discovered, classified, and secured when necessary"
  description   = "Amazon S3 buckets can contain sensitive data that, for security purposes, should be discovered, monitored, classified, and protected. Macie, along with other third-party tools, can automatically provide an inventory of Amazon S3 buckets."
  documentation = file("./cis_v500/docs/cis_v500_2_1_3.md")
  query         = query.s3_bucket_protected_by_macie

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.3"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/S3"
  })
}

control "cis_v500_2_1_4" {
  title         = "2.1.4 Ensure that S3 is configured with 'Block Public Access' enabled"
  description   = "Amazon S3 provides Block public access (bucket settings) and Block public access (account settings) to help you manage public access to Amazon S3 resources. By default, S3 buckets and objects are created with public access disabled. However, an IAM principal with sufficient S3 permissions can enable public access at the bucket and/or object level. While enabled, Block public access (bucket settings) prevents an individual bucket and its contained objects from becoming publicly accessible. Similarly, Block public access (account settings) prevents all buckets and their contained objects from becoming publicly accessible across the entire account."
  documentation = file("./cis_v500/docs/cis_v500_2_1_4.md")
  query         = query.s3_public_access_block_bucket_account

  tags = merge(local.cis_v500_2_1_common_tags, {
    cis_item_id = "2.1.4"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/S3"
  })
}

benchmark "cis_v500_2_2" {
  title         = "2.2 Relational Database Service (RDS)"
  documentation = file("./cis_v500/docs/cis_v500_2_2.md")
  children = [
    control.cis_v500_2_2_1,
    control.cis_v500_2_2_2,
    control.cis_v500_2_2_3,
    control.cis_v500_2_2_4
  ]

  tags = merge(local.cis_v500_2_2_common_tags, {
    service = "AWS/RDS"
    type    = "Benchmark"
  })
}

control "cis_v500_2_2_1" {
  title         = "2.2.1 Ensure that encryption-at-rest is enabled for RDS Instances"
  description   = "Amazon RDS encrypted DB instances use the industry-standard AES-256 encryption algorithm to encrypt your data on the server that hosts your Amazon RDS DB instances. After your data is encrypted, Amazon RDS handles the authentication of access and the decryption of your data transparently, with minimal impact on performance."
  documentation = file("./cis_v500/docs/cis_v500_2_2_1.md")
  query         = query.rds_db_instance_encryption_at_rest_enabled

  tags = merge(local.cis_v500_2_2_common_tags, {
    cis_item_id = "2.3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/RDS"
  })
}

control "cis_v500_2_2_2" {
  title         = "2.2.2 Ensure the Auto Minor Version Upgrade feature is enabled for RDS instances"
  description   = "Ensure that RDS database instances have the Auto Minor Version Upgrade flag enabled to automatically receive minor engine upgrades during the specified maintenance window. This way, RDS instances can obtain new features, bug fixes, and security patches for their database engines."
  documentation = file("./cis_v500/docs/cis_v500_2_2_2.md")
  query         = query.rds_db_instance_automatic_minor_version_upgrade_enabled

  tags = merge(local.cis_v500_2_2_common_tags, {
    cis_item_id = "2.2.2"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/RDS"
  })
}

control "cis_v500_2_2_3" {
  title         = "2.2.3 Ensure that RDS instances are not publicly accessible"
  description   = "Ensure and verify that the RDS database instances provisioned in your AWS account restrict unauthorized access in order to minimize security risks. To restrict access to any RDS database instance, you must disable the Publicly Accessible flag for the database and update the VPC security group associated with the instance."
  documentation = file("./cis_v500/docs/cis_v500_2_2_3.md")
  query         = query.rds_db_instance_prohibit_public_access

  tags = merge(local.cis_v500_2_2_common_tags, {
    cis_item_id = "2.2.3"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/RDS"
  })
}

control "cis_v500_2_2_4" {
  title         = "2.2.4 Ensure Multi-AZ deployments are used for enhanced availability in Amazon RDS"
  description   = "Amazon RDS offers Multi-AZ deployments that provide enhanced availability and durability for your databases, using synchronous replication to replicate data to a standby instance in a different Availability Zone (AZ). In the event of an infrastructure failure, Amazon RDS automatically fails over to the standby to minimize downtime and ensure business continuity."
  documentation = file("./cis_v500/docs/cis_v500_2_2_4.md")
  query         = query.rds_db_instance_multiple_az_enabled

  tags = merge(local.cis_v500_2_2_common_tags, {
    cis_item_id = "2.2.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

benchmark "cis_v500_2_3" {
  title         = "2.3 Elastic File System (EFS)"
  documentation = file("./cis_v500/docs/cis_v500_2_3.md")
  children = [
    control.cis_v500_2_3_1
  ]

  tags = merge(local.cis_v500_2_3_common_tags, {
    service = "AWS/RDS"
    type    = "Benchmark"
  })
}

control "cis_v500_2_3_1" {
  title         = "2.3.1 Ensure that encryption is enabled for EFS file systems"
  description   = "EFS data should be encrypted at rest using AWS KMS (Key Management Service)."
  documentation = file("./cis_v500/docs/cis_v500_2_3_1.md")
  query         = query.efs_file_system_encrypt_data_at_rest

  tags = merge(local.cis_v500_2_3_common_tags, {
    cis_item_id = "2.3.1"
    cis_level   = "1"
    cis_type    = "automated"
    service     = "AWS/EFS"
  })
}
