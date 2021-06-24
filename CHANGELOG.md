## v0.7 [2021-06-24]

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
