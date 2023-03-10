with bucket_acl_details as (
  select
     arn,
      title,
      array[acl -> 'Owner' ->> 'ID'] as bucket_owner,
      array_agg(grantee_id) as bucket_acl_permissions,
      object_ownership_controls,
      region,
      account_id
   from
      aws_s3_bucket,
      jsonb_path_query(acl, '$.Grants.Grantee.ID') as grantee_id
   group by
      arn,
      title,
      acl,
      region,
      account_id,
      object_ownership_controls
),
bucket_acl_checks as (
   select
      arn,
      title,
      to_jsonb(bucket_acl_permissions) - bucket_owner as additional_permissions,
      object_ownership_controls,
      region,
      account_id
   from
      bucket_acl_details
)
select
   -- Required Columns
   arn as resource,
   case
      when object_ownership_controls -> 'Rules' @> '[{"ObjectOwnership": "BucketOwnerEnforced"} ]' then 'ok'
      when jsonb_array_length(additional_permissions) = 0 then 'ok'
      else 'alarm'
   end status,
   case
      when object_ownership_controls -> 'Rules' @> '[{"ObjectOwnership": "BucketOwnerEnforced"} ]' then title || ' ACLs are disabled.'
      when jsonb_array_length(additional_permissions) = 0 then title || ' does not have ACLs for user access.'
      else title || ' has ACLs for user access.'
   end reason,
   -- Additional Dimensions
   region,
   account_id
from
   bucket_acl_checks;
