## Description

This control checks whether AWS Service Catalog shares portfolios within an organization when the integration with AWS Organizations is enabled. The control fails if portfolios aren't shared within an organization.

Portfolio sharing only within Organizations helps ensure that a portfolio isn't shared with incorrect AWS accounts. To share a Service Catalog portfolio with an account in an organization, Security Hub recommends using ORGANIZATION_MEMBER_ACCOUNT instead of ACCOUNT. This simplifies administration by governing the access granted to the account across the organization. If you have a business need to share Service Catalog portfolios with an external account, you can [automatically suppress the findings](https://docs.aws.amazon.com/securityhub/latest/userguide/automation-rules.html) from this control or [disable it](https://docs.aws.amazon.com/securityhub/latest/userguide/disable-controls-overview.html).

## Remediation

To enable portfolio sharing with AWS Organizations, see [Sharing with AWS Organizations](https://docs.aws.amazon.com/servicecatalog/latest/adminguide/catalogs_portfolios_sharing_how-to-share.html#portfolio-sharing-organizations) in the AWS Service Catalog Administrator Guide.