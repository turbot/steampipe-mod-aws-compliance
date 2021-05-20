mod "aws_compliance" {
  # hub metadata
  title          = "AWS Compliance"
  description    = "Steampipe mod for checking if Amazon Web Services (AWS) resources are compliant with popular benchmarks like CIS, PCI and more."
  color          = "#FF9900"
  documentation  = file("./docs/index.md")
  icon           = "/images/mods/turbot/aws-compliance.svg"
  categories     = ["AWS", "CIS", "Compliance", "PCI DSS", "Public Cloud", "Security"]

  opengraph {
    title         = "Steampipe Mod for AWS Compliance"
    description   = "Run individual configuration, compliance and security controls or full compliance benchmarks for CIS and PCI across all your AWS accounts using Steampipe."
    #image        = "/images/mods/turbot/aws-compliance-social-graphic.png"  
  }
}
