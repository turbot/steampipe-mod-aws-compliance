locals {
  hipaa_164_308_a_3_i_common_tags = merge(local.hipaa_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i"
  })
}

benchmark "hipaa_164_308_a_3_i" {
  title       = "164.308(a)(3)(i) Workforce security"
  description = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  children = [
    control.hipaa_164_308_a_3_i_dms_replication_instances_not_publicly_accessible,
    control.hipaa_164_308_a_3_i_ebs_snapshot_not_publicly_restorable,
    control.hipaa_164_308_a_3_i_ec2_instance_in_vpc,
    control.hipaa_164_308_a_3_i_ec2_instance_no_public_ip,
    control.hipaa_164_308_a_3_i_es_domain_in_vpc,
    control.hipaa_164_308_a_3_i_iam_group_not_empty,
    control.hipaa_164_308_a_3_i_iam_policy_no_star_star,
    control.hipaa_164_308_a_3_i_iam_root_user_with_no_access_key,
    control.hipaa_164_308_a_3_i_iam_user_with_group,
    control.hipaa_164_308_a_3_i_iam_user_with_no_policy,
    control.hipaa_164_308_a_3_i_lambda_function_in_vpc,
    control.hipaa_164_308_a_3_i_lambda_function_restrict_public_access,
    control.hipaa_164_308_a_3_i_rds_db_instance_prohibit_public_access,
    control.hipaa_164_308_a_3_i_rds_snapshot_prohibit_public_access,
    control.hipaa_164_308_a_3_i_redshift_cluster_prohibit_public_access,
    control.hipaa_164_308_a_3_i_s3_bucket_restrict_public_read_access,
    control.hipaa_164_308_a_3_i_s3_bucket_restrict_public_write_access,
    control.hipaa_164_308_a_3_i_s3_public_access_block_bucket_account,
    control.hipaa_164_308_a_3_i_sagemaker_notebook_instance_no_direct_internet_access
  ]
  tags = local.hipaa_164_308_a_3_i_common_tags
}

control "hipaa_164_308_a_3_i_dms_replication_instances_not_publicly_accessible" {
  title       = "AWS Database Migration Service replication instances should not be publicly accessible"
  description = "Manage access to the AWS Cloud by ensuring DMS replication instances cannot be publicly accessed."
  sql         = query.dms_replication_instances_not_publicly_accessible.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "dms"
  })
}

control "hipaa_164_308_a_3_i_ebs_snapshot_not_publicly_restorable" {
  title       = "Amazon EBS snapshots should not be publicly restorable"
  description = "Manage access to the AWS Cloud by ensuring EBS snapshots are not publicly restorable."
  sql         = query.ebs_snapshot_not_publicly_restorable.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "ebs"
  })
}

control "hipaa_164_308_a_3_i_ec2_instance_no_public_ip" {
  title       = "EC2 instances should not have a public IP address"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elastic Compute Cloud (Amazon EC2) instances cannot be publicly accessed."
  sql         = query.ec2_instance_not_publicly_accessible.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "ec2"
  })
}

control "hipaa_164_308_a_3_i_ec2_instance_in_vpc" {
  title       = "EC2 instance should be in VPC"
  description = "Deploy Amazon Elastic Compute Cloud (Amazon EC2) instances within an Amazon Virtual Private Cloud (Amazon VPC) to enable secure communication between an instance and other services within the amazon VPC, without requiring an internet gateway, NAT device, or VPN connection."
  sql         = query.ec2_instance_in_vpc.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "ec2"
  })
}

control "hipaa_164_308_a_3_i_es_domain_in_vpc" {
  title       = "Amazon ES domains are in VPC"
  description = "Manage access to the AWS Cloud by ensuring Amazon Elasticsearch Service (Amazon ES) Domains are within an Amazon Virtual Private Cloud (Amazon VPC)."
  sql         = query.es_domain_in_vpc.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "es"
  })
}

control "hipaa_164_308_a_3_i_iam_group_not_empty" {
  title       = "IAM groups should have at least one IAM user"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, by ensuring that IAM groups have at least one IAM user."
  sql         = query.iam_group_not_empty.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "iam"
  })
}

