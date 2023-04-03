locals {
  conformance_pack_codedeploy_common_tags = merge(local.aws_compliance_common_tags, {
    service = "AWS/CodeDeploy"
  })
}

control "codedeploy_deployment_group_lambda_allatonce_traffic_shift_disabled" {
  title       = "Codedeploy deployment groups lambda allatonce traffic shift should be disabled"
  description = "This control checks if the deployment group for Lambda Compute Platform is not using the default deployment configuration. The rule is non compliant if the deployment group is using the deployment configuration 'CodeDeployDefault.LambdaAllAtOnce'."
  query       = query.codedeploy_deployment_group_lambda_allatonce_traffic_shift_disabled

  tags = merge(local.conformance_pack_codedeploy_common_tags, {
    pci_dss_v321 = "true"
  })
}

query "codedeploy_deployment_group_lambda_allatonce_traffic_shift_disabled" {
  sql = <<-EOQ
    select
      g.arn as resource,
      case
        when a.compute_platform <> 'Lambda' then 'skip'
        when deployment_config_name = 'CodeDeployDefault.LambdaAllAtOnce' then 'alarm'
        else 'ok'
      end as status,
      case
        when a.compute_platform <> 'Lambda' then g.title || ' using ' ||  a.compute_platform || ' compute platform.'
        else g.title || ' using '|| deployment_config_name || ' deployment config.'
      end as reason
      ${replace(local.tag_dimensions_qualifier_sql, "__QUALIFIER__", "g.")}
      ${replace(local.common_dimensions_qualifier_sql, "__QUALIFIER__", "g.")}
    from
      aws_codedeploy_deployment_group as g,
      aws_codedeploy_app as a
    where
      g.application_name = a.application_name;
  EOQ
}
