locals {
  cis_database_service_v100_9_common_tags = merge(local.cis_database_service_v100_common_tags, {
    cis_section_id = "9"
  })
}

benchmark "cis_database_service_v100_9" {
  title         = "9 Amazon Neptune"
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_9.md")
  children = [
    control.cis_database_service_v100_9_1,
    control.cis_database_service_v100_9_2,
    control.cis_database_service_v100_9_3,
    control.cis_database_service_v100_9_4,
    control.cis_database_service_v100_9_5,
    control.cis_database_service_v100_9_6,
    control.cis_database_service_v100_9_7
  ]

  tags = merge(local.cis_database_service_v100_9_common_tags, {
    type = "Benchmark"
  })
}

control "cis_database_service_v100_9_1" {
  title         = "9.1 Ensure Network Security is Enabled"
  description   = "This helps ensure that all the necessary security measurements are taken to prevent a cyber-attack. Such as utilizing VPC, creating certain inbound and outbound rules, and ACLs."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_9_1.md")

  tags = merge(local.cis_database_service_v100_9_common_tags, {
    cis_item_id = "9.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Neptune"
  })
}

control "cis_database_service_v100_9_2" {
  title         = "9.2 Ensure Data at Rest is Encrypted"
  description   = "This helps ensure that the data is kept secure and protected when at rest. The user must choose from two key options which then determine when the data is encrypted at rest. "
  query         = query.neptune_db_cluster_encryption_at_rest_enabled
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_9_2.md")

  tags = merge(local.cis_database_service_v100_9_common_tags, {
    cis_item_id = "9.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Neptune"
  })
}

control "cis_database_service_v100_9_3" {
  title         = "9.3 Ensure Data in Transit is Encrypted"
  description   = "Enabling encryption in transit helps that the data is protected when it is moving from one location to another."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_9_3.md")

  tags = merge(local.cis_database_service_v100_9_common_tags, {
    cis_item_id = "9.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Neptune"
  })
}

control "cis_database_service_v100_9_4" {
  title         = "9.4 Ensure Authentication and Access Control is Enabled"
  description   = "This helps ensure that there are specific IAM roles and policies that are given the necessary information within a Neptune DB cluster to operate as needed."
  query         = query.neptune_db_cluster_iam_authentication_enabled
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_9_4.md")

  tags = merge(local.cis_database_service_v100_9_common_tags, {
    cis_item_id = "9.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Neptune"
  })
}

control "cis_database_service_v100_9_5" {
  title         = "9.5 Ensure Audit Logging is Enabled"
  description   = "This control is important because it helps ensure activity within the cluster and identifies who has last modified the document and who has access to it, in case of breaches. It also ensures compliance with regulation requirements."
  query         = query.neptune_db_cluster_audit_logging_enabled
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_9_5.md")

  tags = merge(local.cis_database_service_v100_9_common_tags, {
    cis_item_id = "9.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Neptune"
  })
}

control "cis_database_service_v100_9_6" {
  title         = "9.6 Ensure Security Configurations are Reviewed Regularly"
  description   = "This helps by removing or updating any IAM roles, security networks, encryption settings, audit logging, and authentication. By updating or removing a few things from these lists it helps tighten security and ensures that the users do not have excessive permissions."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_9_6.md")

  tags = merge(local.cis_database_service_v100_9_common_tags, {
    cis_item_id = "9.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Neptune"
  })
}

control "cis_database_service_v100_9_7" {
  title         = "9.7 Ensure Monitoring and Alerting is Enabled"
  description   = "Monitoring and alerting are important because it helps ensure that the user is aware of any changes or breaches that have occurred within the cluster. It also helps ensure that the user is aware of any changes that have occurred within the cluster."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_9_7.md")

  tags = merge(local.cis_database_service_v100_9_common_tags, {
    cis_item_id = "9.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Neptune"
  })
}
