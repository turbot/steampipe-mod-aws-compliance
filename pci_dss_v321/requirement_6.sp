locals {
  pci_dss_v321_requirement_6_common_tags = merge(local.pci_dss_v321_common_tags, {
    control_set = "6"
  })
}

benchmark "pci_dss_v321_requirement_6" {
  title       = "Requirement 6: Develop and maintain secure systems and applications"
  description = "Unscrupulous individuals use security vulnerabilities to gain privileged access to systems. Many of these vulnerabilities are fixed by vendorprovided security patches, which must be installed by the entities that manage the systems."

  children = [
    benchmark.pci_dss_v321_requirement_6_1,
    benchmark.pci_dss_v321_requirement_6_2,
    benchmark.pci_dss_v321_requirement_6_3,
    benchmark.pci_dss_v321_requirement_6_5,
    benchmark.pci_dss_v321_requirement_6_6
  ]

  tags = local.pci_dss_v321_requirement_6_common_tags
}

benchmark "pci_dss_v321_requirement_6_1" {
  title       = "6.1 Establish a process to identify security vulnerabilities, using reputable outside sources for security vulnerability information, and assign a risk ranking (for example, as “high,” “medium,” or “low”) to newly discovered security vulnerabilities"
  description = "The intent of this requirement is that organizations keep up to date with new vulnerabilities that may impact their environment. Sources for vulnerability information should be trustworthy and often include vendor websites, industry news groups, mailing list, or RSS feeds. Once an organization identifies a vulnerability that could affect their environment, the risk that the vulnerability poses must be evaluated and ranked. The organization must therefore have a method in place to evaluate vulnerabilities on an ongoing basis and assign risk rankings to those vulnerabilities. This is not achieved by an ASV scan or internal vulnerability scan, rather this requires a process to actively monitor industry sources for vulnerability information. Classifying the risks (for example, as “high,” “medium,” or “low”) allows organizations to identify, prioritize, and address the highest risk items more quickly and reduce the likelihood that vulnerabilities posing the greatest risk will be exploited."

  children = [
    benchmark.pci_dss_v321_requirement_6_1_b
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.1"
  })
}

benchmark "pci_dss_v321_requirement_6_1_b" {
  title       = "6.1.b Interview responsible personnel and observe processes to verify that new security vulnerabilities are identified, a risk ranking is assigned to vulnerabilities that includes identification of all “high risk” and “critical” vulnerabilities and processes to identify new security vulnerabilities include using reputable outside sources for security vulnerability information"
  description = "The intent of this requirement is that organizations keep up to date with new vulnerabilities that may impact their environment. Sources for vulnerability information should be trustworthy and often include vendor websites, industry news groups, mailing list, or RSS feeds. Once an organization identifies a vulnerability that could affect their environment, the risk that the vulnerability poses must be evaluated and ranked. The organization must therefore have a method in place to evaluate vulnerabilities on an ongoing basis and assign risk rankings to those vulnerabilities. This is not achieved by an ASV scan or internal vulnerability scan, rather this requires a process to actively monitor industry sources for vulnerability information. Classifying the risks (for example, as “high,” “medium,” or “low”) allows organizations to identify, prioritize, and address the highest risk items more quickly and reduce the likelihood that vulnerabilities posing the greatest risk will be exploited."

  children = [
    control.guardduty_finding_archived
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.1.b"
  })
}

benchmark "pci_dss_v321_requirement_6_2" {
  title       = "6.2 Ensure that all system components and software are protected from known vulnerabilities by installing applicable vendor- supplied security patches"
  description = "Install critical security patches within one month of release. Note: Critical security patches should be identified according to the risk ranking process defined in Requirement 6.1. There is a constant stream of attacks using widely published exploits, often called `zero day` (an attack that exploits a previously unknown vulnerability), against otherwise secured systems. If the most recent patches are not implemented on critical systems as soon as possible, a malicious individual can use these exploits to attack or disable a system, or gain access to sensitive data. Prioritizing patches for critical infrastructure ensures that high-priority systems and devices are protected from vulnerabilities as soon as possible after a patch is released. Consider prioritizing patch installations such that security patches for critical or at-risk systems are installed within 30 days, and other lower-risk patches are installed within 2-3 months. This requirement applies to applicable patches for all installed software, including payment applications (both those that are PA-DSS validated and those that are not)."

  children = [
    benchmark.pci_dss_v321_requirement_6_2_b,
    control.ec2_instance_ssm_managed,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.2"
  })
}

