locals {
  foundational_security_rds_common_tags = merge(local.foundational_security_common_tags, {
    service = "AWS/RDS"
  })
}

benchmark "foundational_security_rds" {
  title         = "RDS"
  documentation = file("./foundational_security/docs/foundational_security_rds.md")
  children = [
    control.foundational_security_rds_1,
    control.foundational_security_rds_2,
    control.foundational_security_rds_3,
    control.foundational_security_rds_4,
    control.foundational_security_rds_5,
    control.foundational_security_rds_6,
    control.foundational_security_rds_7,
    control.foundational_security_rds_8,
    control.foundational_security_rds_9,
    control.foundational_security_rds_10,
    control.foundational_security_rds_11,
    control.foundational_security_rds_12,
    control.foundational_security_rds_13,
    control.foundational_security_rds_14,
    control.foundational_security_rds_15,
    control.foundational_security_rds_16,
    control.foundational_security_rds_17,
    control.foundational_security_rds_18,
    control.foundational_security_rds_19,
    control.foundational_security_rds_20,
    control.foundational_security_rds_21,
    control.foundational_security_rds_22,
    control.foundational_security_rds_23,
    control.foundational_security_rds_24,
    control.foundational_security_rds_25,
    control.foundational_security_rds_27,
    control.foundational_security_rds_34,
    control.foundational_security_rds_35,
    control.foundational_security_rds_36,
    control.foundational_security_rds_37,
    control.foundational_security_rds_40,
    control.foundational_security_rds_41,
    control.foundational_security_rds_42,
    control.foundational_security_rds_43,
    control.foundational_security_rds_44,
    control.foundational_security_rds_45,
    control.foundational_security_rds_47,
    control.foundational_security_rds_48
  ]

  tags = merge(local.foundational_security_rds_common_tags, {
    type = "Benchmark"
  })
}

control "foundational_security_rds_1" {
  title         = "1 RDS snapshots should be private"
  description   = "This control checks whether Amazon RDS snapshots are public. This control is intended for RDS instances. It can also return findings for snapshots of Aurora DB instances, Neptune DB instances, and Amazon DocumentDB clusters, even though they are not evaluated for public accessibility. If these findings are not useful, you can suppress them."
  severity      = "critical"
  query         = query.rds_db_snapshot_prohibit_public_access
  documentation = file("./foundational_security/docs/foundational_security_rds_1.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_1"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_rds_2" {
  title         = "2 RDS DB instances should prohibit public access, determined by the PubliclyAccessible configuration"
  description   = "This control checks whether Amazon RDS instances are publicly accessible by evaluating the PubliclyAccessible field in the instance configuration item. Neptune DB instances and Amazon DocumentDB clusters do not have the PubliclyAccessible flag and cannot be evaluated. However, this control can still generate findings for these resources. You can suppress these findings. "
  severity      = "critical"
  query         = query.rds_db_instance_prohibit_public_access
  documentation = file("./foundational_security/docs/foundational_security_rds_2.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_2"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_rds_3" {
  title         = "3 RDS DB instances should have encryption at rest enabled"
  description   = "This control checks whether storage encryption is enabled for your Amazon RDS DB instances. This control is intended for RDS DB instances. However, it can also generate findings for Aurora DB instances, Neptune DB instances, and Amazon DocumentDB clusters. If these findings are not useful, then you can suppress them."
  severity      = "medium"
  query         = query.rds_db_instance_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_3.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_3"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_rds_4" {
  title         = "4 RDS cluster snapshots and database snapshots should be encrypted at rest"
  description   = "This control checks whether RDS DB snapshots are encrypted. This control is intended for RDS DB instances. However, it can also generate findings for snapshots of Aurora DB instances, Neptune DB instances, and Amazon DocumentDB clusters. If these findings are not useful, then you can suppress them."
  severity      = "medium"
  query         = query.rds_db_snapshot_encrypted_at_rest
  documentation = file("./foundational_security/docs/foundational_security_rds_4.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_4"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_rds_5" {
  title         = "5 RDS DB instances should be configured with multiple Availability Zones"
  description   = "This control checks whether high availability is enabled for your RDS DB instances. RDS DB instances should be configured for multiple Availability Zones (AZs). This ensures the availability of the data stored. Multi-AZ deployments allow for automated failover if there is an issue with Availability Zone availability and during regular RDS maintenance."
  severity      = "medium"
  query         = query.rds_db_instance_multiple_az_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_5.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_5"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_rds_6" {
  title         = "6 Enhanced monitoring should be configured for RDS DB instances and clusters"
  description   = "This control checks whether enhanced monitoring is enabled for your RDS DB instances. In Amazon RDS, Enhanced Monitoring enables a more rapid response to performance changes in underlying infrastructure. These performance changes could result in a lack of availability of the data. Enhanced Monitoring provides real-time metrics of the operating system that your RDS DB instance runs on. An agent is installed on the instance. The agent can obtain metrics more accurately than is possible from the hypervisor layer."
  severity      = "low"
  query         = query.rds_db_instance_and_cluster_enhanced_monitoring_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_6.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_6"
    foundational_security_category = "detection_services"
  })
}

control "foundational_security_rds_7" {
  title         = "7 RDS clusters should have deletion protection enabled"
  description   = "This control checks whether RDS clusters have deletion protection enabled. This control is intended for RDS DB instances. However, it can also generate findings for Aurora DB instances, Neptune DB instances, and Amazon DocumentDB clusters. If these findings are not useful,then you can suppress them."
  severity      = "low"
  query         = query.rds_db_cluster_deletion_protection_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_7.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_7"
    foundational_security_category = "data_deletion_protection"
  })
}

control "foundational_security_rds_8" {
  title         = "8 RDS DB instances should have deletion protection enabled"
  description   = "This control checks whether your RDS DB instances that use one of the listed database engines have deletion protection enabled. DatabaseEngines: mariadb,mysql,oracle-ee,oracle-se2,oracle-se1,oracle-se,postgres,sqlserver-ee,sqlserver-se,sqlserver-ex,sqlserver-web."
  severity      = "low"
  query         = query.rds_db_instance_deletion_protection_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_8.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_8"
    foundational_security_category = "data_deletion_protection"
  })
}

