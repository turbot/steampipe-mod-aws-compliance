locals {
  cis_database_service_v100_4_common_tags = merge(local.cis_database_service_v100_common_tags, {
    cis_section_id = "4"
  })
}

benchmark "cis_database_service_v100_4" {
  title         = "4 Amazon DynamoDB"
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_4.md")
  children = [
    control.cis_database_service_v100_4_1,
    control.cis_database_service_v100_4_2,
    control.cis_database_service_v100_4_3,
    control.cis_database_service_v100_4_4,
    control.cis_database_service_v100_4_5,
    control.cis_database_service_v100_4_6,
    control.cis_database_service_v100_4_7
  ]

  tags = merge(local.cis_database_service_v100_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_database_service_v100_4_1" {
  title         = "4.1 Ensure AWS Identity and Access Management (IAM) is in use"
  description   = "AWS Identity and Access Management (IAM) lets you securely control your users' access to AWS services and resources. To manage access control for Amazon DynamoDB, you can create IAM policies that control access to tables and data."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_4_1.md")

  tags = merge(local.cis_database_service_v100_4_common_tags, {
    cis_item_id = "4.1"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DynamoDB"
  })
}

control "cis_database_service_v100_4_2" {
  title         = "4.2 Ensure Fine-Grained Access Control is implemented"
  description   = "Fine-Grained Access Control (FGAC) on Amazon DynamoDB allows you to control access to data at the row level. Using IAM policies, you can restrict access based on the content within the request. "
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_4_2.md")

  tags = merge(local.cis_database_service_v100_4_common_tags, {
    cis_item_id = "4.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DynamoDB"
  })
}

control "cis_database_service_v100_4_3" {
  title         = "4.3 Ensure DynamoDB Encryption at Rest"
  description   = "Encryption at rest in Amazon DynamoDB enhances the security of your data by encrypting it using AWS Key Management Service (AWS KMS) keys. Here is how to enable encryption at rest while creating a DynamoDB table."
  query         = query.dynamodb_table_encryption_enabled
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_4_3.md")

  tags = merge(local.cis_database_service_v100_4_common_tags, {
    cis_item_id = "4.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DynamoDB"
  })
}

control "cis_database_service_v100_4_4" {
  title         = "4.4 Ensure DynamoDB Encryption in Transit "
  description   = "Use the SSL/TLS protocol to encrypt data in transit between your applications and DynamoDB. Amazon DynamoDB encrypts data in transit by default using Transport Layer Security (TLS) encryption."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_4_4.md")

  tags = merge(local.cis_database_service_v100_4_common_tags, {
    cis_item_id = "4.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DynamoDB"
  })
}

control "cis_database_service_v100_4_5" {
  title         = "4.5 Ensure VPC Endpoints are configured"
  description   = "Using VPC endpoints with Amazon DynamoDB allows you to securely access DynamoDB resources within your Amazon Virtual Private Cloud (VPC). This keeps your traffic off the public internet."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_4_5.md")

  tags = merge(local.cis_database_service_v100_4_common_tags, {
    cis_item_id = "4.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DynamoDB"
  })
}

control "cis_database_service_v100_4_6" {
  title         = "4.6 Ensure DynamoDB Streams and AWS Lambda for Automated Compliance Checking is Enabled"
  description   = "Enabling DynamoDB Streams and integrating AWS Lambda allows you to automate compliance checking and perform actions based on changes made to your DynamoDB data."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_4_6.md")

  tags = merge(local.cis_database_service_v100_4_common_tags, {
    cis_item_id = "4.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DynamoDB"
  })
}

control "cis_database_service_v100_4_7" {
  title         = "4.7 Ensure Monitor and Audit Activity is enabled"
  description   = "Regular monitoring and auditing of activity in Amazon DynamoDB help ensure your database's security, performance, and compliance."
  query         = query.manual_control
  documentation = file("./cis_database_service_v100/docs/cis_database_service_v100_4_7.md")

  tags = merge(local.cis_database_service_v100_4_common_tags, {
    cis_item_id = "4.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/DynamoDB"
  })
}
