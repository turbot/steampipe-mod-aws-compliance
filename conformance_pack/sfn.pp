locals {
  conformance_pack_sfn_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/StepFunctions"
  })
}

control "sfn_state_machine_logging_enabled" {
  title       = "Step Function state machines should have logging turned on"
  description = "This controls checks whether an AWS Step Functions state machine has logging turned on. The control fails if a state machine doesn't have logging turned on. If you provide a custom value for the logLevel parameter, the control passes only if the state machine has the specified logging level turned on."
  query       = query.sfn_state_machine_logging_enabled

  tags = merge(local.conformance_pack_sfn_common_tags, {
    acsc_essential_eight = "true"
    pci_dss_v40          = "true"
  })
}

query "sfn_state_machine_logging_enabled" {
  sql = <<-EOQ
    select
      arn as resource,
      case
        when logging_configuration ->> 'Level' = 'OFF' then 'alarm'
        else 'ok'
      end as status,
      case
        when logging_configuration ->> 'Level' = 'OFF' then title || ' loggging disabled.'
        else title || ' loggging enabled.'
      end as reason
      ${local.tag_dimensions_sql}
      ${local.common_dimensions_sql}
    from
      aws_sfn_state_machine;
  EOQ
}
