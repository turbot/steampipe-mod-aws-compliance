locals {
  audit_manager_pci_v321_requirement_6_common_tags = merge(local.audit_manager_pci_v321_common_tags, {
    control_set = "pci_v321_requirement_6"
  })
}

benchmark "audit_manager_pci_v321_requirement_6" {
  title       = "Requirement 6: Develop and maintain secure systems and applications"
  description = ""

  children = [
    benchmark.audit_manager_pci_v321_requirement_6_1,
    benchmark.audit_manager_pci_v321_requirement_6_2,
    benchmark.audit_manager_pci_v321_requirement_6_3,
    benchmark.audit_manager_pci_v321_requirement_6_4,
    benchmark.audit_manager_pci_v321_requirement_6_5,
    benchmark.audit_manager_pci_v321_requirement_6_6,
  ]

  tags = local.audit_manager_pci_v321_requirement_6_common_tags
}

benchmark "audit_manager_pci_v321_requirement_6_1" {
  title       = "6.1 Establish a process to identify security vulnerabilities, using reputable outside sources for security vulnerability information, and assign a risk ranking (for example, as “high,” “medium,” or “low”) to newly discovered security vulnerabilities"
  description = "The intent of this requirement is that organizations keep up to date with new vulnerabilities that may impact their environment. Sources for vulnerability information should be trustworthy and often include vendor websites, industry news groups, mailing list, or RSS feeds. Once an organization identifies a vulnerability that could affect their environment, the risk that the vulnerability poses must be evaluated and ranked. The organization must therefore have a method in place to evaluate vulnerabilities on an ongoing basis and assign risk rankings to those vulnerabilities. This is not achieved by an ASV scan or internal vulnerability scan, rather this requires a process to actively monitor industry sources for vulnerability information. Classifying the risks (for example, as “high,” “medium,” or “low”) allows organizations to identify, prioritize, and address the highest risk items more quickly and reduce the likelihood that vulnerabilities posing the greatest risk will be exploited."

  children = [
    benchmark.audit_manager_pci_v321_requirement_6_1_b,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_6_common_tags, {
    audit_manager_pci_v321_item_id = "6.1"
  })
}

benchmark "audit_manager_pci_v321_requirement_6_1_b" {
  title       = "6.1.b Interview responsible personnel and observe processes to verify that: • New security vulnerabilities are identified. • A risk ranking is assigned to vulnerabilities that includes identification of all “high risk” and “critical” vulnerabilities. • Processes to identify new security vulnerabilities include using reputable outside sources for security vulnerability information"
  description = "The intent of this requirement is that organizations keep up to date with new vulnerabilities that may impact their environment. Sources for vulnerability information should be trustworthy and often include vendor websites, industry news groups, mailing list, or RSS feeds. Once an organization identifies a vulnerability that could affect their environment, the risk that the vulnerability poses must be evaluated and ranked. The organization must therefore have a method in place to evaluate vulnerabilities on an ongoing basis and assign risk rankings to those vulnerabilities. This is not achieved by an ASV scan or internal vulnerability scan, rather this requires a process to actively monitor industry sources for vulnerability information. Classifying the risks (for example, as “high,” “medium,” or “low”) allows organizations to identify, prioritize, and address the highest risk items more quickly and reduce the likelihood that vulnerabilities posing the greatest risk will be exploited."

  children = [
    control.guardduty_finding_archived,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_6_common_tags, {
    audit_manager_pci_v321_item_id = "6.1.b"
  })
}

benchmark "audit_manager_pci_v321_requirement_6_2" {
  title       = "6.2 Ensure that all system components and software are protected from known vulnerabilities by installing applicable vendor- supplied security patches. Install critical security patches within one month of release. Note: Critical security patches should be identified according to the risk ranking process defined in Requirement 6.1"
  description = "There is a constant stream of attacks using widely published exploits, often called "zero day" (an attack that exploits a previously unknown vulnerability), against otherwise secured systems. If the most recent patches are not implemented on critical systems as soon as possible, a malicious individual can use these exploits to attack or disable a system, or gain access to sensitive data. Prioritizing patches for critical infrastructure ensures that high-priority systems and devices are protected from vulnerabilities as soon as possible after a patch is released. Consider prioritizing patch installations such that security patches for critical or at-risk systems are installed within 30 days, and other lower-risk patches are installed within 2-3 months. This requirement applies to applicable patches for all installed software, including payment applications (both those that are PA-DSS validated and those that are not)."

  children = [
    benchmark.audit_manager_pci_v321_requirement_6_2_b,
    control.ssm_managed_instance_compliance_patch_compliant,
    control.ec2_instance_ssm_managed,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_6_common_tags, {
    audit_manager_pci_v321_item_id = "6.2"
  })
}

benchmark "audit_manager_pci_v321_requirement_6_2_b" {
  title       = "6.2.b For a sample of system components and related software, compare the list of security patches installed on each system to the most recent vendor security-patch list, to verify the following: • That applicable critical vendor-supplied security patches are installed within one month of release. • All applicable vendor-supplied security patches are installed within an appropriate time frame (for example, within three months)"
  description = "There is a constant stream of attacks using widely published exploits, often called `zero day` (an attack that exploits a previously unknown vulnerability), against otherwise secured systems. If the most recent patches are not implemented on critical systems as soon as possible, a malicious individual can use these exploits to attack or disable a system, or gain access to sensitive data. Prioritizing patches for critical infrastructure ensures that high-priority systems and devices are protected from vulnerabilities as soon as possible after a patch is released. Consider prioritizing patch installations such that security patches for critical or at-risk systems are installed within 30 days, and other lower-risk patches are installed within 2-3 months. This requirement applies to applicable patches for all installed software, including payment applications (both those that are PA-DSS validated and those that are not)."

  children = [
    control.eks_cluster_with_latest_kubernetes_version,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.ssm_managed_instance_compliance_patch_compliant,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_6_common_tags, {
    audit_manager_pci_v321_item_id = "6.2.b"
  })
}