control "foundational_security_rds_9" {
  title         = "9 RDS DB instances should publish logs to CloudWatch Logs"
  description   = "This control checks whether the logs of Amazon RDS are enabled and sent to CloudWatch Logs. RDS databases should have relevant logs enabled. Database logging provides detailed records of requests made to RDS. Database logs can assist with security and access audits and can help to diagnose availability issues."
  severity      = "medium"
  query         = query.rds_db_instance_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_9.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_9"
    foundational_security_category = "logging"
  })
}

control "foundational_security_rds_10" {
  title         = "10 IAM authentication should be configured for RDS instances"
  description   = "This control checks whether an RDS DB instance has IAM database authentication enabled IAM database authentication allows authentication to database instances with an authentication token instead of a password. Network traffic to and from the database is encrypted using SSL."
  severity      = "medium"
  query         = query.rds_db_instance_iam_authentication_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_10.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_10"
    foundational_security_category = "passwordless_aauthentication"
  })
}

control "foundational_security_rds_11" {
  title         = "11 RDS instances should have automatic backups enabled"
  description   = "This control checks whether Amazon Relational Database Service instances have automated backups enabled and the backup retention period is greater than or equal to seven days. The control fails if backups are not enabled, and if the retention period is less than 7 days."
  severity      = "medium"
  query         = query.rds_db_instance_backup_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_11.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_11"
    foundational_security_category = "backups_enabled"
  })
}

control "foundational_security_rds_12" {
  title         = "12 IAM authentication should be configured for RDS clusters"
  description   = "This control checks whether an RDS DB cluster has IAM database authentication enabled. IAM database authentication allows for password-free authentication to database instances. The authentication uses an authentication token. Network traffic to and from the database is encrypted using SSL."
  severity      = "medium"
  query         = query.rds_db_cluster_iam_authentication_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_12.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_12"
    foundational_security_category = "passwordless_aauthentication"
  })
}

