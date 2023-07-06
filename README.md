# AWS Compliance Mod for Steampipe

475+ checks covering industry defined security best practices across all AWS regions. Includes full support for multiple best practice benchmarks including PCI DSS, AWS Foundational Security, CISA Cyber Essentials, FedRAMP, FFIEC, GxP 21 CFR Part 11, GxP EU Annex 11, HIPAA Final Omnibus Security Rule 2013, HIPAA Security Rule 2003, NIST 800-53, NIST CSF, Reserve Bank of India, Audit Manager Control Tower **and the latest (v1.5.0) CIS benchmarks**.

Run checks in a dashboard:
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_cis_v140_dashboard.png)

Or in a terminal:
![image](https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_cis_v140_console.png)

Includes support for:
* [AWS CIS Controls v8 IG1](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.cis_controls_v8_ig1) 🚀 New!
* [AWS CIS v1.2.0](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.cis_v120)
* [AWS CIS v1.3.0](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.cis_v130)
* [AWS CIS v1.4.0](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.cis_v140)
* [AWS CIS v1.5.0](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.cis_v150)
* [AWS CIS v2.0.0](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.cis_v200) 🚀 New!
* [AWS Foundational Security Best Practices](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.foundational_security)
* [Audit Manager Control Tower](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.control_tower)
* [CISA Cyber Essentials](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.cisa_cyber_essentials)
* [FedRAMP Low Revision 4](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.fedramp_low_rev_4)
* [FedRAMP Moderate Revision 4](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.fedramp_moderate_rev_4)
* [Federal Financial Institutions Examination Council (FFIEC)](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.ffiec)
* [General Data Protection Regulation (GDPR)](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.gdpr)
* [GxP 21 CFR Part 11](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.gxp_21_cfr_part_11)
* [GxP EU Annex 11](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.gxp_eu_annex_11)
* [HIPAA Final Omnibus Security Rule 2013](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.hipaa_final_omnibus_security_rule_2013)
* [HIPAA Security Rule 2003](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.hipaa_security_rule_2003)
* [NIST 800-171 Revision 2](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.nist_800_171_rev_2)
* [NIST 800-53 Revision 4](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.nist_800_53_rev_4)
* [NIST 800-53 Revision 5](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.nist_800_53_rev_5)
* [NIST Cybersecurity Framework (CSF)](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.nist_csf)
* [Other Compliance Checks](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.other)
* [PCI DSS v3.2.1](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.pci_dss_v321)
* [Reserve Bank of India (RBI) Cyber Security Framework](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.rbi_cyber_security)
* [SOC 2](https://hub.steampipe.io/mods/turbot/aws_compliance/controls/benchmark.soc_2)

## Getting started

### Installation

Download and install Steampipe (https://steampipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install steampipe
```

Install the AWS plugin with [Steampipe](https://steampipe.io):

```sh
steampipe plugin install aws
```

Clone:

```sh
git clone http://github.com/turbot/steampipe-mod-aws-compliance.git
cd steampipe-mod-aws-compliance
```

### Usage

Before running any benchmarks, it's recommended to generate your AWS credential report:

```sh
aws iam generate-credential-report
```

Start your dashboard server to get started:

```sh
steampipe dashboard
```

By default, the dashboard interface will then be launched in a new browser
window at https://localhost:9194. From here, you can run benchmarks by
selecting one or searching for a specific one.

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `steampipe check` command:

Run all benchmarks:

```sh
steampipe check all
```

Run a single benchmark:

```sh
steampipe check benchmark.cis_v150
```

Run a specific control:

```sh
steampipe check control.cis_v150_2_1_1
```

Different output formats are also available, for more information please see
[Output Formats](https://steampipe.io/docs/reference/cli/check#output-formats).

### Credentials

This mod uses the credentials configured in the [Steampipe AWS plugin](https://hub.steampipe.io/plugins/turbot/aws).

### Configuration

No extra configuration is required.

### Common and Tag Dimensions

The benchmark queries use common properties (like `account_id`, `connection_name` and `region`) and tags that are defined in the form of a default list of strings in the `mod.sp` file. These properties can be overwritten in several ways:

- Copy and rename the `steampipe.spvars.example` file to `steampipe.spvars`, and then modify the variable values inside that file
- Pass in a value on the command line:

  ```shell
  steampipe check benchmark.cis_v150 --var 'common_dimensions=["account_id", "connection_name", "region"]'
  ```

  ```shell
  steampipe check benchmark.cis_v150 --var 'tag_dimensions=["Environment", "Owner"]'
  ```

- Set an environment variable:

  ```shell
  SP_VAR_common_dimensions='["account_id", "connection_name", "region"]' steampipe check control.cis_v150_5_1
  ```

  ```shell
  SP_VAR_tag_dimensions='["Environment", "Owner"]' steampipe check control.cis_v150_5_1
  ```

## Contributing

If you have an idea for additional controls or just want to help maintain and extend this mod ([or others](https://github.com/topics/steampipe-mod)) we would love you to join the community and start contributing.

- **[Join our Slack community →](https://steampipe.io/community/join)** and hang out with other Mod developers.

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-aws-compliance/blob/main/LICENSE).

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [AWS Compliance Mod](https://github.com/turbot/steampipe-mod-aws-compliance/labels/help%20wanted)
