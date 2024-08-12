## Description

Ensure that Amazon CloudWatch Lambda Insights is enabled for your Amazon Lambda functions for enhanced monitoring.

Amazon CloudWatch Lambda Insights allows you to monitor, troubleshoot, and optimize your Lambda functions. The service collects system-level metrics and summarizes diagnostic information to help you identify issues with your Lambda functions and resolve them as soon as possible. CloudWatch Lambda Insights collects system-level metrics and emits a single performance log event for every invocation of that Lambda function.

## Remediation

### From the Console:

1. Login to AWS Console using https://console.aws.amazon.com/lambda/.
2. Click `Functions`.
3. Click on the name of the function.
4. Click on the `Configuration tab`.
5. Click on 'Monitoring and operations tools'.
6. In the Monitoring and operations tools section click `Edit` to update the monitoring configuration.
7. In the CloudWatch Lambda Insights section click the `Enhanced monitoring` button to enable.
***Note*** - When you enable the feature using the AWS Management Console, Amazon Lambda adds the required permissions to your function's execution role.
8. Click Save.
9. Repeat steps 2-8 for each Lambda function within the current region that fails the Audit.
10. Then repeat the Audit process for all other regions.