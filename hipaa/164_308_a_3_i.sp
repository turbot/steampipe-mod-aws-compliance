locals {
  hipaa_164_308_a_3_i_common_tags = merge(local.hipaa_common_tags, {
    hipaa_control_id = "hipaa_164_308_a_3_i"
  })
}

benchmark "hipaa_164_308_a_3_i" {
  title         = "164.308(a)(3)(i)"
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i.md")
  children = [
    control.hipaa_164_308_a_3_i_dms_replication_instances_not_publicly_accessible,
    control.hipaa_164_308_a_3_i_ebs_snapshot_not_publicly_restorable,
    control.hipaa_164_308_a_3_i_ec2_instance_no_public_ip,
    control.hipaa_164_308_a_3_i_es_domain_in_vpc,
    control.hipaa_164_308_a_3_i_iam_group_not_empty,
    control.hipaa_164_308_a_3_i_iam_policy_no_star_star,
    control.hipaa_164_308_a_3_i_iam_root_user_with_no_access_key,
    control.hipaa_164_308_a_3_i_iam_user_with_group,
    control.hipaa_164_308_a_3_i_iam_user_with_no_policy,
    control.hipaa_164_308_a_3_i_lambda_function_restrict_public_access,
    control.hipaa_164_308_a_3_i_lambda_function_in_vpc,
    control.hipaa_164_308_a_3_i_rds_db_instance_prohibit_public_access,
    control.hipaa_164_308_a_3_i_rds_snapshot_prohibit_public_access,
    control.hipaa_164_308_a_3_i_redshift_cluster_prohibit_public_access,
    control.hipaa_164_308_a_3_i_s3_public_access_block_bucket_account,
    control.hipaa_164_308_a_3_i_s3_bucket_restrict_public_read_access,
    control.hipaa_164_308_a_3_i_s3_bucket_restrict_public_write_access,
    control.hipaa_164_308_a_3_i_sagemaker_notebook_instance_no_direct_internet_access
  ]
  tags = local.hipaa_164_308_a_3_i_common_tags
}

control "hipaa_164_308_a_3_i_dms_replication_instances_not_publicly_accessible" {
  title         = "Ensure AWS Database Migration Service replication instances are not publicly accessible"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.dms_replication_instances_not_publicly_accessible.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_dms_replication_instances_not_publicly_accessible.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_dms_replication_instances_not_publicly_accessible"
  })
}

control "hipaa_164_308_a_3_i_ebs_snapshot_not_publicly_restorable" {
  title         = "Ensure Amazon EBS snapshots are not publicly restorable"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.ebs_snapshot_not_publicly_restorable.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_ebs_snapshot_not_publicly_restorable.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_ebs_snapshot_not_publicly_restorable"
  })
}

control "hipaa_164_308_a_3_i_ec2_instance_no_public_ip" {
  title         = "Ensure EC2 instances should not have a public IP address"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.ec2_instance_not_publicly_accessible.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_ec2_instance_no_public_ip.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_ec2_instance_no_public_ip"
  })
}

control "hipaa_164_308_a_3_i_es_domain_in_vpc" {
  title         = "Ensure Amazon ES domains are in VPC"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.es_domain_in_vpc.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_es_domain_in_vpc.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_es_domain_in_vpc"
  })
}

control "hipaa_164_308_a_3_i_iam_group_not_empty" {
  title         = "Ensure IAM groups have at least one IAM user"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.iam_group_not_empty.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_iam_group_not_empty.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_iam_group_not_empty"
  })
}

control "hipaa_164_308_a_3_i_iam_policy_no_star_star" {
  title         = "Ensure IAM policies that allow full \"*:*\" administrative privileges are not attached"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.iam_policy_no_star_star.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_iam_policy_no_star_star.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_iam_policy_no_star_star"
  })
}

control "hipaa_164_308_a_3_i_iam_root_user_with_no_access_key" {
  title         = "Ensure IAM root user access key should not exist"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.iam_root_user_access_key.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_iam_root_user_with_no_access_key.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_iam_root_user_with_no_access_key"
  })
}

