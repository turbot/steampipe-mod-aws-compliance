## Description

Enable IAM Access analyzer for IAM policies about all resources in each active AWS region.

IAM Access Analyzer is a technology introduced at AWS reinvent 2019. After the Analyzer is enabled in IAM, scan results are displayed on the console showing the accessible resources. Scans show resources that other accounts and federated users can access, such as KMS keys and IAM roles. So the results allow you to determine if an unintended user is allowed, making it easier for administrators to monitor least privileges access. Access Analyzer analyzes only policies that are applied to resources in the same AWS Region.

AWS IAM Access Analyzer helps you identify the resources in your organization and accounts, such as Amazon S3 buckets or IAM roles, that are shared with an external entity. This lets you identify unintended access to your resources and data. Access Analyzer identifies resources that are shared with external principals by using logic- based reasoning to analyze the resource-based policies in your AWS environment. IAM Access Analyzer continuously monitors all policies for S3 bucket, IAM roles, KMS (Key Management Service) keys, AWS Lambda functions, and Amazon SQS(Simple Queue Service) queues.

## Remediation

### From Console:

Perform the following to enable IAM Access analyzer for IAM policies:

1. Open the IAM console athttps://console.aws.amazon.com/iam/.
2. Choose `Access analyzer`.
3. Choose `Create analyzer`.
4. On the `Create analyzer` page, confirm that the `Region` displayed is the Region where you want to enable Access Analyzer.
5. Enter a name for the analyzer. `Optional as it will generatea name for you automatically`.
6. Add any tags that you want to apply to the analyzer. `Optional`.
7. Choose `Create Analyzer`.
8. Repeat these step for each active region.

### From Command Line:

Run the following command:

```bash
aws accessanalyzer create-analyzer --analyzer-name <NAME> --type <ACCOUNT|ORGANIZATION>
```
Repeat this command above for each active region.

**Note**: The IAM Access Analyzer is successfully configured only when the account you use has the necessary permissions.