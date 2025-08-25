## Description

This control checks whether Amazon CloudWatch logging is enabled for AWS Systems Manager (SSM) Automation. The control fails if CloudWatch logging isn't enabled for SSM Automation.

SSM Automation is an AWS Systems Manager tool that helps you build automated solutions to deploy, configure, and manage AWS resources at scale using predefined or custom runbooks. To meet operational or security requirements for your organization, you might need to provide a record of the scripts that it runs. You can configure SSM Automation to send the output from aws:executeScript actions in your runbooks to an Amazon CloudWatch Logs log group that you specify. With CloudWatch Logs, you can monitor, store, and access log files from various AWS services.

## Remediation

For information about enabling CloudWatch logging for SSM Automation, see [Logging Automation action output with CloudWatch Logs](https://docs.aws.amazon.com/systems-manager/latest/userguide/automation-action-logging.html) in the AWS Systems Manager User Guide.