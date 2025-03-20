locals {
  pci_dss_v40_requirement_6_common_tags = merge(local.pci_dss_v40_common_tags, {
    control_set = "6"
  })
}

benchmark "pci_dss_v40_requirement_6" {
  title       = "Requirement 6: Develop and Maintain Secure Systems and Software"
  description = "Actors with bad intentions can use security vulnerabilities to gain privileged access to systems. Many of these vulnerabilities are fixed by vendor provided security patches, which must be installed by the entities that manage the systems. All system components must have all appropriate software patches to protect against the exploitation and compromise of account data by malicious individuals and malicious software."

  children = [
    benchmark.pci_dss_v40_requirement_6_3,
    benchmark.pci_dss_v40_requirement_6_4,
    benchmark.pci_dss_v40_requirement_6_5
  ]

  tags = local.pci_dss_v40_requirement_6_common_tags
}

benchmark "pci_dss_v40_requirement_6_3" {
  title       = "6.3 Security vulnerabilities are identified and addressed"

  children = [
    benchmark.pci_dss_v40_requirement_6_3_3
  ]

  tags = merge(local.pci_dss_v40_requirement_6_common_tags, {
    pci_dss_v40_item_id = "6.3"
  })
}

benchmark "pci_dss_v40_requirement_6_3_3" {
  title       = "6.3.3: All system components are protected from known vulnerabilities by installing applicable security patches/updates"
  description = "New exploits are constantly being discovered, and these can permit attacks against systems that have previously been considered secure."

  children = [
    control.ecs_service_fargate_using_latest_platform_version,
    control.eks_cluster_with_latest_kubernetes_version,
    control.elastic_beanstalk_environment_managed_updates_enabled,
    control.elasticache_cluster_auto_minor_version_upgrade_enabled,
    control.lambda_function_use_latest_runtime,
    control.opensearch_domain_updated_with_latest_service_software_version,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.pci_dss_v40_requirement_6_common_tags, {
    pci_dss_v40_item_id = "6.3.3"
  })
}

benchmark "pci_dss_v40_requirement_6_4" {
  title       = "6.4 Public-facing web applications are protected against attacks"

  children = [
    benchmark.pci_dss_v40_requirement_6_4_1,
    benchmark.pci_dss_v40_requirement_6_4_2
  ]

  tags = merge(local.pci_dss_v40_requirement_6_common_tags, {
    pci_dss_v40_item_id = "6.4"
  })
}

benchmark "pci_dss_v40_requirement_6_4_1" {
  title       = "6.4.1: For public-facing web applications, new threats and vulnerabilities are addressed on an ongoing basis and these applications are protected against known attacks"
  description = "Public-facing web applications are those that are available to the public (not only for internal use). These applications are primary targets for attackers, and poorly coded web applications provide an easy path for attackers to gain access to sensitive data and systems."

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
    control.wafv2_web_acl_rule_attached
  ]

  tags = merge(local.pci_dss_v40_requirement_6_common_tags, {
    pci_dss_v40_item_id = "6.4.1"
  })
}

benchmark "pci_dss_v40_requirement_6_4_2" {
  title       = "6.4.2: For public-facing web applications, an automated technical solution is deployed that continually detects and prevents web-based attacks"
  description = "Public-facing web applications are primary targets for attackers, and poorly coded web applications provide an easy path for attackers to gain access to sensitive data and systems."

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
    control.wafv2_web_acl_rule_attached
  ]

  tags = merge(local.pci_dss_v40_requirement_6_common_tags, {
    pci_dss_v40_item_id = "6.4.2"
  })
}

benchmark "pci_dss_v40_requirement_6_5" {
  title       = "6.5: Changes to all system components are managed securely"

  children = [
    benchmark.pci_dss_v40_requirement_6_5_5,
    benchmark.pci_dss_v40_requirement_6_5_6
  ]

  tags = merge(local.pci_dss_v40_requirement_6_common_tags, {
    pci_dss_v40_item_id = "6.5"
  })
}

benchmark "pci_dss_v40_requirement_6_5_5" {
  title       = "6.5.5: Live PANs are not used in pre-production environments, except where those environments are included in the CDE and protected in accordance with all applicable PCI DSS requirements"
  description = "Use of live PANs outside of protected CDEs provides malicious individuals with the opportunity to gain unauthorized access to cardholder data."

  children = [
    control.codedeploy_deployment_group_lambda_allatonce_traffic_shift_disabled
  ]

  tags = merge(local.pci_dss_v40_requirement_6_common_tags, {
    pci_dss_v40_item_id = "6.5.5"
  })
}

benchmark "pci_dss_v40_requirement_6_5_6" {
  title       = "6.5.6: Test data and test accounts are removed from system components before the system goes into production"
  description = "This data may give away information about the functioning of an application or system and is an easy target for unauthorized individuals to exploit to gain access to systems. Possession of such information could facilitate compromise of the system and related account data."

  children = [
    control.codedeploy_deployment_group_lambda_allatonce_traffic_shift_disabled
  ]

  tags = merge(local.pci_dss_v40_requirement_6_common_tags, {
    pci_dss_v40_item_id = "6.5.6"
  })
} 