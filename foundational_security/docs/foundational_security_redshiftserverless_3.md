## Description

This control checks whether public access is disabled for an Amazon Redshift Serverless workgroup. It evaluates the publiclyAccessible property of a Redshift Serverless workgroup. The control fails if public access is enabled (true) for the workgroup.

The public access (publiclyAccessible) setting for an Amazon Redshift Serverless workgroup specifies whether the workgroup can be accessed from a public network. If public access is enabled (true) for a workgroup, Amazon Redshift creates an Elastic IP address that makes the workgroup publicly accessible from outside the VPC. If you don't want a workgroup to be publicly accessible, disable public access for it.

## Remediation

For information about changing the public access setting for an Amazon Redshift Serverless workgroup, see [Viewing the properties for a workgroup](https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-console-workgroups.html) in the Amazon Redshift Management Guide.