control "hipaa_164_308_a_3_i_iam_policy_no_star_star" {
  title       = "IAM policies with full \"*:*\" administrative privileges are not attached"
  description = "AWS Identity and Access Management (IAM) can help you incorporate the principles of least privilege and separation of duties with access permissions and authorizations, restricting policies from containing \"Effect\": \"Allow\" with \"Action\": \"*\" over \"Resource\": \"*\"."
  sql         = query.iam_policy_no_star_star.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "iam"
  })
}

control "hipaa_164_308_a_3_i_iam_root_user_with_no_access_key" {
  title       = "IAM root user access key should not exist"
  description = "Access to systems and assets can be controlled by checking that the root user does not have access keys attached to their AWS Identity and Access Management (IAM) role."
  sql         = query.iam_root_user_access_key.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "iam"
  })
}

control "hipaa_164_308_a_3_i_iam_user_with_group" {
  title       = "IAM users are members of at least one group"
  description = "AWS Identity and Access Management (IAM) can help you restrict access permissions and authorizations, by ensuring IAM users are members of at least one group."
  sql         = query.iam_user_with_group.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "iam"
  })
}

control "hipaa_164_308_a_3_i_iam_user_with_no_policy" {
  title       = "IAM users should not have IAM policies attached"
  description = "This rule ensures AWS Identity and Access Management (IAM) policies are attached only to groups or roles to control access to systems and assets."
  sql         = query.iam_user_no_policies.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "iam"
  })
}

control "hipaa_164_308_a_3_i_lambda_function_restrict_public_access" {
  title       = "Lambda functions should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring AWS Lambda functions cannot be publicly accessed."
  sql         = query.lambda_function_restrict_public_access.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "lambda"
  })
}

control "hipaa_164_308_a_3_i_lambda_function_in_vpc" {
  title       = "Lambda functions should be in a VPC"
  description = "Deploy AWS Lambda functions within an Amazon Virtual Private Cloud (Amazon VPC) for a secure communication between a function and other services within the Amazon VPC."
  sql         = query.lambda_function_in_vpc.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "lambda"
  })
}

control "hipaa_164_308_a_3_i_rds_db_instance_prohibit_public_access" {
  title       = "RDS DB instances should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) instances are not public."
  sql         = query.rds_db_instance_prohibit_public_access.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "rds"
  })
}

control "hipaa_164_308_a_3_i_rds_snapshot_prohibit_public_access" {
  title       = "RDS DB snapshots should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Relational Database Service (Amazon RDS) snapshots are not public."
  sql         = query.rds_snapshot_prohibit_public_access.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "rds"
  })
}

control "hipaa_164_308_a_3_i_redshift_cluster_prohibit_public_access" {
  title       = "Redshift cluster should prohibit public access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Redshift clusters are not public."
  sql         = query.redshift_cluster_prohibit_public_access.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "redshift"
  })
}

control "hipaa_164_308_a_3_i_s3_public_access_block_bucket_account" {
  title       = "S3 Block Public Access setting should be enabled"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon Simple Storage Service (Amazon S3) buckets cannot be publicly accessed."
  sql         = query.s3_public_access_block_bucket_account.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "s3"
  })
}

control "hipaa_164_308_a_3_i_s3_bucket_restrict_public_read_access" {
  title       = "S3 buckets should prohibit public read access"
  description = "Manage access to resources in the AWS Cloud by only allowing authorized users, processes, and devices access to Amazon Simple Storage Service (Amazon S3) buckets."
  sql         = query.s3_bucket_restrict_public_read_access.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "s3"
  })
}

control "hipaa_164_308_a_3_i_s3_bucket_restrict_public_write_access" {
  title       = "S3 buckets should prohibit public write access"
  description = "Manage access to resources in the AWS Cloud by only allowing authorized users, processes, and devices access to Amazon Simple Storage Service (Amazon S3) buckets."
  sql         = query.s3_bucket_restrict_public_write_access.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "s3"
  })
}

control "hipaa_164_308_a_3_i_sagemaker_notebook_instance_no_direct_internet_access" {
  title       = "SageMaker notebook instances should not have direct internet access"
  description = "Manage access to resources in the AWS Cloud by ensuring that Amazon SageMaker notebooks do not allow direct internet access."
  sql         = query.sagemaker_notebook_instance_direct_internet_access_disabled.sql

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    service = "sagemaker"
  })
}