benchmark "audit_manager_pci_v321_requirement_6_3" {
  title       = "6.3 Develop internal and external software applications (including web-based administrative access to applications) securely, as follows: • In accordance with PCI DSS (for example, secure authentication and logging) • Based on industry standards and/or best practices. • Incorporating information security throughout the software-development life cycle Note: this applies to all software developed internally as well as bespoke or custom software developed by a third party"
  description = "Without the inclusion of security during the requirements definition, design, analysis, and testing phases of software development, security vulnerabilities can be inadvertently or maliciously introduced into the production environment. Understanding how sensitive data is handled by the application—including when stored, transmitted, and when in memory—can help identify where data needs to be protected."

  children = [
    benchmark.audit_manager_pci_v321_requirement_6_3_1,
    benchmark.audit_manager_pci_v321_requirement_6_3_a,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_6_common_tags, {
    audit_manager_pci_v321_item_id = "6.3"
  })
}

benchmark "audit_manager_pci_v321_requirement_6_3_1" {
  title       = "6.3.1 Examine written software-development procedures and interview responsible personnel to verify that pre- production and/or custom application accounts, user IDs and/or passwords are removed before an application goes into production or is released to customers"
  description = "Development, test and/or custom application accounts, user IDs, and passwords should be removed from production code before the application becomes active or is released to customers, since these items may give away information about the functioning of the application. Possession of such information could facilitate compromise of the application and related cardholder data."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_6_common_tags, {
    audit_manager_pci_v321_item_id = "6.3"
  })
}

// benchmark "audit_manager_pci_v321_requirement_6_3_2" {
//   title       = "6.3.2 Review custom code prior to release to production or customers in order to identify any potential coding vulnerability (using either manual or automated processes) to include at least the following: • Code changes are reviewed by individuals other than the originating code author, and by individuals knowledgeable about code-review techniques and secure coding practices. • Code reviews ensure code is developed according to secure coding guidelines • Appropriate corrections are implemented prior to release. • Code-review results are reviewed and approved by management prior to release"
//   description = "Security vulnerabilities in custom code are commonly exploited by malicious individuals to gain access to a network and compromise cardholder data. An individual knowledgeable and experienced in code-review techniques should be involved in the review process. Code reviews should be performed by someone other than the developer of the code to allow for an independent, objective review. Automated tools or processes may also be used in lieu of manual reviews, but keep in mind that it may be difficult or even impossible for an automated tool to identify some coding issues. Correcting coding errors before the code is deployed into a production environment or released to customers prevents the code exposing the environments to potential exploit. Faulty code is also far more difficult and expensive to address after it has been deployed or released into production environments. Including a formal review and signoff by management prior to release helps to ensure that code is approved and has been developed in accordance with policies and procedures."

//   children = [
//     benchmark.audit_manager_pci_v321_requirement_6_3_2_b,
//   ]
//   tags = merge(local.audit_manager_pci_v321_requirement_6_common_tags, {
//     audit_manager_pci_v321_item_id = "6.3.2"
//   })
// }

// benchmark "audit_manager_pci_v321_requirement_6_3_2_b" {
//   title       = "6.3.2.b Select a sample of recent custom application changes and verify that custom application code is reviewed"
//   description = "Security vulnerabilities in custom code are commonly exploited by malicious individuals to gain access to a network and compromise cardholder data. An individual knowledgeable and experienced in code-review techniques should be involved in the review process. Code reviews should be performed by someone other than the developer of the code to allow for an independent, objective review. Automated tools or processes may also be used in lieu of manual reviews, but keep in mind that it may be difficult or even impossible for an automated tool to identify some coding issues. Correcting coding errors before the code is deployed into a production environment or released to customers prevents the code exposing the environments to potential exploit. Faulty code is also far more difficult and expensive to address after it has been deployed or released into production environments. Including a formal review and signoff by management prior to release helps to ensure that code is approved and has been developed in accordance with policies and procedures."

//   children = [
    
//   ]
//   tags = merge(local.audit_manager_pci_v321_requirement_6_common_tags, {
//     audit_manager_pci_v321_item_id = "6.3.2.b"
//   })
// }

benchmark "audit_manager_pci_v321_requirement_6_3_a" {
  title       = "6.3.a Examine written software-development processes to verify that the processes are based on industry standards and/or best practices"
  description = "Without the inclusion of security during the requirements definition, design, analysis, and testing phases of software development, security vulnerabilities can be inadvertently or maliciously introduced into the production environment. Understanding how sensitive data is handled by the application—including when stored, transmitted, and when in memory—can help identify where data needs to be protected."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured,
  ]
  tags = merge(local.audit_manager_pci_v321_requirement_6_common_tags, {
    audit_manager_pci_v321_item_id = "6.3.a"
  })
}