benchmark "pci_dss_v321_requirement_6_2_b" {
  title       = "6.2.b For a sample of system components and related software, compare the list of security patches installed on each system to the most recent vendor security-patch list, to verify that the applicable critical vendor-supplied security patches are installed within one month of release, all applicable vendor-supplied security patches are installed within an appropriate time frame (for example, within three months)"
  description = "There is a constant stream of attacks using widely published exploits, often called `zero day` (an attack that exploits a previously unknown vulnerability), against otherwise secured systems. If the most recent patches are not implemented on critical systems as soon as possible, a malicious individual can use these exploits to attack or disable a system, or gain access to sensitive data. Prioritizing patches for critical infrastructure ensures that high-priority systems and devices are protected from vulnerabilities as soon as possible after a patch is released. Consider prioritizing patch installations such that security patches for critical or at-risk systems are installed within 30 days, and other lower-risk patches are installed within 2-3 months. This requirement applies to applicable patches for all installed software, including payment applications (both those that are PA-DSS validated and those that are not)."

  children = [
    control.eks_cluster_with_latest_kubernetes_version,
    control.rds_db_instance_automatic_minor_version_upgrade_enabled,
    control.ssm_managed_instance_compliance_patch_compliant
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.2.b"
  })
}

benchmark "pci_dss_v321_requirement_6_3" {
  title       = "6.3 Develop internal and external software applications (including web-based administrative access to applications) securely"
  description = "Develop internal and external software application securely as follows: in accordance with PCI DSS (for example, secure authentication and logging), based on industry standards and/or best practices, incorporating information security throughout the software-development life cycle. Note: this applies to all software developed internally as well as bespoke or custom software developed by a third party. Without the inclusion of security during the requirements definition, design, analysis, and testing phases of software development, security vulnerabilities can be inadvertently or maliciously introduced into the production environment. Understanding how sensitive data is handled by the application—including when stored, transmitted, and when in memory—can help identify where data needs to be protected."

  children = [
    benchmark.pci_dss_v321_requirement_6_3_1,
    benchmark.pci_dss_v321_requirement_6_3_2,
    benchmark.pci_dss_v321_requirement_6_3_a,
    benchmark.pci_dss_v321_requirement_6_3_b,
    benchmark.pci_dss_v321_requirement_6_3_c
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.3"
  })
}

benchmark "pci_dss_v321_requirement_6_3_1" {
  title       = "6.3.1 Examine written software-development procedures and interview responsible personnel to verify that pre-production and/or custom application accounts, user IDs and/or passwords are removed before an application goes into production or is released to customers"
  description = "Development, test and/or custom application accounts, user IDs, and passwords should be removed from production code before the application becomes active or is released to customers, since these items may give away information about the functioning of the application. Possession of such information could facilitate compromise of the application and related cardholder data."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.3.1"
  })
}

benchmark "pci_dss_v321_requirement_6_3_2" {
  title       = "6.3.2 Review custom code prior to release to production or customers in order to identify any potential coding vulnerability (using either manual or automated processes)"
  description = "Custom code prior to release to production should include the following: code changes are reviewed by individuals other than the originating code author, and by individuals knowledgeable about code-review techniques and secure coding practices, code reviews ensure code is developed according to secure coding guidelines, appropriate corrections are implemented prior to release, code-review results are reviewed and approved by management prior to release and security vulnerabilities in custom code are commonly exploited by malicious individuals to gain access to a network and compromise cardholder data. An individual knowledgeable and experienced in code-review techniques should be involved in the review process. Code reviews should be performed by someone other than the developer of the code to allow for an independent, objective review. Automated tools or processes may also be used in lieu of manual reviews, but keep in mind that it may be difficult or even impossible for an automated tool to identify some coding issues. Correcting coding errors before the code is deployed into a production environment or released to customers prevents the code exposing the environments to potential exploit. Faulty code is also far more difficult and expensive to address after it has been deployed or released into production environments. Including a formal review and signoff by management prior to release helps to ensure that code is approved and has been developed in accordance with policies and procedures."

  children = [
    benchmark.pci_dss_v321_requirement_6_3_2_b
  ]
  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.3.2"
  })
}

