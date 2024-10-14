query "manual_control" {
  sql = <<-EOQ
    select
      'arn:' || partition || ':::' || account_id as resource,
      'info' as status,
      'Manual verification required.' as reason
      ${local.common_dimensions_global_sql}
    from
      aws_account;
  EOQ
}
