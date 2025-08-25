## Description

This control checks whether an Amazon MQ broker has automatic minor version upgrade enabled. The control fails if the broker doesn't have automatic minor version upgrade enabled.

As Amazon MQ releases and supports new broker engine versions, the changes are backward-compatible with an existing application and don't deprecate existing functionality. Automatic broker engine version updates protect you against security risks, help fix bugs, and improve functionality.

## Remediation

To enable automatic minor version upgrade for an MQ broker, see [Automatically upgrading the minor engine version](https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/upgrading-brokers.html#upgrading-brokers-automatic-upgrades.html) in the Amazon MQ Developer Guide.