control "foundational_security_rds_13" {
  title         = "13 RDS automatic minor version upgrades should be enabled"
  description   = "This control checks whether automatic minor version upgrades are enabled for the RDS database instance. Enabling automatic minor version upgrades ensures that the latest minor version updates to the relational database management system (RDBMS) are installed. These upgrades might include security patches and bug fixes. Keeping up to date with patch installation is an important step in securing systems."
  severity      = "high"
  query         = query.rds_db_instance_automatic_minor_version_upgrade_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_13.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_13"
    foundational_security_category = "vulnerability_and_patch_management"
  })
}

control "foundational_security_rds_14" {
  title         = "14 Amazon Aurora clusters should have backtracking enabled"
  description   = "This control checks whether Amazon Aurora clusters have backtracking enabled. Backups help you to recover more quickly from a security incident. They also strengthens the resilience of your systems. Aurora backtracking reduces the time to recover a database to a point in time. It does not require a database restore to so."
  severity      = "medium"
  query         = query.rds_db_cluster_aurora_backtracking_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_14.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_14"
    foundational_security_category = "backups_enabled"
  })
}

control "foundational_security_rds_15" {
  title         = "15 RDS DB clusters should be configured for multiple Availability Zones"
  description   = "This control checks whether high availability is enabled for your RDS DB clusters. RDS DB clusters should be configured for multiple Availability Zones to ensure availability of the data that is stored."
  severity      = "medium"
  query         = query.rds_db_cluster_multiple_az_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_15.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_15"
    foundational_security_category = "high_availability"
  })
}

control "foundational_security_rds_16" {
  title         = "16 RDS DB clusters should be configured to copy tags to snapshots"
  description   = "This control checks whether RDS DB clusters are configured to copy all tags to snapshots when the snapshots are created."
  severity      = "low"
  query         = query.rds_db_cluster_copy_tags_to_snapshot_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_16.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_16"
    foundational_security_category = "inventory"
  })
}

control "foundational_security_rds_17" {
  title       = "17 RDS DB instances should be configured to copy tags to snapshots"
  description = "This control checks whether RDS DB instances are configured to copy all tags to snapshots when the snapshots are created."
  severity    = "low"
  query       = query.rds_db_instance_copy_tags_to_snapshot_enabled
  #documentation = file("./foundational_security/docs/foundational_security_rds_17.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_17"
    foundational_security_category = "inventory"
  })
}

control "foundational_security_rds_18" {
  title         = "18 RDS instances should be deployed in a VPC"
  description   = "This control checks whether an RDS instance is deployed in a VPC (EC2-VPC)."
  severity      = "high"
  query         = query.rds_db_instance_in_vpc
  documentation = file("./foundational_security/docs/foundational_security_rds_18.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_18"
    foundational_security_category = "resources_within_vpc"
  })
}

control "foundational_security_rds_19" {
  title         = "19 Existing RDS event notification subscriptions should be configured for critical cluster events."
  description   = "This control checks whether an Amazon RDS event subscription exists that has notifications enabled for the following source type, event category key-value pairs."
  severity      = "low"
  query         = query.rds_db_cluster_events_subscription
  documentation = file("./foundational_security/docs/foundational_security_rds_19.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_19"
    foundational_security_category = "application_monitoring"
  })
}

control "foundational_security_rds_20" {
  title         = "20 Existing RDS event notification subscriptions should be configured for critical database instance events"
  description   = "This control checks whether an Amazon RDS event subscription exists with notifications enabled for the following source type, event category key-value pairs."
  severity      = "low"
  query         = query.rds_db_instance_events_subscription
  documentation = file("./foundational_security/docs/foundational_security_rds_20.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_20"
    foundational_security_category = "application_monitoring"
  })
}

control "foundational_security_rds_21" {
  title         = "21 An RDS event notifications subscription should be configured for critical database parameter group events"
  description   = "This control checks whether an Amazon RDS event subscription exists with notifications enabled for the following source type, event category key-value pairs."
  severity      = "low"
  query         = query.rds_db_parameter_group_events_subscription
  documentation = file("./foundational_security/docs/foundational_security_rds_21.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_21"
    foundational_security_category = "application_monitoring"
  })
}

