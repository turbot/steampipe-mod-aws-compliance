## Description

This control checks whether the admin username for an Amazon Redshift Serverless namespace is the default admin username, admin. The control fails if the admin username for the Redshift Serverless namespace is admin. You can optionally specify a list of admin usernames for the control to include in the evaluation.

When creating an Amazon Redshift Serverless namespace, you should specify a custom admin username for the namespace. The default admin username is public knowledge. By specifying a custom admin username, you can, for example, help mitigate the risk or effectiveness of brute force attacks against the namespace.

## Remediation

You can change the admin username for an Amazon Redshift Serverless namespace by using the Amazon Redshift Serverless console or API. To change it by using the console, choose the namespace configuration, and then choose Edit admin credentials on the Actions menu. To change it programmatically, use the [UpdateNamespace](https://docs.aws.amazon.com/redshift-serverless/latest/APIReference/API_UpdateNamespace.html) operation or, if you’re using the AWS CLI, run the [update-namespace](https://docs.aws.amazon.com/cli/latest/reference/redshift-serverless/update-namespace.html) command. If you change the admin username, you must also change the admin password at the same time.