locals {
  cis_database_service_v100_5_common_tags = merge(local.cis_database_service_v100_common_tags, {
    cis_section_id = "5"
  })
}

benchmark "cis_database_service_v100_5" {
  title         = "5 Amazon ElastiCache"
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5.md")
  children = [
    control.cis_database_service_v100_5_1,
    control.cis_database_service_v100_5_2,
    control.cis_database_service_v100_5_3,
    control.cis_database_service_v100_5_4,
    control.cis_database_service_v100_5_5,
    control.cis_database_service_v100_5_6,
    control.cis_database_service_v100_5_7,
    control.cis_database_service_v100_5_8,
    control.cis_database_service_v100_5_9,
    control.cis_database_service_v100_5_10
  ]

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    type = "Benchmark"
  })
}

control "cis_database_service_v100_5_1" {
  title         = "5.1 Ensure Secure Access to ElastiCache"
  description   = "Securing access to Amazon ElastiCache involves implementing appropriate authentication and authorization mechanisms."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_1.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}

control "cis_database_service_v100_5_2" {
  title         = "5.2 Ensure Network Security is Enabled"
  description   = "Implementing network security for Amazon ElastiCache involves configuring your Virtual Private Cloud (VPC), security groups, and network access controls to control access to your ElastiCache clusters."
  query         = query.elasticache_cluster_network_security_enabled
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_2.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}

control "cis_database_service_v100_5_3" {
  title         = "5.3 Ensure Encryption at Rest and in Transit is configured"
  description   = "Enabling encryption at rest and in transit for Amazon ElastiCache helps protect your data when it is stored and transmitted."
  query         = query.elasticache_cluster_encryption_at_rest_and_in_transit_enabled
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_3.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}

control "cis_database_service_v100_5_4" {
  title         = "5.4 Ensure Automatic Updates and Patching are Enabled"
  description   = "Enabling automatic updates and patching for Amazon ElastiCache ensures that your ElastiCache clusters run the latest software versions with important security fixes and enhancements."
  query         = query.elasticache_cluster_auto_minor_version_upgrade_enabled
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_4.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}

control "cis_database_service_v100_5_5" {
  title         = "5.5 Ensure Virtual Private Cloud (VPC) is Enabled"
  description   = "Implementing VPC security best practices for Amazon ElastiCache involves configuring your Virtual Private Cloud (VPC) and associated resources to enhance the security of your ElastiCache clusters."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_5.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}

control "cis_database_service_v100_5_6" {
  title         = "5.6 Ensure Monitoring and Logging is Enabled"
  description   = "Implementing monitoring and logging for Amazon ElastiCache allows you to gain visibility into the performance, health, and behavior of your ElastiCache clusters."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_6.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}

control "cis_database_service_v100_5_7" {
  title         = "5.7 Ensure Security Configurations are Reviewed Regularly"
  description   = "Regularly updating and reviewing the security configuration of your Amazon ElastiCache clusters helps ensure that your clusters are protected against potential vulnerabilities and aligned with your security requirements."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_7.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}

control "cis_database_service_v100_5_8" {
  title         = "5.8 Ensure Authentication and Access Control is Enabled"
  description   = "Individual creates IAM roles that would give specific permission to what the user can and cannot do within that database. The Access Control List (ACLs) allows only specific individuals to access the resources."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_8.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}

control "cis_database_service_v100_5_9" {
  title         = "5.9 Ensure Audit Logging is Enabled"
  description   = "To manage your enterprise caching solution, it is important that you know how your clusters are performing and the resources they are consuming. It is also important that you know the events that are being generated and the costs of your deployment. Amazon CloudWatch provides metrics for monitoring your cache performance. In addition, cost allocation tags help you monitor and manage costs."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_9.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}

control "cis_database_service_v100_5_10" {
  title         = "5.10 Ensure Security Configurations are Reviewed Regularly"
  description   = "Regularly updating and reviewing the security configuration of your Amazon Keyspaces environment helps ensure that your database is protected against potential vulnerabilities and aligned with your security requirements."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_5_10.md")

  tags = merge(local.cis_database_service_v100_5_common_tags, {
    cis_item_id = "5.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/ElastiCache"
  })
}