control "hipaa_164_308_a_3_i_iam_user_with_group" {
  title         = "Ensure IAM users are members of at least one group"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.iam_user_with_group.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_iam_user_with_group.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_iam_user_with_group"
  })
}

control "hipaa_164_308_a_3_i_iam_user_with_no_policy" {
  title         = "Ensure IAM users should not have IAM policies attached"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.iam_user_no_policies.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_iam_user_no_policy.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_iam_user_no_policy"
  })
}

control "hipaa_164_308_a_3_i_lambda_function_restrict_public_access" {
  title         = "Ensure Lambda functions should prohibit public access"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.lambda_function_restrict_public_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_lambda_function_restrict_public_access.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_lambda_function_restrict_public_access"
  })
}

control "hipaa_164_308_a_3_i_lambda_function_in_vpc" {
  title         = "Ensure Lambda functions should be in a VPC"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.lambda_function_in_vpc.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_lambda_function_in_vpc.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_lambda_function_in_vpc"
  })
}

control "hipaa_164_308_a_3_i_rds_db_instance_prohibit_public_access" {
  title         = "Ensure RDS DB instances should prohibit public access"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.rds_db_instance_prohibit_public_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_rds_db_instance_prohibit_public_access.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_rds_db_instance_prohibit_public_access"
  })
}

control "hipaa_164_308_a_3_i_rds_snapshot_prohibit_public_access" {
  title         = "Ensure RDS DB instances should prohibit public access"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.rds_snapshot_prohibit_public_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_rds_snapshot_prohibit_public_access.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_rds_snapshot_prohibit_public_access"
  })
}

control "hipaa_164_308_a_3_i_redshift_cluster_prohibit_public_access" {
  title         = "Ensure RDS DB instances should prohibit public access"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.redshift_cluster_prohibit_public_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_redshift_cluster_prohibit_public_access.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_redshift_cluster_prohibit_public_access"
  })
}

control "hipaa_164_308_a_3_i_redshift_cluster_prohibit_public_access" {
  title         = "Ensure RDS DB instances should prohibit public access"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.redshift_cluster_prohibit_public_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_redshift_cluster_prohibit_public_access.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_redshift_cluster_prohibit_public_access"
  })
}

control "hipaa_164_308_a_3_i_s3_public_access_block_bucket_account" {
  title         = "Ensure S3 Block Public Access setting should be enabled"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.s3_public_access_block_bucket_account.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_s3_public_access_block_bucket_account.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_s3_public_access_block_bucket_account"
  })
}

control "hipaa_164_308_a_3_i_s3_bucket_restrict_public_read_access" {
  title         = "Ensure S3 buckets should prohibit public read access"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.s3_bucket_restrict_public_read_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_s3_bucket_restrict_public_read_access.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_s3_bucket_restrict_public_read_access"
  })
}

control "hipaa_164_308_a_3_i_s3_bucket_restrict_public_write_access" {
  title         = "Ensure S3 buckets should prohibit public write access"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.s3_bucket_restrict_public_write_access.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_s3_bucket_restrict_public_write_access.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_s3_bucket_restrict_public_write_access"
  })
}

control "hipaa_164_308_a_3_i_sagemaker_notebook_instance_no_direct_internet_access" {
  title         = "Ensure SageMaker notebook instances should not have direct internet access"
  description   = "Implement policies and procedures to ensure that all members of its workforce have appropriate access to electronic protected health information, as provided under paragraph (a)(4) of this section, and to prevent those workforce members who do not have access under paragraph (a)(4) of this section from obtaining access to electronic protected health information."
  sql           = query.sagemaker_notebook_instance_direct_internet_access_disabled.sql
  #documentation = file("./hipaa/docs/hipaa_164_308_a_3_i_sagemaker_notebook_instance_no_direct_internet_access.md")

  tags = merge(local.hipaa_164_308_a_3_i_common_tags, {
    hipaa_item_id = "hipaa_164_308_a_3_i_sagemaker_notebook_instance_no_direct_internet_access"
  })
}