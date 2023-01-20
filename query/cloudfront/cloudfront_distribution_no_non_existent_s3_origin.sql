with distribution_with_non_existent_bucket as (
  select
    distinct d.arn as arn,
    to_jsonb(string_to_array((string_agg(split_part(o ->> 'Id', '.s3', 1), ',')),',')) as bucket_name_list
  from
    aws_cloudfront_distribution as d,
    jsonb_array_elements(d.origins) as o
    left join aws_s3_bucket as b on b.name = split_part(o ->> 'Id', '.s3', 1)
  where
    b.name is null
    and o ->> 'DomainName' like '%.s3.%'
   group by
    d.arn
)
select
  -- Required Columns
  distinct b.arn as resource,
  case
    when b.arn is null then 'ok'
    else 'alarm'
  end as status,
  case
    when b.arn is null then title || ' does not point to any non-existent S3 origins.'
    when jsonb_array_length(b.bucket_name_list) > 0
      then title ||
    case
      when jsonb_array_length(b.bucket_name_list) > 2
        then concat(' point to non-existent S3 origins ', b.bucket_name_list #>> '{0}', ', ', b.bucket_name_list #>> '{1}', ' and ' || (jsonb_array_length(b.bucket_name_list) - 2)::text || ' more.' )
      when jsonb_array_length(b.bucket_name_list) = 2
        then concat(' point to non-existent S3 origins ', b.bucket_name_list #>> '{0}', ' and ', b.bucket_name_list #>> '{1}', '.')
     else concat(' point to non-existent S3 origin ', b.bucket_name_list #>> '{0}', '.')
    end
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudfront_distribution as d
  left join distribution_with_non_existent_bucket as b on b.arn = d.arn
