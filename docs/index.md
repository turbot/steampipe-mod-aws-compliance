---
organization: Turbot
category: ["aws", "cis", "compliance", "pci dss", "public cloud", "security"]
icon_url: "/images/mods/turbot/aws-compliance.svg"
brand_color: "#FF9900"
display_name: "AWS Compliance"
short_name: "aws-compliance"
description: "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS and PCI across all your AWS accounts using Steampipe."
og_description: "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS and PCI across all your AWS accounts using Steampipe." 
og_image: "/images/mods/turbot/aws-compliance-social-graphic.png"
repository: "https://github.com/turbot/steampipe-mod-aws-compliance"
---

# AWS Compliance Mod

Run individual configuration, compliance and security controls or full compliance benchmarks for `CIS`, `HIPAA`, `NIST 800-53`, `NIST CSF` and `PCI DSS` across all your AWS accounts.

## References

[AWS](https://aws.amazon.com/) provides on-demand cloud computing platforms and APIs to authenticated customers on a metered pay-as-you-go basis.

[CIS AWS Benchmarks](https://www.cisecurity.org/benchmark/amazon_web_services/) provide a predefined set of compliance and security best-practice checks for AWS accounts.

[NIST 800-53](https://csrc.nist.gov/publications/detail/sp/800-53/rev-4/final) provides minimum baselines of security controls for U.S. federal information systems except those related to national security.

[NIST CSF](https://www.nist.gov/cyberframework) provides security standards for managing and reducing cybersecurity risk.

[PCI DSS](https://www.pcisecuritystandards.org) provides security standards for the payment card industry.

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Steampipe Mods](https://steampipe.io/docs/reference/mod-resources#mod) are collections of `named queries`, and codified `controls` that can be used to test current configuration of your cloud resources against a desired configuration.

## Documentation

- **[Benchmarks and controls →](https://hub.steampipe.io/mods/turbot/aws_compliance/controls)**
- **[Named queries →](https://hub.steampipe.io/mods/turbot/aws_compliance/queries)**

## Get started

Install the AWS plugin with [Steampipe](https://steampipe.io):
```shell
steampipe plugin install aws
```

Clone:
```sh
git clone git@github.com:turbot/steampipe-mod-aws-compliance
cd steampipe-mod-aws-compliance
```

Run all benchmarks:
```shell
steampipe check all
```

Run a single benchmark:
```shell
steampipe check benchmark.cis_v140
```

Run a specific control:
```shell
steampipe check control.cis_v140_2_1_1
```

### Credentials

This mod uses the credentials configured in the [Steampipe AWS plugin](https://hub.steampipe.io/plugins/turbot/aws).

### Configuration

No extra configuration is required.

## Get involved

* Contribute: [GitHub Repo](https://github.com/turbot/steampipe-mod-aws-compliance)
* Community: [Slack Channel](https://join.slack.com/t/steampipe/shared_invite/zt-oij778tv-lYyRTWOTMQYBVAbtPSWs3g)
