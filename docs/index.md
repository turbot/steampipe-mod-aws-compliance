---
repository: "https://github.com/turbot/steampipe-mod-aws-compliance"
---

# AWS Compliance Mod

Run individual configuration, compliance and security controls or full compliance benchmarks for `Audit Manager Control Tower`, `AWS Foundational Security Best Practices`, `CIS`, `FedRAMP Low Revision 4`, `FedRAMP Moderate Revision 4`, `GDPR`, `HIPAA`, `NIST 800-53`, `NIST CSF`, `PCI DSS`, `RBI Cyber Security Framework` and `SOC 2` across all your AWS accounts.

<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_compliance_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_cis_v140_dashboard.png" width="50%" type="thumbnail"/>
<img src="https://raw.githubusercontent.com/turbot/steampipe-mod-aws-compliance/main/docs/aws_cis_v140_console.png" width="50%" type="thumbnail"/>

## References

[AWS](https://aws.amazon.com/) provides on-demand cloud computing platforms and APIs to authenticated customers on a metered pay-as-you-go basis.

[AWS Foundational Security Best Practices](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html) is a set of controls that detect when your deployed accounts and resources deviate from security best practices.

[CIS AWS Benchmarks](https://www.cisecurity.org/benchmark/amazon_web_services/) provide a predefined set of compliance and security best-practice checks for AWS accounts.

[Audit Manager Control Tower](https://docs.aws.amazon.com/audit-manager/latest/userguide/controltower.html) provide the easiest way to set up and govern a secure, multi-account AWS environment.

[FedRAMP Low Revision 4](https://www.fedramp.gov/assets/resources/documents/FedRAMP_Low_Security_Controls.xlsx) provide a standard approach to the security assessment, authorization, and continuous monitoring for cloud products and services."

[FedRAMP Moderate Revision 4](https://www.fedramp.gov/assets/resources/documents/FedRAMP_Moderate_Security_Controls.xlsx) provide a standard approach to the security assessment, authorization, and continuous monitoring for cloud products and services."

[GDPR](https://docs.aws.amazon.com/audit-manager/latest/userguide/GDPR.html) provides a set of robust requirements that raise and harmonize standards for data protection, security, and compliance throughout the European Union (EU).

[HIPAA Compliance](https://aws.amazon.com/compliance/hipaa-compliance/) provides a set of general-purpose security standards for the U.S. Health Insurance Portability and Accountability Act (HIPAA).

[NIST 800-53](https://csrc.nist.gov/publications/detail/sp/800-53/rev-4/final) provides minimum baselines of security controls for U.S. federal information systems except those related to national security.

[NIST CSF](https://www.nist.gov/cyberframework) provides security standards for managing and reducing cybersecurity risk.

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
steampipe check benchmark.cis_v140
```

Run a specific control:

```sh
steampipe check control.cis_v140_2_1_1
```

Different output formats are also available, for more information please see
[Output Formats](https://steampipe.io/docs/reference/cli/check#output-formats).

### Credentials

This mod uses the credentials configured in the [Steampipe AWS plugin](https://hub.steampipe.io/plugins/turbot/aws).

### Configuration

No extra configuration is required.

## Contributing

If you have an idea for additional controls or just want to help maintain and extend this mod ([or others](https://github.com/topics/steampipe-mod)) we would love you to join the community and start contributing.

- **[Join our Slack community →](https://steampipe.io/community/join)** and hang out with other Mod developers.

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-aws-compliance/blob/main/LICENSE).

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [AWS Compliance Mod](https://github.com/turbot/steampipe-mod-aws-compliance/labels/help%20wanted)
