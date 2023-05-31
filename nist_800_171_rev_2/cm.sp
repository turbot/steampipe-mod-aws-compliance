benchmark "nist_800_171_rev_2_3_4" {
  title       = "3.4 Configuration Management"
  description = "CM controls are specific to an organization's configuration management policies. This includes a baseline configuration to operate as the basis for future builds or changes to information systems. Additionally, this includes information system component inventories and a security impact analysis control."
  children = [
    benchmark.nist_800_171_rev_2_3_4_1,
    benchmark.nist_800_171_rev_2_3_4_2,
    benchmark.nist_800_171_rev_2_3_4_3,
    benchmark.nist_800_171_rev_2_3_4_4,
    benchmark.nist_800_171_rev_2_3_4_5,
    benchmark.nist_800_171_rev_2_3_4_6,
    benchmark.nist_800_171_rev_2_3_4_7,
    benchmark.nist_800_171_rev_2_3_4_9
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_4_1" {
  title       = "3.4.1 Establish and maintain baseline configurations and inventories of organizational systems (including hardware, software, firmware, and documentation) throughout the respective system development life cycles"
  description = "Baseline configurations are documented, formally reviewed, and agreed-upon specifications for systems or configuration items within those systems. Baseline configurations serve as a basis for future builds, releases, and changes to systems. Baseline configurations include information about system components (e.g., standard software packages installed on workstations, notebook computers, servers, network components, or mobile devices; current version numbers and update and patch information on operating systems and applications; and configuration settings and parameters), network topology, and the logical placement of those components within the system architecture. Baseline configurations of systems also reflect the current enterprise architecture. Maintaining effective baseline configurations requires creating new baselines as organizational systems change over time. Baseline configuration maintenance includes reviewing and updating the baseline configuration when changes are made based on security risks and deviations from the established baseline configuration Organizations can implement centralized system component inventories that include components from multiple organizational systems. In such situations, organizations ensure that the resulting inventories include system-specific information required for proper component accountability (e.g., system association, system owner). Information deemed necessary for effective accountability of system components includes hardware inventory specifications, software license information, software version numbers, component owners, and for networked components or devices, machine names and network addresses. Inventory specifications include manufacturer, device type, model, serial number, and physical location."
  children = [
    control.cloudtrail_security_trail_enabled,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.elb_application_lb_deletion_protection_enabled,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_eip_associated,
    control.vpc_security_group_associated_to_eni,
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_4_2" {
  title       = "3.4.2 Establish and enforce security configuration settings for information technology products employed in organizational systems"
  description = "Configuration settings are the set of parameters that can be changed in hardware, software, or firmware components of the system that affect the security posture or functionality of the system. Information technology products for which security-related configuration settings can be defined include mainframe computers, servers, workstations, input and output devices (e.g., scanners, copiers, and printers), network components (e.g., firewalls, routers, gateways, voice and data switches, wireless access points, network appliances, sensors), operating systems, middleware, and applications. Security parameters are those parameters impacting the security state of systems including the parameters required to satisfy other security requirements. Security parameters include: registry settings; account, file, directory permission settings; and settings for functions, ports, protocols, and remote connections. Organizations establish organization-wide configuration settings and subsequently derive specific configuration settings for systems. The established settings become part of the systems configuration baseline. Common secure configurations (also referred to as security configuration checklists, lockdown and hardening guides, security reference guides, security technical implementation guides) provide recognized, standardized, and established benchmarks that stipulate secure configuration settings for specific information technology platforms/products and instructions for configuring those system components to meet operational requirements. Common secure configurations can be developed by a variety of organizations including information technology product developers, manufacturers, vendors, consortia, academia, industry, federal agencies, and other organizations in the public and private sectors."
  children = [
    control.config_enabled_all_regions,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.ec2_stopped_instance_30_days,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_associated_to_eni
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_4_3" {
  title       = "3.4.3 Track, review, approve or disapprove, and log changes to organizational systems"
  description = "Tracking, reviewing, approving/disapproving, and logging changes is called configuration change control. Configuration change control for organizational systems involves the systematic proposal, justification, implementation, testing, review, and disposition of changes to the systems, including system upgrades and modifications. Configuration change control includes changes to baseline configurations for components and configuration items of systems, changes to configuration settings for information technology products (e.g., operating systems, applications, firewalls, routers, and mobile devices), unscheduled and unauthorized changes, and changes to remediate vulnerabilities."
  children = [
    control.config_enabled_all_regions
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_4_4" {
  title       = "3.4.4 Analyze the security impact of changes prior to implementation"
  description = "Organizational personnel with information security responsibilities (e.g., system administrators, system security officers, system security managers, and systems security engineers) conduct security impact analyses. Individuals conducting security impact analyses possess the necessary skills and technical expertise to analyze the changes to systems and the associated security ramifications. Security impact analysis may include reviewing security plans to understand security requirements and reviewing system design documentation to understand the implementation of controls and how specific changes might affect the controls. Security impact analyses may also include risk assessments to better understand the impact of the changes and to determine if additional controls are required."
  children = [
    control.config_enabled_all_regions
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_4_5" {
  title       = "3.4.5 Define, document, approve, and enforce physical and logical access restrictions associated with changes to organizational systems"
  description = "Any changes to the hardware, software, or firmware components of systems can potentially have significant effects on the overall security of the systems. Therefore, organizations permit only qualified and authorized individuals to access systems for purposes of initiating changes, including upgrades and modifications. Access restrictions for change also include software libraries."
  children = [
    control.config_enabled_all_regions
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_4_6" {
  title       = "3.4.6 Employ the principle of least functionality by configuring organizational systems to provide only essential capabilities"
  description = "Systems can provide a wide variety of functions and services. Some of the functions and services routinely provided by default, may not be necessary to support essential organizational missions, functions, or operations. It is sometimes convenient to provide multiple services from single system components. However, doing so increases risk over limiting the services provided by any one component. Where feasible, organizations limit component functionality to a single function per component. Organizations review functions and services provided by systems or components of systems, to determine which functions and services are candidates for elimination. Organizations disable unused or unnecessary physical and logical ports and protocols to prevent unauthorized connection of devices, transfer of information, and tunneling. Organizations can utilize network scanning tools, intrusion detection and prevention systems, and end-point protections such as firewalls and host-based intrusion detection systems to identify and prevent the use of prohibited functions, ports, protocols, and services."
  children = [
    control.dms_replication_instance_not_publicly_accessible,
    control.ebs_snapshot_not_publicly_restorable,
    control.ebs_volume_unused,
    control.ec2_instance_ssm_managed,
    control.iam_group_user_role_no_inline_policies,
    control.iam_policy_no_star_star,
    control.iam_root_user_no_access_keys,
    control.iam_user_no_inline_attached_policies,
    control.lambda_function_restrict_public_access,
    control.rds_db_snapshot_prohibit_public_access,
    control.redshift_cluster_prohibit_public_access,
    control.s3_bucket_restrict_public_read_access,
    control.s3_bucket_restrict_public_write_access,
    control.s3_public_access_block_account,
    control.ssm_managed_instance_compliance_association_compliant,
    control.vpc_security_group_restrict_ingress_common_ports_all
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_4_7" {
  title       = "3.4.7 Restrict, disable, or prevent the use of nonessential programs, functions, ports, protocols, and services"
  description = "Restricting the use of nonessential software (programs) includes restricting the roles allowed to approve program execution; prohibiting auto-execute; program blacklisting and whitelisting; or restricting the number of program instances executed at the same time. The organization makes a security-based determination which functions, ports, protocols, and/or services are restricted. Bluetooth, File Transfer Protocol (FTP), and peer-to-peer networking are examples of protocols organizations consider preventing the use of, restricting, or disabling."
  children = [
    control.vpc_default_security_group_restricts_all_traffic,
    control.vpc_security_group_restrict_ingress_common_ports_all,
    control.vpc_security_group_restrict_ingress_ssh_all,
    control.vpc_security_group_restrict_ingress_tcp_udp_all
  ]

  tags = local.nist_800_171_rev_2_common_tags
}

benchmark "nist_800_171_rev_2_3_4_9" {
  title       = "3.4.9 Control and monitor user-installed software"
  description = "Users can install software in organizational systems if provided the necessary privileges. To maintain control over the software installed, organizations identify permitted and prohibited actions regarding software installation through policies. Permitted software installations include updates and security patches to existing software and applications from organization-approved 'app stores.' Prohibited software installations may include software with unknown or suspect pedigrees or software that organizations consider potentially malicious. The policies organizations select governing user-installed software may be organization-developed or provided by some external entity. Policy enforcement methods include procedural methods, automated methods, or both."
  children = [
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_association_compliant
  ]

  tags = local.nist_800_171_rev_2_common_tags
}
