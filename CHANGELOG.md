## v0.80 [2023-09-15]

_Bug fixes_

- Added the missing `resource` column in the queries of `glue_data_catalog_encryption_settings_metadata_encryption_enabled` and `glue_data_catalog_encryption_settings_password_encryption_enabled` controls. ([#715](https://github.com/turbot/steampipe-mod-aws-compliance/pull/715))

## v0.79 [2023-09-07]

_Breaking changes_

- The `Other Compliance Checks` benchmark (`steampipe check benchmark.other_checks`) has been removed and replaced by the new `All Controls` benchmark (`steampipe check benchmark.all_controls`). This new benchmark includes 353 service-specific controls. ([#710](https://github.com/turbot/steampipe-mod-aws-compliance/pull/710))

## v0.78 [2023-08-08]

_Breaking changes_

- The `CIS Controls v8 IG1` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/CIS-controls-v8.html). The following updates have been made to the benchmark: ([#706](https://github.com/turbot/steampipe-mod-aws-compliance/pull/706))
  - The following sub-benchmarks have been removed from the `cis_controls_v8_ig1` benchmark:
    - `cis_controls_v8_ig1_13`
    - `cis_controls_v8_ig1_16`
  - The following controls have been added to the benchmarks:
    - `ebs_attached_volume_encryption_enabled`
    - `iam_account_password_policy_strong_min_reuse_24`
    - `s3_bucket_policy_restrict_public_access`
    - `ssm_document_prohibit_public_access`
    - `waf_web_acl_logging_enabled`
  - The following controls are no longer included in the benchmarks:
    - `apigateway_stage_use_waf_web_acl`
    - `codebuild_project_artifact_encryption_enabled`
    - `codebuild_project_environment_privileged_mode_disabled`
    - `codebuild_project_logging_enabled`
    - `codebuild_project_plaintext_env_variables_no_sensitive_aws_values`
    - `codebuild_project_source_repo_oauth_configured`
    - `ebs_volume_encryption_at_rest_enabled`
    - `iam_account_password_policy_min_length_14`
    - `s3_bucket_policy_restricts_cross_account_permission_changes`

_Enhancements_

- The `Foundational Security Best Practices v1.0.0` benchmark has been updated to better align with the matching [AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/doc-history.html). The following updates have been made: ([#704](https://github.com/turbot/steampipe-mod-aws-compliance/pull/704))
  - The following sub-benchmarks have been added to the `foundational_security` benchmark:
    - `foundational_security_athena`
    - `foundational_security_docdb`
    - `foundational_security_neptune`
  - The following controls have been added to the benchmarks:
    - `foundational_security_rds_27`

- The `AWS Audit Manager Control Tower Guardrails` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/controltower.html). The following updates have been made to the benchmark: ([#705](https://github.com/turbot/steampipe-mod-aws-compliance/pull/705))
  - The following controls have been added to the benchmarks:
    - `ebs_volume_unused`
    - `rds_db_instance_encryption_at_rest_enabled`
  - The following controls are no longer included in the benchmarks:
    - `ebs_attached_volume_delete_on_termination_enabled`
    - `rds_db_snapshot_encrypted_at_rest`

## v0.77 [2023-07-28]

_Enhancements_

- Added the following controls to `Other Compliance Checks` benchmark: ([#697](https://github.com/turbot/steampipe-mod-aws-compliance/pull/697))
  - `appstream_fleet_default_internet_access_disabled`
  - `appstream_fleet_idle_disconnect_timeout_600_seconds`
  - `appstream_fleet_max_user_duration_36000_seconds`
  - `appstream_fleet_session_disconnect_timeout_300_seconds`
  - `backup_report_plan_configured`
  - `directory_service_certificate_expires_90_days`
  - `directory_service_directory_snapshots_limit`
  - `directory_service_directory_sns_notifications_enabled`
  - `kms_cmk_unused`

- Updated the `lambda_function_use_latest_runtime` and `foundational_security_lambda_2` controls to use latest runtimes for each language. ([#696](https://github.com/turbot/steampipe-mod-aws-compliance/pull/696)) (Thanks to [@papaharry](https://github.com/papaharry) for the contribution!)

## v0.76 [2023-07-11]

_Enhancements_

- The `NIST SP 800-171 (Rev. 2)` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/NIST-800-171-r2-1.1.html). The following updates have been made to the benchmark: ([#684](https://github.com/turbot/steampipe-mod-aws-compliance/pull/684))
  - The following controls have been added to the benchmarks:
    - `elb_application_network_lb_use_ssl_certificate`
- The `PCI DSS v3.2.1` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/PCI.html). The following updates have been made to the benchmark: ([#690](https://github.com/turbot/steampipe-mod-aws-compliance/pull/690))
  - The following controls have been added to the benchmarks:
    - `rds_db_instance_iam_authentication_enabled`
  - The following controls are no longer included in the benchmarks:
    - `rds_db_cluster_iam_authentication_enabled`

## v0.75 [2023-07-07]

_Bug fixes_

- Fixed the formatting in CIS v2.0.0 benchmark documents which would cause several control pages to not render correctly on the hub. ([#687](https://github.com/turbot/steampipe-mod-aws-compliance/pull/687))

## v0.74 [2023-07-06]

_What's new?_

- Added CIS v2.0.0 benchmark (`steampipe check benchmark.cis_v200`). ([#683](https://github.com/turbot/steampipe-mod-aws-compliance/pull/683))

_Enhancements_

- Added the following controls to `Other Compliance Checks` benchmark: ([#678](https://github.com/turbot/steampipe-mod-aws-compliance/pull/678))
  - `autoscaling_ec2_launch_configuration_no_sensitive_data`
  - `eks_cluster_endpoint_public_access_restircted`
  - `guardduty_centrally_configured`
  - `iam_policy_custom_no_permissive_role_assumption`
  - `iam_role_cross_account_read_only_access_policy`
  - `iam_security_audit_role`
  - `lambda_function_restrict_public_url`
  - `lambda_function_variables_no_sensitive_data`
  - `rds_db_instance_connections_encryption_enabled`
  - `vpc_in_more_than_one_region`
  - `vpc_subnet_multi_az_enabled`
  - `vpc_subnet_public_and_private`
  - `workspaces_workspace_volume_encryption_enabled`

## v0.73 [2023-06-29]

_Enhancements_

- Added the following controls to `Other Compliance Checks` benchmark: ([#675](https://github.com/turbot/steampipe-mod-aws-compliance/pull/675))
  - `cloudtrail_trail_bucket_mfa_enabled`
  - `efs_file_system_restrict_public_access`
  - `glacier_vault_restrict_public_access`
  - `iam_custom_policy_unattached_no_star_star`
  - `iam_policy_no_full_access_to_cloudtrail`
  - `iam_policy_no_full_access_to_kms`
  - `networkfirewall_firewall_in_vpc`
  - `opensearch_domain_cognito_authentication_enabled_for_kibana`
  - `opensearch_domain_internal_user_database_disabled`
  - `opensearch_domain_updated_with_latest_service_software_version`

## v0.72 [2023-06-23]

_Bug fixes_

- Fixed the `iam_role_unused_60` query to use the correct resource and common dimensions. ([#672](https://github.com/turbot/steampipe-mod-aws-compliance/pull/672))

## v0.71 [2023-06-21]

_Breaking changes_

- The `Foundational Security Best Practices v1.0.0` benchmark has been updated to better align with the matching [AWS Security Hub](https://docs.aws.amazon.com/securityhub/latest/userguide/doc-history.html). The following updates have been made: ([#669](https://github.com/turbot/steampipe-mod-aws-compliance/pull/669))
  - The following controls are no longer included in the benchmarks:
    - `foundational_security_ec2_27`
    - `foundational_security_lambda_4`

## v0.70 [2023-06-16]

_Enhancements_

- Added the following control to `Other Compliance Checks` benchmark: ([#663](https://github.com/turbot/steampipe-mod-aws-compliance/pull/663))
  - `iam_role_unused_60`

_Bug fixes_

- Fixed the filter pattern in `log_metric_filter_organization` query to correctly match the log event. ([#664](https://github.com/turbot/steampipe-mod-aws-compliance/pull/664))

## v0.69 [2023-06-15]

_Enhancements_

- Added the following controls to `Other Compliance Checks` benchmark: ([#641](https://github.com/turbot/steampipe-mod-aws-compliance/pull/641)) ([#645](https://github.com/turbot/steampipe-mod-aws-compliance/pull/645))
  - `api_gatewayv2_route_authorizer_configured`
  - `apigateway_rest_api_endpoint_restrict_public_access`
  - `backup_plan_region_configured`
  - `backup_vault_region_configured`
  - `cloudfront_distribution_field_level_encryption_enabled`
  - `cloudtrail_trail_insight_selectors_and_logging_enabled`
  - `docdb_cluster_instance_logging_enabled`
  - `drs_job_enabled`
  - `ebs_snapshot_encryption_enabled`
  - `ec2_ami_restrict_public_access`
  - `guardduty_no_high_severity_findings`
  - `iam_access_analyzer_enabled_without_findings`
  - `vpc_security_group_allows_ingress_to_cassandra_ports`
  - `vpc_security_group_allows_ingress_to_memcached_port`
  - `vpc_security_group_allows_ingress_to_mongodb_ports`
  - `vpc_security_group_allows_ingress_to_oracle_ports`
- The `HIPAA Security Rule 2003` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/HIPAA.html). The following updates have been made to the benchmark: ([#654](https://github.com/turbot/steampipe-mod-aws-compliance/pull/654))
  - The following controls are no longer included in the benchmarks:
    - `kms_key_decryption_restricted_in_iam_customer_managed_policy`
    - `kms_key_decryption_restricted_in_iam_inline_policy`

_Bug fixes_

- Fixed the `rds_db_instance_logging_enabled` query to filter out `docdb` instances. ([#660](https://github.com/turbot/steampipe-mod-aws-compliance/pull/660))

## v0.68 [2023-06-07]

_Bug fixes_

- Fixed the `wafv2_web_acl_rule_attached` query to correctly evaluate the number of rule(s) attached to multiple web ACLs instead of returning an error. ([#655](https://github.com/turbot/steampipe-mod-aws-compliance/pull/655))
- Fixed the `iam_policy_all_attached_no_star_star` query to skip AWS managed policies. ([#643](https://github.com/turbot/steampipe-mod-aws-compliance/pull/643))
- Fixed the `foundational_security_cloudtrail_1` control to refer the correct document. ([#650](https://github.com/turbot/steampipe-mod-aws-compliance/pull/650)) (Thanks [@ajoga](https://github.com/ajoga) for the contribution!!)

## v0.67 [2023-06-01]

_Breaking changes_

- The `NIST SP 800-171 (Rev. 2)` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/NIST-800-171-r2-1.1.html). The following updates have been made to the benchmark: ([#636](https://github.com/turbot/steampipe-mod-aws-compliance/pull/636))
  - The following benchmarks have been added:
    - `nist_800_171_rev_2_2`
    -  Added the following sub-benchmarks to `nist_800_171_rev_2_3_4` benchmark:
       - `nist_800_171_rev_2_3_4_3`
       - `nist_800_171_rev_2_3_4_4`
       - `nist_800_171_rev_2_3_4_5`
    - Added the following sub-benchmarks to `nist_800_171_rev_2_3_5` benchmark:
      - `nist_800_171_rev_2_3_5_1`
      - `nist_800_171_rev_2_3_5_4`
      - `nist_800_171_rev_2_3_5_9`
    - Added the following sub-benchmark to `nist_800_171_rev_2_3` benchmark:
      - `nist_800_171_rev_2_3_8`
    - Added the following sub-benchmarks to `nist_800_171_rev_2_3_12` benchmark:
      - `nist_800_171_rev_2_3_12_1`
      - `nist_800_171_rev_2_3_12_3`
    - Added the following sub-benchmark to `nist_800_171_rev_2_3_13` benchmark:
      - `nist_800_171_rev_2_3_13_10`
  - Removed the following sub-benchmark from `nist_800_171_rev_2_3_5` benchmark:
      - `nist_800_171_rev_2_3_5_10`
  - 40 new unique controls have been added across the benchmarks
  - The following controls have been replaced in the benchmarks:
    - `iam_account_password_policy_reuse_24` replaced by `iam_account_password_policy_strong_min_reuse_24`
    - `s3_bucket_policy_restricts_cross_account_permission_changes` replaced by `s3_bucket_policy_restrict_public_access`
  - The following controls are no longer included in the benchmarks:
    - `dynamodb_table_encryption_enabled`
    - `ebs_volume_encryption_at_rest_enabled`
    - `elb_application_network_lb_use_ssl_certificate`
    - `iam_account_password_policy_min_length_14`
    - `iam_account_password_policy_one_lowercase_letter`
    - `iam_account_password_policy_one_number`
    - `iam_account_password_policy_one_symbol`
    - `iam_account_password_policy_one_uppercase_letter`
    - `iam_password_policy_expire_90`
    - `rds_db_cluster_deletion_protection_enabled`
    - `vpc_security_group_restricted_common_ports`

_Enhancements_

- The `HIPAA Security Rule 2003` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/HIPAA.html). The following updates have been made to the benchmark: ([#635](https://github.com/turbot/steampipe-mod-aws-compliance/pull/635))
  - The following controls have been added to the benchmarks:
    - `iam_policy_custom_no_blocked_kms_actions`
    - `iam_policy_inline_no_blocked_kms_actions`
  - The following controls have been replaced in the benchmarks:
    - `vpc_endpoint_service_acceptance_required_enabled` replaced by `vpc_configured_to_use_vpc_endpoints`
    - `vpc_security_group_restricted_common_ports` replaced by `vpc_security_group_restrict_ingress_common_ports_all`
    - `vpc_security_group_allows_ingress_authorized_ports` replaced by `vpc_igw_attached_to_authorized_vpc`
- The `HIPAA Final Omnibus Security Rule 2013` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/HIPAA-omnibus-rule.html). The following updates have been made to the benchmark: ([#632](https://github.com/turbot/steampipe-mod-aws-compliance/pull/632))
  - Added `ssm_document_prohibit_public_access` control to the benchmarks
  - The following controls are no longer included in the benchmarks:
    - `vpc_endpoint_service_acceptance_required_enabled`
- The `GxP 21 CFR Part 11` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/GxP.html). The following updates have been made to the benchmark: ([#638](https://github.com/turbot/steampipe-mod-aws-compliance/pull/638))
  - The following controls have been added to the benchmarks:
    - `ebs_volume_unused`
    - `ssm_document_prohibit_public_access`
  - The following controls have been replaced in the benchmarks:
    - `vpc_security_group_allows_ingress_authorized_ports` replaced by `vpc_security_group_restrict_ingress_tcp_udp_all`
    - `iam_policy_custom_no_assume_role` replaced by `iam_managed_policy_attached_to_role`
  - The following controls are no longer included in the benchmarks:
    - `ebs_attached_volume_delete_on_termination_enabled`

_Bug fixes_

- Fixed the typo in the query name to use `vpc_security_group_unused` instead of `vpc_security_group_unsued`. ([#640](https://github.com/turbot/steampipe-mod-aws-compliance/pull/640))

## v0.66 [2023-05-25]

_Enhancements_

- The `NIST Cybersecurity Framework (CSF) v1.1` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/NIST-Cybersecurity-Framework-v1-1.html). The following updates have been made to the benchmark: ([#631](https://github.com/turbot/steampipe-mod-aws-compliance/pull/631))
  - The following controls have been added to the benchmarks:
    - `cloudwatch_alarm_action_enabled_check`
    - `ssm_document_prohibit_public_access`
    - `vpc_configured_to_use_vpc_endpoints`

## v0.65 [2023-05-19]

_Enhancements_

- The `PCI DSS v3.2.1` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/PCI.html). The following updates have been made to the benchmark: ([#626](https://github.com/turbot/steampipe-mod-aws-compliance/pull/626))
  - The following controls have been added to the benchmarks:
    - `log_metric_filter_root_login`
    - `vpc_configured_to_use_vpc_endpoints`
    - `waf_regional_rule_group_rule_attached`
    - `waf_regional_web_acl_rule_attached`
  - The following controls have been replaced in the benchmarks:
    - `cloudwatch_alarm_action_enabled` replaced by `cloudwatch_alarm_action_enabled_check`
    - `efs_file_system_encrypted_with_cmk` replaced by `efs_file_system_encrypt_data_at_rest`
    - `s3_public_access_block_bucket_account` replaced by `s3_public_access_block_account`
  - The following controls are no longer included in the benchmark:
    - `elb_listener_use_secure_ssl_cipher`
    - `kms_key_decryption_restricted_in_iam_customer_managed_policy`
    - `kms_key_decryption_restricted_in_iam_inline_policy`
    - `vpc_endpoint_service_acceptance_required_enabled`
- The `S0C 2` benchmark has been updated to better align with the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/SOC2.html). The following updates have been made to the benchmark: ([#628](https://github.com/turbot/steampipe-mod-aws-compliance/pull/628))
  - The following controls have been added to the benchmarks:
    - `waf_web_acl_logging_enabled`
    - `cloudwatch_alarm_action_enabled_check`
  - The following controls have been replaced in the benchmarks:
    - `ebs_volume_encryption_at_rest_enabled` replaced by `ebs_attached_volume_encryption_enabled`
    - `s3_bucket_policy_restricts_cross_account_permission_changes` replaced by `s3_bucket_policy_restrict_public_access`
    - `sagemaker_notebook_instance_encrypted_with_kms_cmk` replaced by `sagemaker_notebook_instance_encryption_at_rest_enabled`
    - `iam_account_password_policy_min_length_14` replaced by `iam_account_password_policy_strong_min_reuse_24`

_Bug fixes_

- Fixed dashboard localhost URLs in README and index doc. ([#627](https://github.com/turbot/steampipe-mod-aws-compliance/pull/627))

## v0.64 [2023-05-05]

_What's new?_

- Added the following new controls to the AWS Foundational Security Best Practices benchmark: ([#614](https://github.com/turbot/steampipe-mod-aws-compliance/pull/614))
  - EC2.20
  - EKS.1
  - ElastiCache.1
  - ElastiCache.2
  - ElastiCache.3
  - ElastiCache.4
  - ElastiCache.5
  - ElastiCache.6
  - ElastiCache.7
  - ELB.1
  - ELB.2
  - ELB.9
  - Opensearch.1
  - Opensearch.2
  - Opensearch.3
  - Opensearch.4
  - Opensearch.5
  - Opensearch.6
  - Opensearch.7
  - Opensearch.8
  - RDS.11
  - Redshift.10
  - S3.13
  - SSM.4
  - WAF.1
  - WAF.2
  - WAF.3
  - WAF.4

## v0.63 [2023-04-20]

_Breaking changes_

- The `NIST Cybersecurity Framework (CSF) v1.1` benchmark has been updated to better align with the official [NIST document](https://www.nist.gov/cyberframework) and the matching [AWS Audit Manager NIST Cybersecurity Framework (CSF) v1.1](https://docs.aws.amazon.com/audit-manager/latest/userguide/NIST-Cybersecurity-Framework-v1-1.html) framework. The following updates have been made: ([#604](https://github.com/turbot/steampipe-mod-aws-compliance/pull/604))
  - 100+ new controls have been added
  - The following controls are no longer included in the benchmarks:
    - `ebs_attached_volume_delete_on_termination_enabled`
    - `s3_public_access_block_bucket_account`
    - `sns_topic_encrypted_at_rest`
    - `vpc_security_group_associated_to_eni`

_Bug fixes_

- Fixed the `lambda_function_in_vpc` and the `lambda_function_multiple_az_configured` queries to correctly check if a function is present in a VPC or not. ([#610](https://github.com/turbot/steampipe-mod-aws-compliance/pull/610))

## v0.62 [2023-04-13]

_Breaking changes_

- The HIPAA benchmark has been updated to better align with official [HIPAA document](https://www.hhs.gov/hipaa/index.html) and the matching [AWS Audit Manager Health Insurance Portability and Accountability Act (HIPAA) Final Omnibus Security Rule 2013](https://docs.aws.amazon.com/audit-manager/latest/userguide/HIPAA-omnibus-rule.html) and [AWS Audit Manager Health Insurance Portability and Accountability Act (HIPAA) Security Rule 2003](https://docs.aws.amazon.com/audit-manager/latest/userguide/HIPAA.html) frameworks. The following updates have been made to the benchmark: ([#605](https://github.com/turbot/steampipe-mod-aws-compliance/pull/605))
  - The `hipaa` benchmark has been removed and replaced by two new benchmarks - `hipaa_final_omnibus_security_rule_2013` (`steampipe check benchmark.hipaa_final_omnibus_security_rule_2013`) and `hipaa_security_rule_2003` (`steampipe check benchmark.hipaa_security_rule_2003`).
  - 30+ new unique controls have been added across the two new benchmarks
  - The following controls are no longer included in the benchmarks:
    - `ebs_volume_encryption_at_rest_enabled`
    - `iam_account_password_policy_min_length_14`
    - `iam_account_password_policy_one_lowercase_letter`
    - `iam_account_password_policy_one_number`
    - `iam_account_password_policy_one_symbol`
    - `iam_account_password_policy_one_uppercase_letter`
    - `iam_account_password_policy_reuse_24`
    - `iam_password_policy_expire_90`
    - `log_metric_filter_console_login_mfa`
    - `s3_public_access_block_bucket_account`
  - All documentation has been updated on the [Hub](https://hub.steampipe.io/mods/turbot/aws_compliance/controls) to better match official [HIPAA Final Omnibus Security Rule 2013](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.hipaa_final_omnibus_security_rule_2013) and [HIPAA Security Rule 2003](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.hipaa_security_rule_2003) documentations.

## v0.61 [2023-04-07]

_Breaking changes_

- The `GxP 21 CFR Part 11` and `GxP EU Annex 11` benchmarks have been updated to better align with [AWS Audit Manager GxP 21 CFR Part 11](https://docs.aws.amazon.com/audit-manager/latest/userguide/GxP.html) and [AWS Audit Manager GxP EU Annex 11](https://docs.aws.amazon.com/audit-manager/latest/userguide/GxP-EU-Annex-11.html) frameworks. The following updates have been made: ([#600](https://github.com/turbot/steampipe-mod-aws-compliance/pull/600))
  - New benchmarks added:
    - `gxp_21_cfr_part_11_11_200_a`
    - `gxp_eu_annex_11_project_phase_4`
    - `gxp_eu_annex_11_operational_phase_7`
    - `gxp_eu_annex_11_operational_phase_8`
    - `gxp_eu_annex_11_operational_phase_12`
    - `gxp_eu_annex_11_operational_phase_13`
  - 45+ unique controls have been added across both the benchmarks
  - The following controls are no longer included in the benchmark:
    - `iam_account_password_policy_strong`
    - `vpc_security_group_restrict_ingress_tcp_udp_all`

## v0.60 [2023-03-31]

_Breaking changes_

- The PCI DSS v3.2.1 benchmark has been updated to better align with official [PCI DSS v3.2.1 document](https://www.pcisecuritystandards.org/document_library/?category=pcidss&document=pci_dss) and the matching [AWS Audit Manager framework](https://docs.aws.amazon.com/audit-manager/latest/userguide/PCI.html). The following updates have been made to the benchmark: ([#570](https://github.com/turbot/steampipe-mod-aws-compliance/pull/570))
  - The `pci_v321` benchmark has been removed and replaced by the `pci_dss_v321` benchmark (`steampipe check benchmark.pci_dss_v321`)
  - The benchmark is now organized by **Requirements** instead of AWS services and all children benchmarks now start with `pci_dss_v321_` instead of `pci_v321`, e.g., `steampipe check benchmark.pci_dss_v321_requirement_2`
  - 100+ new controls have been added
  - The following controls are no longer included in the benchmark:
    - `control.iam_root_user_virtual_mfa`
    - `kms_cmk_rotation_enabled`
    - `opensearch_domain_in_vpc`
    - `vpc_security_group_associated`
  - All documentation has been updated on the [Hub](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.pci_dss_v321) to better match official PCI documentation.

_Dependencies_

- AWS plugin `v0.97.0` or higher is now required. ([#570](https://github.com/turbot/steampipe-mod-aws-compliance/pull/570))

## v0.59 [2023-03-24]

_Breaking changes_

- Fixed the names of the following benchmarks to align with the AWS Audit Manager framework: ([#581](https://github.com/turbot/steampipe-mod-aws-compliance/pull/581))
  - `soc_2_cc_a_1` to `soc_2_a_1`
  - `soc_2_cc_a_1_1` to `soc_2_a_1_1`
  - `soc_2_cc_a_1_2` to `soc_2_a_1_2`
  - `soc_2_cc_a_1_3` to `soc_2_a_1_3`
  - `soc_2_cc_c_1` to `soc_2_c_1`
  - `soc_2_cc_c_1_1` to `soc_2_c_1_1`
  - `soc_2_cc_c_1_2` to `soc_2_c_1_2`
  - `soc_2_cc_c_1_3` to `soc_2_c_1_3`

_What's new?_

- New benchmark added: ([#581](https://github.com/turbot/steampipe-mod-aws-compliance/pull/581))
  - `soc_2_c_1` (`steampipe check benchmark.soc_2_c_1`)
- More than 200 controls were added to the following `SOC 2` sub-benchmarks: ([#581](https://github.com/turbot/steampipe-mod-aws-compliance/pull/581))
  - `a_1_2`
  - `soc2_c_1_1`
  - `soc2_c_1_2`
  - `soc2_cc_1_3`
  - `soc2_cc_2_1`
  - `soc2_cc_3_1`
  - `soc2_cc_3_2`
  - `soc2_cc_3_4`
  - `soc2_cc_4_2`
  - `soc2_cc_6_1`
  - `soc2_cc_6_2`
  - `soc2_cc_6_3`
  - `soc2_cc_6_6`
  - `soc2_cc_6_7`
  - `soc2_cc_7_3`
  - `soc2_cc_7_4`
  - `soc2_cc_8_1`

## v0.58 [2023-03-22]

_What's new?_

- New AWS Foundational Security Best Practices control added: ([#586](https://github.com/turbot/steampipe-mod-aws-compliance/pull/586))
  - EC2.25 (`steampipe check control.foundational_security_ec2_25`)
- Added `tags` as dimensions to group and filter findings. (see [var.tag_dimensions](https://hub.steampipe.io/mods/turbot/aws_compliance/variables)) ([#574](https://github.com/turbot/steampipe-mod-aws-compliance/pull/574))
- Added `connection_name` in the common dimensions to group and filter findings. (see [var.common_dimensions](https://hub.steampipe.io/mods/turbot/aws_compliance/variables)) ([#574](https://github.com/turbot/steampipe-mod-aws-compliance/pull/574))

_Bug fixes_

- Fixed the sub-benchmark titles of `CIS Controls v8 IG1` benchmark to maintain consistency across other CIS benchmark titles. ([#589](https://github.com/turbot/steampipe-mod-aws-compliance/pull/589))

## v0.57 [2023-03-10]

_Dependencies_

- AWS plugin `v0.95.0` or higher is now required. ([#579](https://github.com/turbot/steampipe-mod-aws-compliance/pull/579))

_What's new?_

- Added CIS Controls v8 IG1 benchmark (`steampipe check benchmark.cis_controls_v8_ig1`). ([#568](https://github.com/turbot/steampipe-mod-aws-compliance/pull/568))
- Add 30 new controls to Other Compliance Checks benchmark. ([#563](https://github.com/turbot/steampipe-mod-aws-compliance/pull/563))

_Bug fixes_

- Fixed the `cloudtrail_multi_region_trail_enabled` query to correctly evaluate organizational trails. ([#552](https://github.com/turbot/steampipe-mod-aws-compliance/pull/552))
- Fixed `s3_bucket_restrict_*` queries to correctly check if buckets prohibit public read access or not. ([#548](https://github.com/turbot/steampipe-mod-aws-compliance/pull/548))
- Fixed `s3_bucket_acls_should_prohibit_user_access` query to correctly evaluate a bucket to be in `ok` state if it does not have ACLs for user access. ([#549](https://github.com/turbot/steampipe-mod-aws-compliance/pull/549))

## v0.56 [2023-02-03]

_Bug fixes_

- Fixed the `guardduty_enabled` query to no longer report false positive results on accounts which are members of an AWS organization where GuardDuty is managed by another account via Delegated Admin. ([#551](https://github.com/turbot/steampipe-mod-aws-compliance/pull/551))
- Fixed the `ec2_instance_ssm_managed` query to return `info` instead of an `error` for instances that are in stopped state and are not managed by SSM. ([#550](https://github.com/turbot/steampipe-mod-aws-compliance/pull/550))

## v0.55 [2023-01-20]

_Dependencies_

- AWS plugin `v0.92.0` or higher is now required. ([#545](https://github.com/turbot/steampipe-mod-aws-compliance/pull/545))

_What's new?_

- Added CIS v1.2.0 benchmark (`steampipe check benchmark.cis_v120`). ([#535](https://github.com/turbot/steampipe-mod-aws-compliance/pull/535))
- New AWS Foundational Security Best Practices control added: ([#542](https://github.com/turbot/steampipe-mod-aws-compliance/pull/542))
  - Account.1
  - APIGateway.8
  - APIGateway.9
  - CloudFront.12
  - CodeBuild.3
  - SageMaker.2
  - SageMaker.3
  - WAF.10

## v0.54 [2022-11-22]

_What's new?_

- New AWS Foundational Security Best Practices control added: ([#529](https://github.com/turbot/steampipe-mod-aws-compliance/pull/529))
  - AutoScaling.9 (`steampipe check control.foundational_security_autoscaling_9`)

## v0.53 [2022-11-17]

_Bug fixes_

- Fixed the `acm_certificate_expires_30_days` query to correctly alarm the ACM certificates which are set to expire within 30 days. ([#552](https://github.com/turbot/steampipe-mod-aws-compliance/pull/525))
- Fixed typos in several compliance control descriptions to use `compliant` instead of `complaint`. ([#522](https://github.com/turbot/steampipe-mod-aws-compliance/pull/522)) (Thanks to [@akumar-99](https://github.com/akumar-99) for the contribution!)

## v0.52 [2022-11-04]

_Enhancements_

- Updated `iam_user_in_group` and `vpc_default_security_group_restricts_all_traffic` queries to correctly handle empty column data. ([#520](https://github.com/turbot/steampipe-mod-aws-compliance/pull/520))

_Dependencies_

- AWS plugin `v0.81.0` or higher is now required.

## v0.51 [2022-11-03]

_Bug fixes_

- Fixed `apigateway_rest_api_authorizers_configured`, `apigateway_stage_logging_enabled`, `cloudformation_stack_notifications_enabled`, `route53_zone_query_logging_enabled`, `secretsmanager_secret_encrypted_with_kms_cmk` and `vpc_igw_attached_to_authorized_vpc` queries to correctly handle columns when empty in their respective tables. ([#517](https://github.com/turbot/steampipe-mod-aws-compliance/pull/517))

## v0.50 [2022-10-21]

_Enhancements_

- Updated `cloudwatch_alarm_action_enabled` query to use updated column data in `aws_cloudwatch_alarm` table. ([#511](https://github.com/turbot/steampipe-mod-aws-compliance/pull/511))

_Dependencies_

- AWS plugin `v0.80.0` or higher is now required.

## v0.49 [2022-10-20]

_Bug fixes_

- Fixed the `ecr_repository_prohibit_public_access` query to correctly check if the Cross-Account ECR repositories are public or not. ([#513](https://github.com/turbot/steampipe-mod-aws-compliance/pull/513))
- Fixed the `ebs_attached_volume_encryption_enabled` query to validate all EBS volumes instead of ignoring the unattached volumes. ([#504](https://github.com/turbot/steampipe-mod-aws-compliance/pull/504))
- Fixed the `secretsmanager_secret_encrypted_with_kms_cmk` query to correctly alarm if the secret is not encrypted with CMK.
- Fixed typos in various CIS docs and NIST 800-53 benchmark title. ([#508](https://github.com/turbot/steampipe-mod-aws-compliance/pull/508)) (Thanks [@akumar-99](https://github.com/akumar-99) for the contribution!)

## v0.48 [2022-09-23]

_What's new?_

- Added queries with automated checks to the following CIS controls: ([#502](https://github.com/turbot/steampipe-mod-aws-compliance/pull/502))
  - `cis_v130_1_2`
  - `cis_v140_1_2`
  - `cis_v140_2_1_4`
  - `cis_v150_1_2`
  - `cis_v150_2_1_4`

_Dependencies_

- AWS plugin `v0.78.0` or higher is now required.

## v0.47 [2022-09-19]

_What's new?_

- Added the following new controls to the AWS Foundational Security Best Practices benchmark: ([#489](https://github.com/turbot/steampipe-mod-aws-compliance/pull/489))
  - S3.12

_Bug fixes_

- Fixed `guardduty_enabled` and `securityhub_enabled` queries incorrectly showing the disabled service as enabled in regions if another connections' account has it enabled in the same region.

## v0.46 [2022-08-30]

_What's new?_

- Added CIS v1.5.0 benchmark (`steampipe check benchmark.cis_v150`). ([#496](https://github.com/turbot/steampipe-mod-aws-compliance/pull/496))
- Added the following new controls to the AWS Foundational Security Best Practices benchmark: ([#488](https://github.com/turbot/steampipe-mod-aws-compliance/pull/488))
  - AutoScaling.6

_Enhancements_

- Updated `foundational_security_lambda_2` control to use latest runtimes for each language.  ([#497](https://github.com/turbot/steampipe-mod-aws-compliance/pull/497))

_Bug fixes_

- Fixed typo in `nist_800_53_rev_5_si_2_2` control title. ([#490](https://github.com/turbot/steampipe-mod-aws-compliance/pull/490)) (Thanks to [@akumar-99](https://github.com/akumar-99) for the contribution!)

## v0.45 [2022-08-17]

_Breaking changes_

- Removed the `cloudtrail_enabled_all_regions` control since it was no longer being used by any benchmark. ([#485](https://github.com/turbot/steampipe-mod-aws-compliance/pull/485))

## v0.44 [2022-08-12]

_Bug fixes_

- Fixed the `cis_v130_3_1` and `cis_v140_3_1` controls to correctly use the `cloudtrail_multi_region_read_write_enabled` query instead of `cloudtrail_enabled_all_regions` query. ([#479](https://github.com/turbot/steampipe-mod-aws-compliance/pull/479))
- Fixed the `article_25` and `article_30` benchmarks to include the `cloudtrail_multi_region_trail_enabled` control instead of the `cloudtrail_enabled_all_regions` control. ([#479](https://github.com/turbot/steampipe-mod-aws-compliance/pull/479))
- Fixed the `pci_v321_cloudtrail_2` control to correctly use the `cloudtrail_trail_enabled` query instead of the`cloudtrail_enabled_all_regions` query. ([#479](https://github.com/turbot/steampipe-mod-aws-compliance/pull/479))

## v0.43 [2022-07-27]

_What's new?_

- Added GxP EU Annex 11 benchmark (`steampipe check benchmark.gxp_eu_annex_11`). ([#452](https://github.com/turbot/steampipe-mod-aws-compliance/pull/452))

## v0.42 [2022-07-26]

_Bug fixes_

- Fixed the `foundational_security_ec2` benchmark to correctly include the `foundational_security_ec2_27` control. ([#474](https://github.com/turbot/steampipe-mod-aws-compliance/pull/474))

## v0.41 [2022-07-21]

_What's new?_

- Added the following new controls to the AWS Foundational Security Best Practices benchmark: ([#468](https://github.com/turbot/steampipe-mod-aws-compliance/pull/468))([#457](https://github.com/turbot/steampipe-mod-aws-compliance/pull/457))
  - AutoScaling.3
  - AutoScaling.4
  - CloudFormation.1
  - CloudFront.10
  - EC2.23
  - EC2.24
  - EC2.27
  - ECR.1
  - ECR.2
  - ECS.3
  - ECS.4
  - ECS.5
  - ECS.8
  - ECS.10
  - ECS.12
  - EFS.3
  - EFS.4
  - EKS.2
  - ELB.12
  - ELB.13
  - ELB.14
  - Kinesis.1
  - NetworkFirewall.3
  - NetworkFirewall.4
  - NetworkFirewall.5
  - OpenSearch.7
  - Redshift.9
  - S3.13
  - SNS.2
  - WAF.6
  - WAF.7
  - WAF.8

_Enhancements_

- Updated the `kms_cmk_rotation_enabled` query to skip KMS keys which are either in `PendingDeletion` or `Disabled` state since we cannot set rotation for such keys. ([#466](https://github.com/turbot/steampipe-mod-aws-compliance/pull/466)) (Thanks to [@yorinasub17](https://github.com/yorinasub17) for the contribution!)

_Breaking changes_

- Renamed the control and the query `dynamodb_table_encrypted_with_kms_cmk` to `dynamodb_table_encrypted_with_kms` to maintain consistency with AWS documentation. ([#467](https://github.com/turbot/steampipe-mod-aws-compliance/pull/467)) (Thanks to [@pdecat](https://github.com/pdecat) for the contribution!)

_Dependencies_

- AWS plugin `v0.71.0` or higher is now required. ([#470](https://github.com/turbot/steampipe-mod-aws-compliance/pull/470))

## v0.40 [2022-07-15]

_What's new?_

- Added CISA Cyber Essentials benchmark (`steampipe check benchmark.cisa_cyber_essentials`). ([#454](https://github.com/turbot/steampipe-mod-aws-compliance/pull/454))

_Bug fixes_

- Added the missing `resource` column in the `vpc_flow_logs_enabled` query so that all the controls using this query will get executed correctly instead of returning an error. ([#463](https://github.com/turbot/steampipe-mod-aws-compliance/pull/463)) (Thanks to [@yorinasub17](https://github.com/yorinasub17) for the contribution!)

## v0.39 [2022-07-14]

_What's new?_

- Added NIST 800-171 Revision 2 benchmark (`steampipe check benchmark.nist_800_171_rev_2`). ([#453](https://github.com/turbot/steampipe-mod-aws-compliance/pull/453))

_Enhancements_

- Updated `guardduty_enabled`, `iam_access_analyzer_enabled` and `securityhub_enabled` queries to skip the regions which have been disabled. ([#451](https://github.com/turbot/steampipe-mod-aws-compliance/pull/451))

## v0.38 [2022-07-07]

_Dependencies_

- AWS plugin `v0.68.0` or higher is now required ([#446](https://github.com/turbot/steampipe-mod-aws-compliance/pull/446))

_What's new?_

- Added GxP 21 CFR Part 11 benchmark (`steampipe check benchmark.gxp_21_cfr_part_11`). ([#436](https://github.com/turbot/steampipe-mod-aws-compliance/pull/436))
- Added Other Compliance Checks benchmark (`steampipe check benchmark.other`). ([#431](https://github.com/turbot/steampipe-mod-aws-compliance/pull/431))

_Enhancements_

- Updated the `config_enabled_all_regions` query to skip the regions which have been disabled. ([#437](https://github.com/turbot/steampipe-mod-aws-compliance/pull/437)) (Thanks to [@yorinasub17](https://github.com/yorinasub17) for the contribution!)

_Bug fixes_

- Fixed the `vpc_flow_logs_enabled` query to skip VPCs which are shared with the owner account, since flow logs cannot be enabled for shared VPCs. ([#444](https://github.com/turbot/steampipe-mod-aws-compliance/pull/444))

## v0.37 [2022-06-29]

_What's new?_

- Added Federal Financial Institutions Examination Council (FFIEC) benchmark (`steampipe check benchmark.ffiec`). ([#420](https://github.com/turbot/steampipe-mod-aws-compliance/pull/420))

## v0.36 [2022-06-27]

_Bug fixes_

- Fixed the `backup_plan_min_retention_35_days` query to check if the backup plan retention period is more than `35` days instead of `37` days. ([#424](https://github.com/turbot/steampipe-mod-aws-compliance/pull/424))
- Fixed the `lambda_function_restrict_public_access` query to correctly evaluate if a lambda function is restricting public access or not. ([#422](https://github.com/turbot/steampipe-mod-aws-compliance/pull/422))

## v0.35 [2022-06-14]

_Enhancements_

- Updated the `NIST 800-53` link in the docs/index.md file to reference the latest `NIST 800-53 Revision 5` document. ([#407](https://github.com/turbot/steampipe-mod-aws-compliance/pull/407))

_Bug fixes_

- Fixed the typo in the query name to use `ebs_volume_unused` instead of `ebs_volume_unsued`. ([#412](https://github.com/turbot/steampipe-mod-aws-compliance/pull/412))
- Fixed the typo `Prinipal` in `lambda_function_restrict_public_access` query. ([#413](https://github.com/turbot/steampipe-mod-aws-compliance/pull/413))

## v0.34 [2022-06-02]

_What's new?_

- Added NIST 800-53 Revision 5 benchmark (`steampipe check benchmark.nist_800_53_rev_5`). ([#399](https://github.com/turbot/steampipe-mod-aws-compliance/pull/399))

_Bug fixes_

- Fixed the `rds_db_instance_deletion_protection_enabled` query to skip Amazon RDS Aurora, DocumentDB and Neptune DB instances, since deletion protection can only be enabled at the cluster level for such instances. ([#401](https://github.com/turbot/steampipe-mod-aws-compliance/pull/401))
- Fixed the `foundational_security_s3_9` control to correctly reference `s3_bucket_logging_enabled` query instead of `s3_bucket_public_access_blocked` query. ([#403](https://github.com/turbot/steampipe-mod-aws-compliance/pull/403))

## v0.33 [2022-05-18]

_What's new?_

- Added FedRAMP Low Revision 4 benchmark (`steampipe check benchmark.fedramp_low_rev_4`).
- Added FedRAMP Moderate Revision 4 benchmark (`steampipe check benchmark.fedramp_moderate_rev_4`).

_Bug fixes_

- Fixed `lambda_function_multiple_az_configured` query to correctly check if Lambda functions have more than one availability zone. ([#392](https://github.com/turbot/steampipe-mod-aws-compliance/pull/392))
- Fixed `lambda_function_use_latest_runtime` query to correctly return `skip` instead of `alarm` if the deployment package type is `zip`. ([#392](https://github.com/turbot/steampipe-mod-aws-compliance/pull/392))

## v0.32 [2022-05-11]

_Dependencies_

- AWS plugin `v0.59.0` or higher is now required. ([#390](https://github.com/turbot/steampipe-mod-aws-compliance/pull/390))

_What's new?_

- New PCI v3.2.1 benchmark added: ([#385](https://github.com/turbot/steampipe-mod-aws-compliance/pull/385))
  - OpenSearch (`steampipe check benchmark.pci_v321_opensearch`)
- New PCI v3.2.1 controls added: ([#385](https://github.com/turbot/steampipe-mod-aws-compliance/pull/385))
  - OpenSearch.1 (`steampipe check control.pci_v321_opensearch_1`)
  - OpenSearch.2 (`steampipe check control.pci_v321_opensearch_2`)

## v0.31 [2022-05-09]

_Enhancements_

- Updated docs/index.md and README with new dashboard screenshots and latest format. ([#379](https://github.com/turbot/steampipe-mod-aws-compliance/pull/379))

_Bug fixes_

- Fixed incorrect doc link for `pci_v321_s3_5` control. ([#381](https://github.com/turbot/steampipe-mod-aws-compliance/pull/381))

## v0.30 [2022-05-03]

_Bug fixes_

- Fixed `resource` column in `guardduty_enabled` query to be the AWS region ARN instead of the GuardDuty detector ARN.
- Fixed `resource` column in `securityhub_enabled` query to be the AWS region ARN instead of the Security Hub hub ARN.
- Renamed `soc2` directory and filenames to use `soc_2` (no impact on benchmarks or controls).

## v0.29 [2022-04-27]

_Enhancements_

- Added `category`, `service`, and `type` tags to benchmarks and controls. ([#375](https://github.com/turbot/steampipe-mod-aws-compliance/pull/375))
- Improved reason in `iam_root_user_hardware_mfa_enabled` query when a virtual MFA device is enabled.

_Bug fixes_

- Fixed `resource` in `iam_access_analyzer_enabled` query to be the region ARN.

## v0.28 [2022-04-22]

_Enhancements_

- Renamed several IAM policy and account password policy query names to be more consistent with other query names. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))

_Bug fixes_

- The `cis_v130_1_16` and `cis_v140_1_16` controls now only show results for attached IAM policies. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))
- The `iam_all_policy_no_service_wild_card` control now only checks customer managed IAM policies for full service access statements. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))
- Fixed `iam_all_policy_no_service_wild_card` and `foundational_security_iam_21` controls not alarming if any policy statements grant `*:*`, as these statements also grant full access to at least 1 AWS service. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))
- Removed `iam_all_policy_no_service_wild_card.sql` and `iam_policy_in_use.sql` queries as these were unused by any controls. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))

## v0.27 [2022-04-21]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - CloudFront.9
  - ECR.3
  - ELB.10
  - S3.11

_Bug fixes_

- Fixed the `guardduty_enabled` query to only check if GuardDuty is enabled and no longer check if S3 logging is enabled. ([#360](https://github.com/turbot/steampipe-mod-aws-compliance/pull/360))

## v0.26 [2022-04-18]

_Bug fixes_

- The `foundational_security_networkfirewall` benchmark is now a child of the `foundational_security` benchmark.

## v0.25 [2021-04-01]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - AutoScaling.2
  - AutoScaling.5
  - CloudFront.7
  - CloudFront.8
  - CodeBuild.4
  - CodeBuild.5
  - EC2.21
  - EC2.22
  - Lambda.5
  - NetworkFirewall.5
  - RDS.24
  - RDS.25
  - Redshift.8
  - S3.10
  - S3.9

## v0.24 [2022-03-30]

_Bug fixes_

- Fixed the `dynamodb_table_auto_scaling_enabled` query to correctly check if the tables have on-demand capacity mode enabled or not ([#350](https://github.com/turbot/steampipe-mod-aws-compliance/pull/350))

## v0.23 [2022-02-02]

_Enhancements_

- Updated the following queries to use `cidr_ipv4` column instead of the deprecated `cidr_ip` column ([#342](https://github.com/turbot/steampipe-mod-aws-compliance/pull/342))
  - vpc_security_group_allows_ingress_authorized_ports
  - vpc_security_group_remote_administration
  - vpc_security_group_restrict_ingress_common_ports_all
  - vpc_security_group_restrict_ingress_ssh_all
  - vpc_security_group_restrict_ingress_tcp_udp_all
  - vpc_security_group_restricted_common_ports

## v0.22 [2021-12-08]

_What's new?_

- RBI Cyber Security Framework benchmark (`steampipe check benchmark.rbi_cyber_security`) now includes 17 new controls and 7 new queries ([331](https://github.com/turbot/steampipe-mod-aws-compliance/pull/331))

_Bug fixes_

- Fixed the `config_enabled_all_regions` query to correctly evaluate if AWS Config is enabled in the account for the local Region and is recording all resources ([325](https://github.com/turbot/steampipe-mod-aws-compliance/pull/325))

## v0.21 [2021-11-24]

_What's new?_

- New NIST CSF benchmarks added:
  - DE.CM-2
  - DE.CM-5
  - ID.AM-1
  - ID.AM-5
  - ID.RA-5
  - ID.SC-4
  - PR.DS-7
  - PR.DS-8
  - PR.IP-2
  - PR.IP-8
  - PR.IP-9
  - PR.IP-12
  - RC.RP-1
  - RS.MI-3
  - RS.RP-1

## v0.20 [2021-11-18]

_Bug fixes_

- Fixed the `dynamodb_table_auto_scaling_enabled` query to correctly evaluate if auto scaling is enabled for a DynamoDB table instead of throwing a validation error ([319](https://github.com/turbot/steampipe-mod-aws-compliance/pull/319))

## v0.19 [2021-11-17]

_What's new?_

- Added: AWS Audit Manager Control Tower Guardrails benchmark (`steampipe check aws_compliance.benchmark.audit_manager_control_tower`)

_Bug fixes_

- Fixed the `backup_plan_min_retention_35_days` query to correctly evaluate backup plan rules where the lifecycle is set to `Never Expire` ([314](https://github.com/turbot/steampipe-mod-aws-compliance/pull/314))

## v0.18 [2021-11-10]

_What's new?_

- Additional benchmarks (`hipaa_164_308` and `hipaa_164.312`) have been added to the `hipaa` benchmark to improve its structure and readability
- New HIPAA benchmarks added:
  - 164.308(a)(1)(ii)(A) Risk analysis
  - 164.308(a)(4)(ii)(A) Isolating health care clearinghouse functions
  - 164.308(a)(5)(ii)(B) Protection from malicious software
  - 164.308(a)(5)(ii)(C) Log-in monitoring
  - 164.308(a)(5)(ii)(D) Password management
  - 164.308(a)(7)(ii)(B) Disaster recovery plan
  - 164.308(a)(7)(ii)(C) Emergency mode operation plan
  - 164.308(a)(8) Evaluation

## v0.17 [2021-10-27]

_What's new?_

- Added: System and Organization Controls (SOC 2) benchmark (`steampipe check aws_compliance.benchmark.soc_2`)

## v0.16 [2021-10-12]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - ES.4
  - ES.5

_Bug fixes_

- Fixed the metric filter pattern in the `log_metric_filter_unauthorized_api` query as per the CIS documentation ([#294](https://github.com/turbot/steampipe-mod-aws-compliance/pull/294))
- Fixed the `rds_db_instance_logging_enabled` query to correctly evaluate if logging is enabled for `SQL Server Express Edition` DB engine type ([296](https://github.com/turbot/steampipe-mod-aws-compliance/pull/296))

## v0.15 [2021-09-27]

_Bug fixes_

- Fixed the metric filter pattern in the `log_metric_filter_organization` query as per the CIS documentation ([#271](https://github.com/turbot/steampipe-mod-aws-compliance/pull/289))
- `cis_v140_1_16` control now refers to `iam_all_policy_no_star_star` query which evaluates all the attached IAM policies(both AWS and customer managed) instead of only IAM customer managed policies ([#281](https://github.com/turbot/steampipe-mod-aws-compliance/pull/281))
- `foundational_security_iam_1` control now refers to `iam_custom_policy_no_star_star` query which only evaluates IAM customer managed policies instead of evaluating both customer and AWS managed IAM policies ([#281](https://github.com/turbot/steampipe-mod-aws-compliance/pull/281))
- `foundational_security_iam_21` control now refers to `iam_custom_policy_no_service_wild_card` query which correctly checks if there are any IAM customer managed policies that allow wildcard access for services ([#281](https://github.com/turbot/steampipe-mod-aws-compliance/pull/281))

## v0.14 [2021-09-23]

_What's new?_

- Added: AWS General Data Protection Regulation(GDPR) benchmarks and controls (`steampipe check benchmark.gdpr`)

_Enhancements_

- `vpc_security_group_associated` control name has been renamed to `vpc_security_group_associated_to_eni` which now refers `vpc_security_group_associated_to_eni` query

_Bug fixes_

- `vpc_security_group_associated` query will no longer return duplicate security groups ([#283](https://github.com/turbot/steampipe-mod-aws-compliance/pull/283))
- Fixed the missing filter patterns in `log_metric_filter_root_login` and `log_metric_filter_unauthorized_api` queries ([#285](https://github.com/turbot/steampipe-mod-aws-compliance/pull/285)) ([#278](https://github.com/turbot/steampipe-mod-aws-compliance/pull/278))
- `cis_v130_1_12` and `cis_v140_1_12` controls will now render `<root_account>` user status as `info` ([#286](https://github.com/turbot/steampipe-mod-aws-compliance/pull/286))

## v0.13 [2021-09-09]

_Bug fixes_

- `foundational_security_elasticbeanstalk_1` control will now correctly reference the `elastic_beanstalk_enhanced_health_reporting_enabled` query instead of the `apigateway_stage_logging_enabled` query

## v0.12 [2021-08-23]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - APIGateway.5
  - EC2.15
  - EC2.19
  - ElasticBeanstalk.1
  - ELB.7
  - Lambda.4
  - RDS.18
  - RDS.19
  - RDS.20
  - RDS.21
  - RDS.22
  - RDS.23
  - SQS.1

## v0.11 [2021-08-05]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - APIGateway.3
  - APIGateway.4
  - CloudFront.5
  - CloudFront.6
  - EC2.16
  - EC2.17
  - EC2.18
  - ECS.1
  - ECS.2
  - ES.4
  - ES.6
  - ES.7
  - ES.8
  - IAM.21
  - RDS.15
  - RDS.16
  - RDS.17
  - Redshift.4
  - S3.8

## v0.10 [2021-07-23]

_Bug fixes_

- Fixed: Update multiple CloudTrail, CloudWatch, Config, Lambda, and S3 queries to work properly with multi-account connections ([#247](https://github.com/turbot/steampipe-mod-aws-compliance/pull/247))
- Fixed: Cleanup unnecessary quotes in various CloudFront, CloudTrail, GuardDuty and S3 queries ([#249](https://github.com/turbot/steampipe-mod-aws-compliance/pull/249))

## v0.9 [2021-07-14]

_What's new?_

- Added: NIST 800-53 Revision 4 benchmark (`steampipe check benchmark.nist_800_53_rev_4`)

## v0.8 [2021-07-01]

_What's new?_

- Added: NIST Cybersecurity Framework (CSF) benchmark (`steampipe check benchmark.nist_csf`)
- New AWS Foundational Security Best Practices controls added:
  - CodeBuild.1
  - CodeBuild.2
- New HIPAA controls added:
  - codebuild_project_source_repo_oauth_configured
- New PCI v3.2.1 controls added:
  - CodeBuild.1

_Enhancements_

- Updated: AWS Foundational Security Best Practices benchmark title now includes `AWS` for better readability
- Updated: Update column reference `table_arn` to `arn` in `dynamodb_table_auto_scaling_enabled`, `dynamodb_table_encrypted_with_kms_cmk`, `dynamodb_table_in_backup_plan`, `dynamodb_table_point_in_time_recovery_enabled` queries
- Updated: Update column reference `file_system_arn` to `arn` in `efs_file_system_automatic_backups_enabled`, `efs_file_system_encrypt_data_at_rest` queries

## v0.7 [2021-06-24]

_What's new?_

- New RBI Cyber Security Framework controls added:
  - dynamodb_table_in_backup_plan
  - ebs_volume_in_backup_plan
  - efs_file_system_in_backup_plan
  - rds_db_instance_in_backup_plan

## v0.6 [2021-06-18]

_What's new?_

- Added: RBI Cyber Security Framework benchmark (`steampipe check benchmark.rbi_cyber_security`)
- New Foundational Security controls added:
  - CloudTrail.1
  - EC2.7
  - EFS.2
  - SSM.2
  - SSM.3
- New HIPAA controls added:
  - cloudtrail_trail_enabled
  - guardduty_finding_archived
  - vpc_vpn_tunnel_up
- New PCI v3.2.1 controls added:
  - SSM.1
  - SSM.2

_Enhancements_

- Updated: CIS v1.3.0 and v1.4.0 benchmarks and controls now include the `service` tag
- Updated: Replaced `benchmark` tag for all benchmarks and controls with framework specific tags, e.g., `cis = true`, `hipaa = true`

## v0.5 [2021-06-15]

_What's new?_

- Added: HIPAA benchmark (`steampipe check benchmark.hipaa`)

## v0.4 [2021-06-03]

_What's new?_

- Added: CIS v1.4.0 benchmark (`steampipe check benchmark.cis_v140`)
- Added: AWS Foundational Security Best Practices benchmark (`steampipe check benchmark.foundational_security`)

## v0.3 [2021-05-28]

_Bug fixes_

- Minor fixes in the docs

## v0.2 [2021-05-27]

_What's new?_

- Added: Documentation for various PCI v3.2.1 benchmarks and controls
- New PCI v3.2.1 controls added
  - CloudWatch.1
  - CodeBuild.2
  - EC2.3
  - ELBV2.2
  - GuardDuty.1
  - S3.3

_Bug fixes_

- Fixed: `autoscaling_group_with_lb_use_healthcheck` query should skip groups that aren't associated with a load balancer ([#30](https://github.com/turbot/steampipe-mod-aws-compliance/pull/30))
