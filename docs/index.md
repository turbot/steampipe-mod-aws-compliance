# AWS Compliance Mod

Run individual configuration, compliance and security controls or full compliance benchmarks for `Audit Manager Control Tower`, `AWS Foundational Security Best Practices`, `CIS`, `CISA Cyber Essentials`, `FedRAMP`, `FFIEC`, `GDPR`, `GxP 21 CFR Part 11`, `GxP EU Annex 11`, `HIPAA Final Omnibus Security Rule 2013`, `HIPAA Security Rule 2003`, `NIST 800-53`, `NIST CSF`, `PCI DSS`, `RBI Cyber Security Framework`, `SOC 2`, and more across all your AWS accounts.

<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_compliance_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_cis_v140_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_cis_v140_console.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_fsbp_dashboard.png" width="50%" type="thumbnail"/>

## Documentation

- **[Benchmarks and controls →](https://hub.powerpipe.io/mods/turbot/aws_compliance/controls)**
- **[Named queries →](https://hub.powerpipe.io/mods/turbot/aws_compliance/queries)**

## Getting Started

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

Install Powerpipe (https://powerpipe.io/downloads). Or use Brew:

```sh
brew install powerpipe
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
powerpipe dashboard
```

By default, the dashboard interface will then be launched in a new browser
window at https://localhost:9194. From here, you can run benchmarks by
selecting one or searching for a specific one.

Instead of running benchmarks in a dashboard, you can also run them within your
terminal with the `powerpipe check` command:

Run all controls:

```sh
powerpipe benchmark run all_controls
```

Run a single benchmark:

```sh
powerpipe benchmark run cis_v300
```

Run a specific control:

```sh
powerpipe control run cis_v300_2_1_1
```

Different output formats are also available, for more information please see
[Output Formats](https://powerpipe.io/docs/reference/cli/benchmark#output-formats).

### Credentials

This mod uses the credentials configured in the [Steampipe AWS plugin](https://hub.steampipe.io/plugins/turbot/aws).

### Configuration

No extra configuration is required.

### Common and Tag Dimensions

The benchmark queries use common properties (like `account_id`, `connection_name` and `region`) and tags that are defined in the form of a default list of strings in the `mod.sp` file. These properties can be overwritten in several ways:

- Copy and rename the `powerpipe.ppvars.example` file to `powerpipe.ppvars`, and then modify the variable values inside that file
- Pass in a value on the command line:

  ```shell
  powerpipe benchmark run cis_v300 --var 'common_dimensions=["account_id", "connection_name", "region"]'
  ```

  ```shell
  powerpipe benchmark run cis_v300 --var 'tag_dimensions=["Environment", "Owner"]'
  ```

- Set an environment variable:

  ```shell
  SP_VAR_common_dimensions='["account_id", "connection_name", "region"]' powerpipe control run cis_v300_5_1
  ```

  ```shell
  SP_VAR_tag_dimensions='["Environment", "Owner"]' powerpipe control run cis_v300_5_1
  ```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Steampipe](https://steampipe.io) and [Powerpipe](https://powerpipe.io) are products produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). They are distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #powerpipe on Slack →](https://turbot.com/community/join)**

Want to help but don't know where to start? Pick up one of the `help wanted` issues:

- [Powerpipe](https://github.com/turbot/powerpipe/labels/help%20wanted)
- [AWS Compliance Mod](https://github.com/turbot/steampipe-mod-aws-compliance/labels/help%20wanted)
