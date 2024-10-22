benchmark "nist_800_172_3_4" {
  title       = "3.4 Configuration Management"
  description = "CM controls are specific to an organization's configuration management policies. This includes a baseline configuration to operate as the basis for future builds or changes to information systems. Additionally, this includes information system component inventories and a security impact analysis control."
  children = [
    benchmark.nist_800_172_3_4_2_e,
    benchmark.nist_800_172_3_4_3_e
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_4_2_e" {
  title       = "3.4.2e Employ automated mechanisms to detect misconfigured or unauthorized system components; after detection, [Selection (one or more): remove the components; place the components in a quarantine or remediation network] to facilitate patching, re-configuration, or other mitigations"
  description = "System components used to process, store, transmit, or protect CUI are monitored and checked against the authoritative source (i.e., hardware and software inventory and associated baseline configurations). From an automated assessment perspective, the system description provided by the authoritative source is referred to as the desired state. Using automated tools, the desired state is compared to the actual state to check for compliance or deviations. Security responses to system components that are unknown or that deviate from approved configurations can include removing the components; halting system functions or processing; placing the system components in a quarantine or remediation network that facilitates patching, re-configuration, or other mitigations; or issuing alerts and/or notifications to personnel when there is an unauthorized modification of an organization-defined configuration item. Responses can be automated, manual, or procedural. Components that are removed from the system are rebuilt from the trusted configuration baseline established by the authoritative source."
  children = [
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.redshift_cluster_maintenance_settings_check,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = local.nist_800_172_common_tags
}

benchmark "nist_800_172_3_4_3_e" {
  title       = "3.4.3e Employ automated discovery and management tools to maintain an up-to-date, complete, accurate, and readily available inventory of system components"
  description = "The system component inventory includes system-specific information required for component accountability and to provide support to identify, control, monitor, and verify configuration items in accordance with the authoritative source. The information necessary for effective accountability of system components includes the system name, hardware and software component owners,hardware inventory specifications,software license information,software version numbers, and—for networked components—the machine names and network addresses. Inventory specifications include the manufacturer, supplier information, component type, date of receipt, cost, model, serial number, and physical location. Organizations also use automated mechanisms to implement and maintain authoritative (i.e., up-to-date, complete, accurate, and available) baseline configurations for systems that include hardware and software inventory tools, configuration management tools, and network management tools. Tools can be used to track version numbers on operating systems, applications, types of software installed, and current patch levels."
  children = [
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.vpc_eip_associated,
    control.vpc_network_acl_unused
  ]

  tags = local.nist_800_172_common_tags
}
