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
