locals {
  conformance_pack_glue_common_tags = {
    service = "AWS/Glue"
  }
}

variable "glue_spark_job_supported_version" {
  type        = number
  description = "Minimum supported Glue version."
  default     = 3.0
}

control "glue_dev_endpoint_cloudwatch_logs_encryption_enabled" {
  title       = "Glue dev endpoints CloudWatch logs encryption should be enabled"
  description = "Ensure Glue dev endpoints have CloudWatch logs encryption enabled to protect sensitive information at rest."
  query       = query.glue_dev_endpoint_cloudwatch_logs_encryption_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_dev_endpoint_job_bookmarks_encryption_enabled" {
  title       = "Glue dev endpoints job bookmark encryption should be enabled"
  description = "Ensure Glue dev endpoints have job bookmark encryption enabled to protect sensitive information at rest."
  query       = query.glue_dev_endpoint_job_bookmarks_encryption_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_dev_endpoint_s3_encryption_enabled" {
  title       = "Glue dev endpoints S3 encryption should be enabled"
  description = "Ensure Glue dev endpoints have S3 encryption enabled to protect sensitive information at rest."
  query       = query.glue_dev_endpoint_s3_encryption_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_job_cloudwatch_logs_encryption_enabled" {
  title       = "Glue jobs CloudWatch logs encryption should be enabled"
  description = "Ensure Glue jobs have CloudWatch logs encryption enabled to protect sensitive information at rest."
  query       = query.glue_job_cloudwatch_logs_encryption_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_job_bookmarks_encryption_enabled" {
  title       = "Glue jobs bookmarks encryption should be enabled"
  description = "Ensure Glue job bookmarks have encryption enabled to protect sensitive information at rest."
  query       = query.glue_job_bookmarks_encryption_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_job_s3_encryption_enabled" {
  title       = "Glue jobs S3 encryption should be enabled"
  description = "Ensure Glue jobs have S3 encryption enabled to protect sensitive information at rest."
  query       = query.glue_job_s3_encryption_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_data_catalog_encryption_settings_metadata_encryption_enabled" {
  title       = "Glue data catalog metadata encryption should be enabled"
  description = "Ensure Glue data catalog metadata encryption is enabled to protect sensitive information at rest."
  query       = query.glue_data_catalog_encryption_settings_metadata_encryption_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_data_catalog_encryption_settings_password_encryption_enabled" {
  title       = "Glue data catalog connection password encryption should be enabled"
  description = "Ensure Glue data catalog connection password encryption is enabled to protect sensitive information at rest."
  query       = query.glue_data_catalog_encryption_settings_password_encryption_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_connection_ssl_enabled" {
  title       = "Glue connection SSL should be enabled"
  description = "Ensure Glue connection encryption SSL is enabled."
  query       = query.glue_connection_ssl_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_ml_transform_encryption_at_rest_enabled" {
  title         = "AWS Glue machine learning transforms should be encrypted at rest"
  description   = "This control checks whether an AWS Glue machine learning transform is encrypted at rest. The control fails if the machine learning transform isn't encrypted at rest."
  query         = query.glue_ml_transform_encryption_at_rest_enabled

  tags = local.conformance_pack_glue_common_tags
}

control "glue_spark_job_runs_on_version_3_or_higher" {
  title         = "AWS Glue Spark jobs should run on supported versions of AWS Glue"
  description   = "This control checks whether an AWS Glue for Spark job is configured to run on a supported version of AWS Glue. The control fails if the Spark job is configured to run on a version of AWS Glue that's earlier than the minimum supported version."
  query         = query.glue_spark_job_runs_on_version_3_or_higher

  tags = local.conformance_pack_glue_common_tags
}

query "glue_dev_endpoint_cloudwatch_logs_encryption_enabled" {
  sql = <<-EOQ
    select
      e.arn as resource,
      case
        when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then e.title || ' CloudWatch logs encryption enabled.'
        else e.title || ' CloudWatch logs encryption disabled.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "e.")}
    from
      aws_glue_dev_endpoint as e
      left join aws_glue_security_configuration as c on e.security_configuration = c.name;
  EOQ
}

query "glue_dev_endpoint_job_bookmarks_encryption_enabled" {
  sql = <<-EOQ
    select
      e.arn as resource,
      case
        when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then e.title || ' job bookmark encryption enabled.'
        else e.title || ' job bookmark encryption disabled.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "e.")}
    from
      aws_glue_dev_endpoint as e
      left join aws_glue_security_configuration as c on e.security_configuration = c.name;
  EOQ
}

