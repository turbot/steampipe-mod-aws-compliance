locals {
  pci_dss_v400_requirement_6_common_tags = merge(local.pci_dss_v400_common_tags, {
    control_set = "6"
  })
}

benchmark "pci_dss_v400_requirement_6" {
  title = "Requirement 6: Develop and Maintain Secure Systems and Software"

  children = [
    benchmark.pci_dss_v400_requirement_6_3,
    benchmark.pci_dss_v400_requirement_6_4,
    benchmark.pci_dss_v400_requirement_6_5,
  ]

  tags = local.pci_dss_v400_requirement_6_common_tags
}

benchmark "pci_dss_v400_requirement_6_3" {
  title = "6.3: Vulnerabilities Are Identified and Addressed"

  children = [
    benchmark.pci_dss_v400_requirement_6_3_3,
  ]

  tags = merge(local.pci_dss_v400_requirement_6_common_tags, {
    pci_dss_v400_item_id = "6.3"
  })
}

benchmark "pci_dss_v400_requirement_6_3_3" {
  title       = "6.3.3: Software patches are installed within an appropriate time frame."
  description = "Software patches are installed within an appropriate time frame after release by the vendor, based on the entity's risk assessment and criticality. Applicable critical security patches are installed within one month of release. Applicability Notes This may require a phased approach with initial testing and installing (for example, within 1 30 days from release) in pre-production of high-criticality systems with subsequent migration to production systems using a risk-based approach."

  children = [
    control.ecs_service_fargate_using_latest_platform_version,
    control.eks_cluster_with_latest_kubernetes_version,
    control.elastic_beanstalk_environment_managed_updates_enabled,
    control.elasticache_cluster_auto_minor_version_upgrade_enabled,
    control.lambda_function_use_latest_runtime,
    control.opensearch_domain_updated_with_latest_service_software_version,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant,
  ]

  tags = merge(local.pci_dss_v400_requirement_6_common_tags, {
    pci_dss_v400_item_id = "6.3.3"
  })
}

benchmark "pci_dss_v400_requirement_6_4" {
  title = "6.4: Public-Facing Web Applications Are Protected Against Attacks"

  children = [
    benchmark.pci_dss_v400_requirement_6_4_1,
    benchmark.pci_dss_v400_requirement_6_4_2,
  ]

  tags = merge(local.pci_dss_v400_requirement_6_common_tags, {
    pci_dss_v400_item_id = "6.4"
  })
}

benchmark "pci_dss_v400_requirement_6_4_1" {
  title       = "6.4.1: Public-facing web applications are protected against attacks."
  description = "Public-facing web applications are protected against attacks by applying either of the following methods: Reviewing public-facing web applications via manual or automated application vulnerability security assessment tools or methods, as follows: At least once every 12 months and after significant changes. By an entity that specializes in application security. All vulnerabilities are corrected. The application is re-evaluated after the corrections."

  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.cloudfront_distribution_waf_enabled,
    control.elb_application_lb_waf_enabled,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_resource_associated,
    control.waf_web_acl_rule_attached,
    control.wafv2_web_acl_rule_attached,
  ]

  tags = merge(local.pci_dss_v400_requirement_6_common_tags, {
    pci_dss_v400_item_id = "6.4.1"
  })
}

benchmark "pci_dss_v400_requirement_6_4_2" {
  title       = "6.4.2: Public-facing web applications are protected against attacks."
  description = "Installing an automated technical solution(s) that continuously detects and prevents web-based attacks, with at least the following: The automated technical solution(s) is located in front of public-facing web applications and is configured to detect and prevent web-based attacks. The automated technical solution(s) is configured to generate audit logs. The automated technical solution(s) is configured to block attacks or generate an alert that is immediately investigated. Applicability Notes Elements in the above requirement that are already covered elsewhere in PCI DSS may be cross-referenced."

  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.cloudfront_distribution_waf_enabled,
    control.elb_application_lb_waf_enabled,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_resource_associated,
    control.waf_web_acl_rule_attached,
    control.wafv2_web_acl_rule_attached,
  ]

  tags = merge(local.pci_dss_v400_requirement_6_common_tags, {
    pci_dss_v400_item_id = "6.4.2"
  })
}

benchmark "pci_dss_v400_requirement_6_5" {
  title = "6.5: Changes to All System Components Are Managed Securely"

  children = [
    benchmark.pci_dss_v400_requirement_6_5_5,
    benchmark.pci_dss_v400_requirement_6_5_6,
  ]

  tags = merge(local.pci_dss_v400_requirement_6_common_tags, {
    pci_dss_v400_item_id = "6.5"
  })
}

benchmark "pci_dss_v400_requirement_6_5_5" {
  title       = "6.5.5: Change control processes and procedures are followed for all changes to system components."
  description = "Responsibilities for using the change control processes are assigned to appropriate personnel who are also trained in how to use the processes."

  children = [
    control.codedeploy_deployment_group_lambda_allatonce_traffic_shift_disabled,
  ]

  tags = merge(local.pci_dss_v400_requirement_6_common_tags, {
    pci_dss_v400_item_id = "6.5.5"
  })
}

benchmark "pci_dss_v400_requirement_6_5_6" {
  title       = "6.5.6: Change control processes and procedures are followed for all changes to system components."
  description = "Upon completion of a significant change, all relevant PCI DSS requirements are implemented on all new or changed systems and networks, and documentation is updated as applicable."

  children = [
    control.codedeploy_deployment_group_lambda_allatonce_traffic_shift_disabled,
  ]

  tags = merge(local.pci_dss_v400_requirement_6_common_tags, {
    pci_dss_v400_item_id = "6.5.6"
  })
} 