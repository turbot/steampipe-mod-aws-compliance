locals {
  conformance_pack_inspector_common_tags = {
    service = "AWS/Inspector"
  }
}

query "inspector_ec2_scanning_enabled" {
  sql = <<-EOQ
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when r.steampipe_available = false then 'skip'
        when ec2_auto_enable then 'ok'
        when c.account_id is not null and (not ec2_auto_enable or ec2_auto_enable is null ) then 'alarm'
        else 'alarm'
      end status,
      case
        when r.steampipe_available = false then r.region || ' is not available in the current connection configuration.'
        when ec2_auto_enable then 'AWS Inspector EC2 scanning enabled for region ' || c.region || '(' || c.account_id || ').'
        when c.account_id is not null and (not ec2_auto_enable and ec2_auto_enable is null ) then 'AWS Inspector EC2 scanning siabled for region ' || r.region || '(' || r.account_id || ').'
        else 'AWS Inspector deactivated for region ' || r.region || '(' || r.account_id || ').'
      end as reason
      --${local.common_dimensions_global_sql}
    from
      aws_region as r
      left join aws_inspector2_organization_configuration as c on r.account_id = c.account_id and r.region = c.region;
  EOQ
}

query "inspector_ecr_scanning_enabled" {
  sql = <<-EOQ
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when r.steampipe_available = false then 'skip'
        when ecr_auto_enable then 'ok'
        when c.account_id is not null and (not ecr_auto_enable or ec2_auto_enable is null ) then 'alarm'
        else 'alarm'
      end status,
      case
        when r.steampipe_available = false then r.region || ' is not available in the current connection configuration.'
        when ec2_auto_enable then 'AWS Inspector ECR scanning enabled for region ' || c.region || '(' || c.account_id || ').'
        when c.account_id is not null and (not ec2_auto_enable and ec2_auto_enable is null ) then 'AWS Inspector ECR scanning siabled for region ' || r.region || '(' || r.account_id || ').'
        else 'AWS Inspector deactivated for region ' || r.region || '(' || r.account_id || ').'
      end as reason
      --${local.common_dimensions_global_sql}
    from
      aws_region as r
      left join aws_inspector2_organization_configuration as c on r.account_id = c.account_id and r.region = c.region;
  EOQ
}

query "inspector_lambda_scanning_enabled" {
  sql = <<-EOQ
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      c.account_id ,
      lambda_auto_enable,
      case
        when r.steampipe_available = false then 'skip'
        when lambda_auto_enable then 'ok'
        when c.account_id is not null and (not lambda_auto_enable or lambda_auto_enable is null ) then 'alarm'
        else 'alarm'
      end status,
      case
        when r.steampipe_available = false then r.region || ' is not available in the current connection configuration.'
        when lambda_auto_enable then 'AWS Inspector Lambda scanning enabled for region ' || c.region || '(' || c.account_id || ').'
        when c.account_id is not null and (not lambda_auto_enable or lambda_auto_enable is null ) then 'AWS Inspector Lambda scanning disabled for region ' || r.region || '(' || r.account_id || ').'
        else 'AWS Inspector deactivated for region ' || r.region || '(' || r.account_id || ').'
      end as reason
      --${local.common_dimensions_global_sql}
    from
      aws_region as r
      left join aws_inspector2_organization_configuration as c on r.account_id = c.account_id and r.region = c.region;
  EOQ
}

query "inspector_lambda_code_scanning_enabled" {
  sql = <<-EOQ
    select
      'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
      case
        when r.steampipe_available = false then 'skip'
        when lambda_code_auto_enable then 'ok'
        when c.account_id is not null and (not lambda_code_auto_enable or lambda_code_auto_enable is null ) then 'alarm'
        else 'alarm'
      end status,
      case
        when r.steampipe_available = false then r.region || ' is not available in the current connection configuration.'
        when lambda_code_auto_enable then 'AWS Inspector Lambda code scanning enabled for region ' || c.region || '(' || c.account_id || ').'
        when c.account_id is not null and (not lambda_code_auto_enable or lambda_code_auto_enable is null ) then 'AWS Inspector Lambda code scanning disabled for region ' || r.region || '(' || r.account_id || ').'
        else 'AWS Inspector deactivated for region ' || r.region || '(' || r.account_id || ').'
      end as reason
      --${local.common_dimensions_global_sql}
    from
      aws_region as r
      left join aws_inspector2_organization_configuration as c on r.account_id = c.account_id and r.region = c.region;
  EOQ
}