query "glue_dev_endpoint_s3_encryption_enabled" {
  sql = <<-EOQ
    select
      d.arn as resource,
      case
        when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then d.title || ' S3 encryption enabled.'
        else d.title || ' S3 encryption disabled.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "d.")}
    from
      aws_glue_dev_endpoint as d
      left join aws_glue_security_configuration s on d.security_configuration = s.name,
      jsonb_array_elements(s.s3_encryption) e;
  EOQ
}

query "glue_job_cloudwatch_logs_encryption_enabled" {
  sql = <<-EOQ
    select
      j.arn as resource,
      case
        when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when cloud_watch_encryption is not null and cloud_watch_encryption ->> 'CloudWatchEncryptionMode' != 'DISABLED' then j.title || ' CloudWatch logs encryption enabled.'
        else j.title || ' CloudWatch logs encryption disabled.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "j.")}
    from
      aws_glue_job as j
      left join aws_glue_security_configuration as c on j.security_configuration = c.name;
  EOQ
}

query "glue_job_bookmarks_encryption_enabled" {
  sql = <<-EOQ
    select
      j.arn as resource,
      case
        when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when job_bookmarks_encryption is not null and job_bookmarks_encryption ->> 'JobBookmarksEncryptionMode' != 'DISABLED' then j.title || ' job bookmarks encryption enabled.'
        else j.title || ' job bookmarks encryption disabled.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "j.")}
    from
      aws_glue_job as j
      left join aws_glue_security_configuration as c on j.security_configuration = c.name;
  EOQ
}

query "glue_job_s3_encryption_enabled" {
  sql = <<-EOQ
    select
      j.arn as resource,
      case
        when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when e is not null and e ->> 'S3EncryptionMode' != 'DISABLED' then j.title || ' S3 encryption enabled.'
        else j.title || ' S3 encryption disabled.'
      end as reason
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "j.")}
    from
      aws_glue_job as j
      left join aws_glue_security_configuration as s on j.security_configuration = s.name,
      jsonb_array_elements(s.s3_encryption) e;
  EOQ
}

query "glue_data_catalog_encryption_settings_metadata_encryption_enabled" {
  sql = <<-EOQ
    select
      'arn:' || partition || '::' || region || ':' || account_id as resource,
      case
        when encryption_at_rest is not null and encryption_at_rest ->> 'CatalogEncryptionMode' != 'DISABLED' then 'ok'
        else 'alarm'
      end as status,
      case
        when encryption_at_rest is not null and encryption_at_rest ->> 'CatalogEncryptionMode' != 'DISABLED' then 'Glue data catalog metadata encryption is enabled in ' || region || '.'
        else 'Glue data catalog metadata encryption is disabled in ' || region || '.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_glue_data_catalog_encryption_settings;
  EOQ
}

query "glue_data_catalog_encryption_settings_password_encryption_enabled" {
  sql = <<-EOQ
    select
      'arn:' || partition || '::' || region || ':' || account_id as resource,
      case
        when connection_password_encryption is not null and connection_password_encryption ->> 'ReturnConnectionPasswordEncrypted' != 'false' then 'ok'
        else 'alarm'
      end as status,
      case
        when connection_password_encryption is not null and connection_password_encryption ->> 'ReturnConnectionPasswordEncrypted' != 'false' then 'Glue data catalog connection password encryption enabled in ' || region || '.'
        else 'Glue data catalog connection password encryption disabled in ' || region || '.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_glue_data_catalog_encryption_settings;
  EOQ
}

query "glue_connection_ssl_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when connection_properties ->> 'JDBC_ENFORCE_SSL' = 'true' then 'ok'
        else 'alarm'
      end as status,
      case
        when connection_properties ->> 'JDBC_ENFORCE_SSL' = 'true' then name || ' SSL enabled.'
        else name || ' SSL disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_glue_connection;
  EOQ
}

query "glue_spark_job_runs_on_version_3_or_higher" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when not default_arguments @> '{"--enable-spark-ui": "true"}'::jsonb then 'skip'
        when cast(glue_version AS DECIMAL) >= $1 then 'ok'
        else 'alarm'
      end as status,
      case
        when not default_arguments @> '{"--enable-spark-ui": "true"}'::jsonb then title  || ' is not a spark job.'
        else title  || ' uses ' || glue_version || ' glue version.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_glue_job;
  EOQ

  param "glue_spark_job_supported_version" {
    description = "Minimum supported Glue version."
    default     = var.glue_spark_job_supported_version
  }
}

query "glue_ml_transform_encryption_at_rest_enabled" {
  sql = <<-EOQ
    select
      transform_id as resource,
      case
        when transform_encryption is not null then 'ok'
        else 'alarm'
      end as status,
      case
        when transform_encryption is not null then title  || ' encryption at rest enabled.'
        else title  || ' encryption at rest disabled.'
      end as reason
      ${local.common_dimensions_sql}
    from
      aws_glue_ml_transform;
  EOQ
}


