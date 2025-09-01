## Description

This control checks whether an Amazon S3 Multi-Region Access Point has block public access settings enabled. The control fails when the Multi-Region Access Point doesn't have block public access settings enabled.

Publicly accessible resources can be lead to unauthorized access, data breaches, or exploitation of vulnerabilities. Restricting access through authentication and authorization measures helps to safeguard sensitive information and maintain the integrity of your resources.

## Remediation

By default, all Block Public Access settings are enabled for an S3 Multi-Region Access Point. For more information , see [Blocking public access with Amazon S3 Multi-Region Access Points](https://docs.aws.amazon.com/AmazonS3/latest/userguide/multi-region-access-point-block-public-access.html) in the Amazon Simple Storage Service User Guide. You can't change the Block Public Access settings for a Multi-Region Access Point after it has been created.

