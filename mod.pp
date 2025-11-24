mod "aws_compliance" {
  # Hub metadata
  title         = "AWS Compliance"
  description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, FFIEC, PCI, NIST, HIPAA, RBI CSF, GDPR, SOC 2, Audit Manager Control Tower, FedRAMP, GxP and AWS Foundational Security Best Practices controls across all your AWS accounts using Powerpipe and Steampipe."
  color         = "#FF9900"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/aws-compliance.svg"
  categories    = ["aws", "cis", "compliance", "pci dss", "public cloud", "security"]
  database      = var.database

  opengraph {
    title       = "Powerpipe Mod for AWS Compliance"
    description = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS, FFIEC, PCI, NIST, HIPAA, RBI CSF, GDPR, SOC 2, Audit Manager Control Tower, FedRAMP, GxP and AWS Foundational Security Best Practices controls across all your AWS accounts using Powerpipe and Steampipe."
    image       = "/images/mods/turbot/aws-compliance-social-graphic.png"
  }

  require {
    plugin "aws" {
      min_version = "1.28.0"
    }
  }
}
