## Description

Amazon S3 buckets can contain sensitive data, that for security purposes should be discovered, monitored, classified and protected. Macie along with other 3rd party tools can automatically provide an inventory of Amazon S3 buckets.

Using a Cloud service or 3rd Party software to continuously monitor and automate the process of data discovery and classification for S3 buckets using machine learning and pattern matching is a strong defense in protecting that information.

Amazon Macie is a fully managed data security and data privacy service that uses machine learning and pattern matching to discover and protect your sensitive data in AWS.

## Remediation

Perform the steps below to enable and configure Amazon Macie

### From Console:

1. Log on to the Macie console at https://console.aws.amazon.com/macie/
2. Click `Get started`.
3. Click `Enable Macie`.

Setup a repository for sensitive data discovery results

1. In the Left pane, under Settings, click `Discovery results`.
2. Make sure `Create bucket` is selected.
3. Create a bucket, enter a name for the bucket. The name must be unique across all S3 buckets. In addition, the name must start with a lowercase letter or a number.
4. Click on `Advanced`.
5. Block all public access, make sure `Yes` is selected.
6. KMS encryption, specify the AWS KMS key that you want to use to encrypt the results. The key must be a symmetric, customer master key (CMK) that's in the same Region as the S3 bucket.
7. Click on `Save`.

Create a job to discover sensitive data

1. In the left pane, click `S3 buckets`. Macie displays a list of all the S3 buckets for your account.
2. Select the `check box` for each bucket that you want Macie to analyze as part of the job
3. Click `Create job`.
4. Click `Quick create`.
5. For the Name and description step, enter a name and, optionally, a description of the job.
6. Then click `Next`.
7. For the Review and create step, click `Submit`.

Review your findings

1. In the left pane, click `Findings`.
2. To view the details of a specific finding, choose any field other than the check box for the finding.

If you are using a 3rd Party tool to manage and protect your s3 data, follow the Vendor documentation for implementing and configuring that tool.