benchmark "pci_dss_v321_requirement_6_3_2_b" {
  title       = "6.3.2.b Select a sample of recent custom application changes and verify that custom application code is reviewed according to 6.3.2.a, above"
  description = "Security vulnerabilities in custom code are commonly exploited by malicious individuals to gain access to a network and compromise cardholder data. An individual knowledgeable and experienced in code-review techniques should be involved in the review process. Code reviews should be performed by someone other than the developer of the code to allow for an independent, objective review. Automated tools or processes may also be used in lieu of manual reviews, but keep in mind that it may be difficult or even impossible for an automated tool to identify some coding issues. Correcting coding errors before the code is deployed into a production environment or released to customers prevents the code exposing the environments to potential exploit. Faulty code is also far more difficult and expensive to address after it has been deployed or released into production environments. Including a formal review and signoff by management prior to release helps to ensure that code is approved and has been developed in accordance with policies and procedures."

  children = [
    control.codedeploy_deployment_group_lambda_allatonce_traffic_shift_disabled
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.3.2.b"
  })
}

benchmark "pci_dss_v321_requirement_6_3_a" {
  title       = "6.3.a Examine written software-development processes to verify that the processes are based on industry standards and/or best practices"
  description = "Without the inclusion of security during the requirements definition, design, analysis, and testing phases of software development, security vulnerabilities can be inadvertently or maliciously introduced into the production environment. Understanding how sensitive data is handled by the application—including when stored, transmitted, and when in memory—can help identify where data needs to be protected."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.3.a"
  })
}

benchmark "pci_dss_v321_requirement_6_3_b" {
  title       = "6.3.b Examine written software-development processes to verify that information security is included throughout the life cycle"
  description = "Without the inclusion of security during the requirements definition, design, analysis, and testing phases of software development, security vulnerabilities can be inadvertently or maliciously introduced into the production environment. Understanding how sensitive data is handled by the application—including when stored, transmitted, and when in memory—can help identify where data needs to be protected."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.3.b"
  })
}

benchmark "pci_dss_v321_requirement_6_3_c" {
  title       = "6.3.c Examine written software-development processes to verify that software applications are developed in accordance with PCI DSS"
  description = "Without the inclusion of security during the requirements definition, design, analysis, and testing phases of software development, security vulnerabilities can be inadvertently or maliciously introduced into the production environment. Understanding how sensitive data is handled by the application—including when stored, transmitted, and when in memory—can help identify where data needs to be protected."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled,
    control.codebuild_project_plaintext_env_variables_no_sensitive_aws_values,
    control.codebuild_project_source_repo_oauth_configured
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.3.c"
  })
}

benchmark "pci_dss_v321_requirement_6_5" {
  title       = "6.5 Address common coding vulnerabilities in software-development processes like train developers at least annually in up-to-date secure coding techniques etc"
  description = "Common coding vulnerabilities in software-development processes as follows: train developers at least annually in up- to-date secure coding techniques, including how to avoid common coding vulnerabilities, develop applications based on secure coding guidelines. Note: The vulnerabilities listed at 6.5.1 through 6.5.10 were current with industry best practices when this version of PCI DSS was published. However, as industry best practices for vulnerability management are updated (for example, the OWASP Guide, SANS CWE Top 25, CERT Secure Coding, etc.), the current best practices must be used for these requirements. The application layer is high-risk and may be targeted by both internal and external threats. Requirements 6.5.1 through 6.5.10 are the minimum controls that should be in place, and organizations should incorporate the relevant secure coding practices as applicable to the particular technology in their environment. Application developers should be properly trained to identify and resolve issues related to these (and other) common coding vulnerabilities. Having staff knowledgeable of secure coding guidelines should minimize the number of security vulnerabilities introduced through poor coding practices. Training for developers may be provided in-house or by third parties and should be applicable for technology used. As industry-accepted secure coding practices change, organizational coding practices and developer training should likewise be updated to address new threats—for example, memory scraping attacks. The vulnerabilities identified in 6.5.1 through 6.5.10 provide a minimum baseline. It is up to the organization to remain up to date with vulnerability trends and incorporate appropriate measures into their secure coding practices."

  children = [
    benchmark.pci_dss_v321_requirement_6_5_8
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.5"
  })
}