control "foundational_security_rds_22" {
  title         = "22 An RDS event notifications subscription should be configured for critical database security group events"
  description   = "This control checks whether an Amazon RDS event subscription exists with notifications enabled for the following source type, event category key-value pairs."
  severity      = "low"
  query         = query.rds_db_security_group_events_subscription
  documentation = file("./foundational_security/docs/foundational_security_rds_22.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_22"
    foundational_security_category = "application_monitoring"
  })
}

control "foundational_security_rds_23" {
  title         = "23 RDS databases and clusters should not use a database engine default port"
  description   = "This control checks whether the RDS cluster or instance uses a port other than the default port of the database engine."
  severity      = "low"
  query         = query.rds_db_instance_and_cluster_no_default_port
  documentation = file("./foundational_security/docs/foundational_security_rds_23.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_23"
    foundational_security_category = "secure_network_configuration"
  })
}

control "foundational_security_rds_24" {
  title         = "24 RDS database clusters should use a custom administrator username"
  description   = "This control checks whether an Amazon RDS database cluster has changed the admin username from its default value. This rule will fail if the admin username is set to the default value."
  severity      = "medium"
  query         = query.rds_db_cluster_no_default_admin_name
  documentation = file("./foundational_security/docs/foundational_security_rds_24.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_24"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_rds_25" {
  title         = "25 RDS database instances should use a custom administrator username"
  description   = "This control checks whether you've changed the administrative username for Amazon Relational Database Service (Amazon RDS) database instances from the default value. The control fails if the administrative username is set to the default value."
  severity      = "medium"
  query         = query.rds_db_instance_no_default_admin_name
  documentation = file("./foundational_security/docs/foundational_security_rds_25.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_25"
    foundational_security_category = "resource_configuration"
  })
}

control "foundational_security_rds_27" {
  title         = "27 RDS DB clusters should be encrypted at rest"
  description   = "This control checks if an RDS DB cluster is encrypted at rest. The control fails if an RDS DB cluster isn't encrypted at rest."
  severity      = "medium"
  query         = query.rds_db_cluster_encryption_at_rest_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_27.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_27"
    foundational_security_category = "encryption_of_data_at_rest"
  })
}

control "foundational_security_rds_34" {
  title         = "34 Aurora MySQL DB clusters should publish audit logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon Aurora MySQL DB cluster is configured to publish audit logs to Amazon CloudWatch Logs. The control fails if the cluster isn't configured to publish audit logs to CloudWatch Logs."
  severity      = "medium"
  query         = query.rds_db_cluster_aurora_mysql_publish_audit_log_to_cloudwatch
  documentation = file("./foundational_security/docs/foundational_security_rds_34.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_34"
    foundational_security_category = "logging"
  })
}

control "foundational_security_rds_35" {
  title         = "35 RDS DB clusters should have automatic minor version upgrade enabled"
  description   = "This control checks if automatic minor version upgrade is enabled for an Amazon RDS database cluster. The control fails if automatic minor version upgrade isn't enabled for an RDS cluster."
  severity      = "medium"
  query         = query.rds_db_cluster_automatic_minor_version_upgrade_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_35.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_35"
    foundational_security_category = "vulnerability_patch_and_version_management"
  })
}

control "foundational_security_rds_36" {
  title         = "36 RDS for PostgreSQL DB instances should publish logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon RDS for PostgreSQL DB instance is configured to publish logs to Amazon CloudWatch Logs. The control fails if the PostgreSQL DB instance isn't configured to publish the log types mentioned in the logTypes parameter to CloudWatch Logs."
  severity      = "medium"
  query         = query.rds_db_instance_postgres_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_36.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_36"
    foundational_security_category = "logging"
  })
}

control "foundational_security_rds_37" {
  title         = "37 Aurora PostgreSQL DB clusters should publish logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon Aurora PostgreSQL DB cluster is configured to publish logs to Amazon CloudWatch Logs. The control fails if the Aurora PostgreSQL DB cluster isn't configured to publish PostgreSQL logs to CloudWatch Logs."
  severity      = "medium"
  query         = query.rds_db_cluster_aurora_postgres_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_37.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_37"
    foundational_security_category = "logging"
  })
}

