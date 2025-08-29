## Description

This control checks whether GuardDuty RDS Protection is enabled. For a standalone account, the control fails if GuardDuty RDS Protection is disabled in the account. In a multi-account environment, the control fails if the delegated GuardDuty administrator account and all member accounts don't have RDS Protection enabled.

In a multi-account environment, the control generates findings in only the delegated GuardDuty administrator account. Only the delegated administrator can enable or disable the RDS Protection feature for the member accounts in the organization. GuardDuty member accounts can't modify this configuration from their accounts. This control generates FAILED findings if the delegated GuardDuty administrator has a suspended member account that doesn't have GuardDuty RDS Protection enabled. To receive a PASSED finding, the delegated administrator must disassociate these suspended accounts in GuardDuty.

RDS Protection in GuardDuty analyzes and profiles RDS login activity for potential access threats to your Amazon Aurora databases (Aurora MySQL-Compatible Edition and Aurora PostgreSQL-Compatible Edition). This feature allows you to identify potentially suspicious login behavior. RDS Protection doesn't require additional infrastructure; it is designed so as not to affect the performance of your database instances. When RDS Protection detects a potentially suspicious or anomalous login attempt that indicates a threat to your database, GuardDuty generates a new finding with details about the potentially compromised database.

## Remediation

To enable GuardDuty RDS Protection, see [GuardDuty RDS Protection](https://docs.aws.amazon.com/guardduty/latest/ug/rds-protection.html) in the Amazon GuardDuty User Guide.