benchmark "pci_dss_v321_requirement_6_5_8" {
  title       = "6.5.8 Examine software-development policies and procedures and interview responsible personnel to verify that improper access control—such as insecure direct object references, failure to restrict URL access, and directory traversal—is addressed by coding technique"
  description = "Directory traversal—is addressed by coding technique should include: proper authentication of users, sanitizing input, not exposing internal object references to users and user interfaces that do not permit access to unauthorized functions. A direct object reference occurs when a developer exposes a reference to an internal implementation object, such as a file, directory, database record, or key, as a URL or form parameter. Attackers can manipulate those references to access other objects without authorization. Consistently enforce access control in presentation layer and business logic for all URLs. Frequently, the only way an application protects sensitive functionality is by preventing the display of links or URLs to unauthorized users. Attackers can use this weakness to access and perform unauthorized operations by accessing those URLs directly. An attacker may be able to enumerate and navigate the directory structure of a website (directory traversal) thus gaining access to unauthorized information as well as gaining further insight into the workings of the site for later exploitation. If user interfaces permit access to unauthorized functions, this access could result in unauthorized individuals gaining access to privileged credentials or cardholder data. Only authorized users should be permitted to access direct object references to sensitive resources. Limiting access to data resources will help prevent cardholder data from being presented to unauthorized resources."

  children = [
    control.codebuild_project_environment_privileged_mode_disabled
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.5.8"
  })
}

benchmark "pci_dss_v321_requirement_6_6" {
  title       = "6.6 For public-facing web applications, ensure that either one of the requirements are in place"
  description = "Verify following methods is in place as follows: examine documented processes, interview personnel, and examine records of application security assessments to verify that public-facing web applications are reviewed—using either manual or automated vulnerability security assessment tools or methods—as follows: - At least annually - After any changes - By an organization that specializes in application security - That, at a minimum, all vulnerabilities in Requirement 6.5 are included in the assessment - That all vulnerabilities are corrected - That the application is re-evaluated after the corrections. Examine the system configuration settings and interview responsible personnel to verify that an automated technical solution that detects and prevents web-based attacks (for example, a web-application firewall) is in place as follows: - Is situated in front of public-facing web applications to detect and prevent web-based attacks. - Is actively running and up to date as applicable. - Is generating audit logs. - Is configured to either block web-based attacks, or generate an alert that is immediately investigated.Public-facing web applications are primary targets for attackers, and poorly coded web applications provide an easy path for attackers to gain access to sensitive data and systems. The requirement for reviewing applications or installing web-application firewalls is intended to reduce the number of compromises on public-facing web applications due to poor coding or application management practices. Manual or automated vulnerability security assessment tools or methods review and/or test the application for vulnerabilities, web-application firewalls filter and block non- essential traffic at the application layer. Used in conjunction with a network-based firewall, a properly configured web-application firewall prevents application-layer attacks if applications are improperly coded or configured. This can be achieved through a combination of technology and process. Process-based solutions must have mechanisms that facilitate timely responses to alerts in order to meet the intent of this requirement, which is to prevent attacks. Note: “An organization that specializes in application security” can be either a third-party company or an internal organization, as long as the reviewers specialize in application security and can demonstrate independence from the development team. For public-facing web applications, address new threats and vulnerabilities on an ongoing basis and ensure these applications are protected against known attacks by either of the following methods: reviewing public-facing web applications via manual or automated application vulnerability security assessment tools or methods, at least annually and after any changes Note: This assessment is not the same as the vulnerability scans performed for Requirement 11.2., Installing an automated technical solution that detects and prevents web- based attacks (for example, a web- application firewall) in front of public- facing web applications, to continually check all traffic."

  children = [
    control.apigateway_stage_use_waf_web_acl,
    control.elb_application_lb_desync_mitigation_mode,
    control.elb_application_lb_waf_enabled,
    control.elb_classic_lb_desync_mitigation_mode,
    control.waf_regional_rule_condition_attached,
    control.waf_regional_rule_group_rule_attached,
    control.waf_regional_web_acl_rule_attached,
    control.waf_rule_condition_attached,
    control.waf_rule_group_rule_attached,
    control.waf_web_acl_resource_associated,
    control.waf_web_acl_rule_attached
  ]

  tags = merge(local.pci_dss_v321_requirement_6_common_tags, {
    pci_dss_v321_item_id = "6.6"
  })
}