control "foundational_security_rds_40" {
  title         = "40 RDS for SQL Server DB instances should publish logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon RDS for Microsoft SQL Server DB instance is configured to publish logs to Amazon CloudWatch Logs. The control fails if the RDS for SQL Server DB instance isn't configured to publish logs to CloudWatch Logs. You can optionally specify the types of logs that a DB instance should be configured to publish."
  severity      = "medium"
  query         = query.rds_db_instance_sql_server_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_40.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_40"
    foundational_security_category = "logging"
  })
}

control "foundational_security_rds_41" {
  title         = "41 RDS for SQL Server DB instances should be encrypted in transit"
  description   = "This control checks whether a connection to an Amazon RDS for Microsoft SQL Server DB instance is encrypted in transit. The control fails if the rds.force_ssl parameter of the parameter group associated with the DB instance is set to 0 (off)."
  severity      = "medium"
  query         = query.rds_db_instance_sql_server_encryption_in_transit_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_41.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_41"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_rds_42" {
  title         = "42 RDS for MariaDB DB instances should publish logs to CloudWatch Logs"
  description   = "This control checks whether an Amazon RDS for MariaDB DB instance is configured to publish certain types of logs to Amazon CloudWatch Logs. The control fails if the MariaDB DB instance isn't configured to publish the logs to CloudWatch Logs. You can optionally specify which types of logs a MariaDB DB instance should be configured to publish."
  severity      = "medium"
  query         = query.rds_db_instance_mariadb_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_42.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_42"
    foundational_security_category = "logging"
  })
}

control "foundational_security_rds_43" {
  title         = "43 RDS DB proxies should require TLS encryption for connections"
  description   = "This control checks whether an Amazon RDS DB proxy requires TLS for all connections between the proxy and the underlying RDS DB instance. The control fails if the proxy doesn't require TLS for all connections between the proxy and the RDS DB instance."
  severity      = "medium"
  query         = query.rds_db_proxy_tls_encryption_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_43.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_43"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_rds_44" {
  title         = "44 RDS for MariaDB DB instances should be encrypted in transit"
  description   = "This control checks whether connections to an Amazon RDS for MariaDB DB instance are encrypted in transit. The control fails if the DB parameter group associated with the DB instance is not in sync, or the require_secure_transport parameter of the parameter group is not set to ON."
  severity      = "medium"
  query         = query.rds_db_instance_mariadb_encryption_in_transit_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_44.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_44"
    foundational_security_category = "encryption_of_data_in_transit"
  })
}

control "foundational_security_rds_45" {
  title         = "45 Aurora MySQL DB clusters should have audit logging enabled"
  description   = "This control checks whether an Amazon Aurora MySQL DB cluster has audit logging enabled. The control fails if the DB parameter group associated with the DB cluster is not in sync, the server_audit_logging parameter is not set to 1, or the server_audit_events parameter is set to an empty value."
  severity      = "medium"
  query         = query.rds_db_cluster_aurora_mysql_audit_logging_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_45.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_45"
    foundational_security_category = "logging"
  })
}

control "foundational_security_rds_47" {
  title         = "47 RDS for PostgreSQL DB clusters should be configured to copy tags to DB snapshots"
  description   = "This control checks whether an Amazon RDS for PostgreSQL DB cluster is configured to automatically copy tags to snapshots of the DB cluster when the snapshots are created. The control fails if the CopyTagsToSnapshot parameter is set to false for the RDS for PostgreSQL DB cluster."
  severity      = "low"
  query         = query.rds_db_cluster_aurora_postgres_copy_tags_to_snapshot_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_47.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_47"
    foundational_security_category = "tagging"
  })
}

control "foundational_security_rds_48" {
  title         = "48 RDS for MySQL DB clusters should be configured to copy tags to DB snapshots"
  description   = "This control checks whether an Amazon RDS for MySQL DB cluster is configured to automatically copy tags to snapshots of the DB cluster when the snapshots are created. The control fails if the CopyTagsToSnapshot parameter is set to false for the RDS for MySQL DB cluster."
  severity      = "low"
  query         = query.rds_db_cluster_aurora_mysql_copy_tags_to_snapshot_enabled
  documentation = file("./foundational_security/docs/foundational_security_rds_48.md")

  tags = merge(local.foundational_security_rds_common_tags, {
    foundational_security_item_id  = "rds_48"
    foundational_security_category = "tagging"
  })
}
