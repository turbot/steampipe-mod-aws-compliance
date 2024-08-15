locals {
  cis_v100_7_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "7"
  })
}

benchmark "cis_v100_7" {
  title         = "7 Amazon DocumentDB"
  documentation = file("./cis_v100/docs/cis_v100_7.md")
  children = [
    control.cis_v100_7_1,
    control.cis_v100_7_2,
    control.cis_v100_7_3,
    control.cis_v100_7_4,
    control.cis_v100_7_5,
    control.cis_v100_7_6,
    control.cis_v100_7_7,
    control.cis_v100_7_8,
    control.cis_v100_7_9,
    control.cis_v100_7_10,
    control.cis_v100_7_11
  ]

  tags = merge(local.cis_v100_7_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v100_7_1" {
  title         = "7.1 Ensure Network Architecture Planning"
  description   = "Plan the network architecture to isolate your DocumentDB instances within a secure Virtual Private Cloud (VPC). Configure appropriate security groups and network access control lists (ACLs) to control inbound and outbound traffic to your DocumentDB instances."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_7_1.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_2" {
  title         = "7.2 Ensure VPC Security is Configured"
  description   = "Creating a VPC, configuring subnets, and creating security groups help isolate your DocumentDB instances within your virtual network and control inbound and outbound traffic."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_7_2.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_3" {
  title         = "7.3 Ensure Encryption at Rest and in Transit is configured"
  description   = "This helps ensure that the data is kept secure and protected when at rest. The user must choose from two key options which then determine when the data is encrypted at rest."
  query         = query.docdb_cluster_encryption_at_rest_enabled
  documentation = file("./cis_v100/docs/cis_v100_7_3.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_4" {
  title         = "7.4 Ensure Encryption in Transit is Enabled"
  description   = "Amazon Database DB uses SSL/TLS to encrypt data during transit. To secure your data in transit the individual should identify their client application and what is supported by TLS to configure it correctly."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_7_4.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_5" {
  title         = "7.5 Ensure to Implement Access Control and Authentication"
  description   = "Configure authentication mechanisms for your DocumentDB instances, such as using AWS Identity and Access Management (IAM) users or database users. Define appropriate user roles and permissions to control access to the DocumentDB instances and databases."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_7_5.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_6" {
  title         = "7.6 Ensure Audit Logging is Enabled"
  description   = "Enable audit logging to capture database activities, including login attempts, queries, and modifications. Send the logs to Amazon CloudWatch or a centralized log management system for analysis and monitoring."
  query         = query.docdb_cluster_instance_logging_enabled
  documentation = file("./cis_v100/docs/cis_v100_7_6.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_7" {
  title         = "7.7 Ensure Regular Updates and Patches"
  description   = "Stay informed about the latest security updates and patches released by Amazon for DocumentDB. Regularly apply updates and patches to your DocumentDB instances to protect against known vulnerabilities."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_7_7.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_8" {
  title         = "7.8 Ensure to Implement Monitoring and Alerting "
  description   = "This helps by alerting the system if any unusual event has occurred or if a particular threshold has been achieved because the user is able to set a desired interval or the cluster. This then allows system administrators to swiftly correct the situation and avoid subsequent complications if something unusual is happening."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_7_8.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_9" {
  title         = "7.9 Ensure to Implement Backup and Disaster Recovery"
  description   = "Set up automated backups for your DocumentDB instances to ensure data durability and recoverability. Consider implementing a disaster recovery plan that includes data replication across different availability zones or regions."
  query         = query.docdb_cluster_backup_retention_period_7_days
  documentation = file("./cis_v100/docs/cis_v100_7_9.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_10" {
  title         = "7.10 Ensure to Configure Backup Window"
  description   = "The user should configure the backup window to ensure that the backup is taken at a time when the system is not in use. This will help to avoid any performance issues during the backup process."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_7_10.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}

control "cis_v100_7_11" {
  title         = "7.11 Ensure to Conduct Security Assessments"
  description   = "Periodically perform security assessments, including vulnerability assessments and penetration testing, to identify and address any security weaknesses. Review your security configuration against best practices and industry standards."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_7_11.md")

  tags = merge(local.cis_v100_7_common_tags, {
    cis_item_id = "7.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DocumentDB"
  })
}