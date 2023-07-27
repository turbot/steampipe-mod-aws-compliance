---
repository: "https://github.com/turbot/steampipe-mod-aws-compliance"
---

# AWS Compliance Mod

Run individual configuration, compliance and security controls or full compliance benchmarks for `Audit Manager Control Tower`, `AWS Foundational Security Best Practices`, `CIS`, `CISA Cyber Essentials`, `FedRAMP`, `FFIEC`, `GDPR`, `GxP 21 CFR Part 11`, `GxP EU Annex 11`, `HIPAA Final Omnibus Security Rule 2013`, `HIPAA Security Rule 2003`, `NIST 800-53`, `NIST CSF`, `PCI DSS`, `RBI Cyber Security Framework` and `SOC 2` across all your AWS accounts.

<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_compliance_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_cis_v140_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_cis_v140_console.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_fsbp_dashboard.png" width="50%" type="thumbnail"/>

## References

[AWS](https://aws.amazon.com/) provides on-demand cloud computing platforms and APIs to authenticated customers on a metered pay-as-you-go basis.

[AWS Foundational Security Best Practices](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html) is a set of controls that detect when your deployed accounts and resources deviate from security best practices.

[CIS AWS Benchmarks](https://www.cisecurity.org/benchmark/amazon_web_services/) provide a predefined set of compliance and security best-practice checks for AWS accounts.

[CISA Cyber Essentials](https://www.cisa.gov/cyber-essentials) provide an actionable understanding of where to start implementing organizational cybersecurity practices.

[Audit Manager Control Tower](https://docs.aws.amazon.com/audit-manager/latest/userguide/controltower.html) provide the easiest way to set up and govern a secure, multi-account AWS environment.

[FedRAMP](https://www.fedramp.gov/baselines/) is a US government-wide program that delivers a standard approach to the security assessment, authorization, and continuous monitoring for cloud products and services.

[FFIEC](https://www.ffiec.gov/cyberassessmenttool.htm) provides a set of security standards for the Federal Financial Institutions Examination Council (FFIEC) Cyber Security Assessment Tool domains.

[GDPR](https://docs.aws.amazon.com/audit-manager/latest/userguide/GDPR.html) provides a set of robust requirements that raise and harmonize standards for data protection, security, and compliance throughout the European Union (EU).

[GxP 21 CFR Part 11](https://www.ecfr.gov/current/title-21/chapter-I/subchapter-A/part-11?toc=1) includes details for the criteria under which electronic records and signatures are considered trustworthy and equivalent to paper records and ensures the integrity of data used to make product-related safety decisions.

[GxP EU Annex 11](https://health.ec.europa.eu/system/files/2016-11/annex11_01-2011_en_0.pdf.) includes a prebuilt collection of controls with descriptions and testing procedures where controls are grouped into control sets according to GxP requirements.

[HIPAA Final Omnibus Security Rule 2013](https://www.hhs.gov/hipaa/for-professionals/privacy/laws-regulations/combined-regulation-text/omnibus-hipaa-rulemaking/index.html) implements a number of provisions of the Health Information Technology for Economic and Clinical Health (HITECH) Act, enacted as part of the American Recovery and Reinvestment Act of 2009, to strengthen the privacy and security protections for health information established under the Health Insurance Portability and Accountability Act of 1996 (HIPAA).

[HIPAA Security Rule 2003](https://www.hhs.gov/hipaa/for-professionals/security/index.html) establishes national standards to protect individuals' electronic personal health information that is created, received, used, or maintained by a covered entity.

[NIST 800-53](https://csrc.nist.gov/publications/detail/sp/800-53/rev-5/final) provides minimum baselines of security controls for U.S. federal information systems except those related to national security.

[NIST CSF](https://www.nist.gov/cyberframework) provides security standards for managing and reducing cybersecurity risk.

[NIST 800-171](https://csrc.nist.gov/publications/detail/sp/800-171/rev-2/final) provides minimum baselines of security controls for protecting the confidentiality of Controlled Unclassified Information (CUI) in nonfederal systems and organizations, and recommends specific security requirements to achieve that objective.

[PCI DSS](https://www.pcisecuritystandards.org) provides security standards for the payment card industry.

[RBI Cyber Security Framework](https://www.rbi.org.in/Scripts/NotificationUser.aspx?Id=11397) provides a cyber security framework for Urban Cooperative Banks (UCB) in India.

[SOC 2](https://docs.aws.amazon.com/audit-manager/latest/userguide/SOC2.html) provides an auditing procedure that ensures a company's data is securely managed.

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Steampipe Mods](https://steampipe.io/docs/reference/mod-resources#mod) are collections of `named queries`, and codified `controls` that can be used to test current configuration of your cloud resources against a desired configuration.

## Documentation

- **[Benchmarks and controls →](https://hub.steampipe.io/mods/turbot/aws_compliance/controls)**
- **[Named queries →](https://hub.steampipe.io/mods/turbot/aws_compliance/queries)**

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
git clone https://github.com/turbot/steampipe-mod-aws-compliance.git
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
window at http://localhost:9194. From here, you can run benchmarks by
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

- **[Join #steampipe on Slack →](https://turbot.com/community/join)** and hang out with other Mod developers.

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-aws-compliance/blob/main/LICENSE).

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [AWS Compliance Mod](https://github.com/turbot/steampipe-mod-aws-compliance/labels/help%20wanted)
