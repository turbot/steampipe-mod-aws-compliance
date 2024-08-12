locals {
  cis_compute_service_v100_4_common_tags = merge(local.cis_compute_service_v100_common_tags, {
    cis_section_id = "4"
  })
}

benchmark "cis_compute_service_v100_4" {
  title         = "4 Lambda"
  description   = "Serverless, event-driven compute service that lets you run code for virtually any type of application or backend service without provisioning or managing servers. Serverless addresses some of today's biggest security concerns as it removes infrastructure management tasks, such as operating system patching, updating binaries, etc."
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4.md")
  children = [
    control.cis_compute_service_v100_4_1,
    control.cis_compute_service_v100_4_2,
    control.cis_compute_service_v100_4_3,
    control.cis_compute_service_v100_4_4,
    control.cis_compute_service_v100_4_5,
    control.cis_compute_service_v100_4_6,
    control.cis_compute_service_v100_4_7,
    control.cis_compute_service_v100_4_8,
    control.cis_compute_service_v100_4_9,
    control.cis_compute_service_v100_4_10,
    control.cis_compute_service_v100_4_11,
    control.cis_compute_service_v100_4_12
  ]

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    type = "Benchmark"
  })
}

control "cis_compute_service_v100_4_1" {
  title         = "4.1 Ensure AWS Config is enabled for Lambda and serverless"
  description   = "With AWS Config, you can track configuration changes to the Lambda functions (including deleted functions), runtime environments, tags, handler name, code size, memory allocation, timeout settings, and concurrency settings, along with Lambda IAM execution role, subnet, and security group associations."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_1.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.1"
    cis_level   = "2"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_2" {
  title         = "4.2 Ensure Cloudwatch Lambda insights is enabled"
  description   = "Ensure that Amazon CloudWatch Lambda Insights is enabled for your Amazon Lambda functions for enhanced monitoring."
  query         = query.lambda_function_cloudwatch_insights_enabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_2.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.2"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_3" {
  title         = "4.3 Ensure AWS Secrets manager is configured and being used by Lambda for databases"
  description   = "Lambda functions often have to access a database or other services within your environment."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_3.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.3"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_4" {
  title         = "4.4 Ensure least privilege is used with Lambda function access"
  description   = "Lambda is fully integrated with IAM, allowing you to control precisely what each Lambda function can do within the AWS Cloud. As you develop a Lambda function, you expand the scope of this policy to enable access to other resources. For example, for a function that processes objects put into an S3 bucket, it requires read access to objects stored in that bucket."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_4.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.4"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_5" {
  title         = "4.5 Ensure every Lambda function has its own IAM Role"
  description   = "Every Lambda function should have a one to one IAM execution role and the roles should not be shared between functions."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_5.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.5"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_6" {
  title         = "4.6 Ensure Lambda functions are not exposed to everyone"
  description   = "A publicly accessible Amazon Lambda function is open to the public and can be reviewed by anyone. To protect against unauthorized users that are sending requests to invoke these functions they need to be changed so they are not exposed to the public"
  query         = query.lambda_function_restrict_public_access
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_6.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.6"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_7" {
  title         = "4.7 Ensure Lambda functions are referencing active execution"
  description   = "In order to have the necessary permissions to access the AWS cloud services and resources Amazon Lambda functions should be associated with active(available) execution roles."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_7.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.7"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_8" {
  title         = "4.8 Ensure that Code Signing is enabled for Lambda functions"
  description   = "Ensure that all your Amazon Lambda functions are configured to use the Code Signing feature in order to restrict the deployment of unverified code."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_8.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.8"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_9" {
  title         = "4.9 Ensure there are no Lambda functions with admin privileges within your AWS account"
  description   = "Ensure that your Amazon Lambda functions don't have administrative permissions potentially giving the function access to all AWS cloud services and resources."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_9.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.9"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_10" {
  title         = "4.10 Ensure Lambda functions do not allow unknown cross account access via permission policies"
  description   = "Ensure that all your Amazon Lambda functions are configured to allow access only to trusted AWS accounts in order to protect against unauthorized cross-account access."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_10.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.10"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_11" {
  title         = "4.11 Ensure that the runtime environment versions used for your Lambda functions do not have end of support dates"
  description   = "Always using a recent version of the execution environment configured for your Amazon Lambda functions adheres to best practices for the newest software features, the latest security patches and bug fixes, and performance and reliability."
  query         = query.manual_control
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_11.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.11"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}

control "cis_compute_service_v100_4_12" {
  title         = "4.12 Ensure encryption in transit is enabled for Lambda environment variables"
  description   = "As you can set your own environmental variables for Lambda it is important to also encrypt them for in transit protection."
  query         = query.lambda_function_encryption_enabled
  documentation = file("./cis_compute_service_v100/docs/cis_compute_service_v100_4_12.md")

  tags = merge(local.cis_compute_service_v100_4_common_tags, {
    cis_item_id = "4.12"
    cis_level   = "1"
    cis_type    = "manual"
    service     = "AWS/Lambda"
  })
}
