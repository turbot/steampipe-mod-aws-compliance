locals {
  cis_v100_3_common_tags = merge(local.cis_v100_common_tags, {
    cis_section_id = "3"
  })
}

benchmark "cis_v100_3" {
  title         = "3 Amazon RDS"
  documentation = file("./cis_v100/docs/cis_v100_3.md")
  children = [
    control.cis_v100_3_1,
    control.cis_v100_3_2,
    control.cis_v100_3_3,
    control.cis_v100_3_4,
    control.cis_v100_3_5,
    control.cis_v100_3_6,
    control.cis_v100_3_7,
    control.cis_v100_3_8,
    control.cis_v100_3_9,
    control.cis_v100_3_10,
    control.cis_v100_3_11
  ]

  tags = merge(local.cis_v100_3_common_tags, {
    type = "Benchmark"
  })
}

control "cis_v100_3_1" {
  title         = "3.1 Ensure to Choose the Appropriate Database Engine"
  description   = "Amazon RDS supports multiple database engines, including Amazon Aurora, PostgreSQL, MySQL, MariaDB, Oracle, and Microsoft SQL Server. Choose the database engine that best fits your needs."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_3_1.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_2" {
  title         = "3.2 Ensure to Create The Appropriate Deployment Configuration"
  description   = "This control is important and helps businesses to choose from two deployment options, either single or multi-AZ deployment. Depending on the business factor and their security needs the organization is then encouraged to make a decision that would benefit them."
  query         = query.rds_db_instance_multiple_az_enabled
  documentation = file("./cis_v100/docs/cis_v100_3_2.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_3" {
  title         = "3.3 Ensure to Create a Virtual Private Cloud (VPC)"
  description   = "Setting up a Virtual Private Cloud (VPC) protects the private network that has been established from any external networks from interfering. It allows internal networks to communicate with one another with the network that has been established."
  query         = query.rds_db_instance_in_vpc
  documentation = file("./cis_v100/docs/cis_v100_3_3.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_4" {
  title         = "3.4 Ensure to Configure Security Groups"
  description   = "Configuring security groups benefits the user because it helps manage networks within the database and gives only certain permission for traffic that leaves and enters the database."
  query         = query.rds_db_instance_uses_vpc_security_group
  documentation = file("./cis_v100/docs/cis_v100_3_4.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_5" {
  title         = "3.5 Enable Encryption at Rest"
  description   = "This helps ensure that the data is kept secure and protected when at rest. The user must choose from two key options which then determine when the data is encrypted at rest."
  query         = query.rds_db_instance_encryption_at_rest_enabled
  documentation = file("./cis_v100/docs/cis_v100_3_5.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_6" {
  title         = "3.6 Enable Encryption in Transit"
  description   = "Amazon Relational Database uses SSL/TLS to encrypt data during transit. To secure your data in transit the individual should identify their client application and what is supported by SSL/TLS to configure it correctly."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_3_6.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_7" {
  title         = "3.7 Ensure to Implement Access Control and Authentication"
  description   = "Users should select whether they like to enable authentication. If they want to authenticate a password would be required, which would only allow the authorized person to access the database. Defining access control allows specific workers in a business access to the database."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_3_7.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_8" {
  title         = "3.8 Ensure to Regularly Patch Systems"
  description   = "Helps the organization reduce their security risk by regularly updating and patching their database and database engine. Regularly updating and scanning for any weaknesses in the company can bring up possible vulnerabilities that could have led to potential cyber-attack."
  query         = query.rds_db_instance_automatic_minor_version_upgrade_enabled
  documentation = file("./cis_v100/docs/cis_v100_3_8.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_9" {
  title         = "3.9 Ensure Monitoring and Logging is Enabled"
  description   = "If the individual is not monitoring and logging their activity it allows the attacker to attack the system and extract or destroy data."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_3_9.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_10" {
  title         = "3.10 Ensure to Enable Backup and Recovery"
  description   = "The individual logs into their AWS account and chooses their Amazon relational database that they want to backup. To have the database being backed up automatically the individual is encouraged to enable backup. This ensures that the file is being saved automatically and can prevent it from accidental loss. This ensures that the individual can restore their files quickly in the event of a data loss."
  query         = query.rds_db_instance_backup_enabled
  documentation = file("./cis_v100/docs/cis_v100_3_10.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}

control "cis_v100_3_11" {
  title         = "3.11 Ensure to Regularly Review Security Configuration"
  description   = "This helps by reviewing the database factors from database engine, review instance details, security networks, encryption settings, audit logging, and authentication. By updating or removing a few things from these lists it helps tighten security and ensures that the users do not have excessive permissions."
  query         = query.manual_control
  documentation = file("./cis_v100/docs/cis_v100_3_11.md")

  tags = merge(local.cis_v100_3_common_tags, {
    cis_item_id = "3.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/RDS"
  })
}