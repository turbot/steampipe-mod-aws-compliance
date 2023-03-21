control "manual_control" {
  title       = "Manual Control"
  description = "Manual verification is required."
  query       = query.manual_control
}

query "manual_control" {
  sql = <<-EOQ
    select
      -- Required Columns
      'arn:' || partition || ':::' || account_id as resource,
      'info' as status,
      'Manual verification required.' as reason,
      -- Additional Dimensions
      ${local.common_dimensions_global_sql}
    from
      aws_account;
  EOQ
}