locals {
  cis_v100_2_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "2"
  })
}

benchmark "cis_v100_2" {
  title         = "2 Amazon Aurora"
  documentation = file("./cis_v100/docs/cis_v100_2.md")
  children = [
    control.cis_v100_2_1,
    control.cis_v100_2_2,
    control.cis_v100_2_3,
    control.cis_v100_2_4,
    control.cis_v100_2_5,
    control.cis_v100_2_6,
    control.cis_v100_2_7,
    control.cis_v100_2_8,
    control.cis_v100_2_9,
    control.cis_v100_2_10,
    control.cis_v100_2_11
  ]

  tags = merge(local.cis_v100_2_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v100_2_1" {
  title         = "2.1 Ensure Amazon VPC (Virtual Private Cloud) has been created"
  description   = "Amazon VPCs allow you to launch AWS resources into a defined virtual network,vproviding network isolation and controlling inbound and outbound traffic."
  query         = query.rds_aurora_db_instance_in_vpc
  documentation = file("./cis_v100/docs/cis_v100_2_1.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_2" {
  title         = "2.2 Ensure the Use of Security Groups"
  description   = "Security groups act as a firewall for associated Amazon RDS DB instances, controlling both inbound and outbound traffic."
  query         = query.rds_aurora_db_instance_uses_vpc_security_group
  documentation = file("./cis_v100/docs/cis_v100_2_2.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_3" {
  title         = "2.3 Ensure Data at Rest is Encrypted"
  description   = "Amazon Aurora allows you to encrypt your databases using keys you manage through AWS Key Management Service (KMS)."
  query         = query.rds_aurora_db_instance_encryption_at_rest_enabled
  documentation = file("./cis_v100/docs/cis_v100_2_3.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_4" {
  title         = "2.4 Ensure Data in Transit is Encrypted"
  description   = "Use SSL (Secure Sockets Layer) to secure data in transit. Aurora supports SSL-encrypted connections between your application and your DB instance."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_2_4.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_5" {
  title         = "2.5 Ensure IAM Roles and Policies are Created"
  description   = "AWS Identity and Access Management (IAM) helps manage access to AWS resources. While you cannot directly associate IAM roles with Amazon Aurora instances, you can use IAM roles and policies to define which AWS IAM users and groups have management permissions for Amazon RDS resources and what actions they can perform."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_2_5.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_6" {
  title         = "2.6 Ensure Database Audit Logging is Enabled"
  description   = "Amazon Aurora provides advanced auditing capabilities through AWS CloudTrail and Amazon RDS Database Activity Streams."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_2_6.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_7" {
  title         = "2.7 Ensure Passwords are Regularly Rotated"
  description   = "Regularly rotating your Aurora passwords is critical to access management, contributing to maintaining system security. The database password can be rotated in Amazon Aurora, but the access keys refer to the rotation of AWS IAM User access keys."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_2_7.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_8" {
  title         = "2.8 Ensure Access Keys are Regularly Rotated"
  description   = "Regularly rotating your Aurora Access Keys is critical to access management, contributing to maintaining system security."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_2_8.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_9" {
  title         = "2.9 Ensure Least Privilege Access"
  description   = "Use the principle of least privilege when granting access to your Amazon Aurora resources. This principle of least privilege (POLP) is a computer security concept where users are given the minimum access levels necessary to complete their job functions. In Amazon Aurora, this can be implemented at various levels, including AWS IAM for managing AWS resources and within the database for managing database users and roles."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_2_9.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_10" {
  title         = "2.10 Ensure Automatic Backups and Retention Policies are configured"
  description   = "Backups help protect your data from accidental loss or database failure. With Amazon Aurora, you can turn on automatic backups and specify a retention period. The backups include a daily snapshot of the entire DB instance and transaction logs."
  query         = query.rds_aurora_db_instance_backup_enabled
  documentation = file("./cis_v100/docs/cis_v100_2_10.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}

control "cis_v100_2_11" {
  title         = "2.11 Ensure Multi-Factor Authentication (MFA) is in use"
  description   = "MFA adds an extra layer of protection to your AWS resources. MFA can be used to secure AWS Management Console and CLI access which indirectly affects Aurora and other AWS services."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_2_11.md")

  tags = merge(local.cis_v100_2_common_tags, {
    cis_item_id = "2.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Aurora"
  })
}