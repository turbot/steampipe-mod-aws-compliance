## Description

This control checks whether OpenSearch domains have fine-grained access control enabled. The control fails if the fine-grained access control is not enabled. Fine-grained access control requires advanced-security-optionsin the OpenSearch parameter update-domain-config to be enabled.

Fine-grained access control offers additional ways of controlling access to your data on Amazon OpenSearch Service.

## Remediation

To enable fine-grained access control on an existing domain 

1. Select your domain and choose Actions and Edit security configuration.
2. Select Enable fine-grained access control.
3. Choose how to create the master user:
  - If you want to use IAM for user management, choose Set IAM ARN as master user and specify the ARN for an IAM role.
  - If you want to use the internal user database, choose Create master user and specify a user name and password.
4. (Optional) Select Enable migration period for open/IP-based access policy. This setting enables a 30-day transition period during which your existing users can continue to access the domain without disruptions, and existing open and IP-based access policies will continue to work with your domain. During this migration period, we recommend that administrators create the necessary roles and map them to users for the domain. If you use identity-based policies instead of an open or IP-based access policy, you can disable this setting.
You also need to update your clients to work with fine-grained access control during the migration period. For example, if you map IAM users with fine-grained access control, you must update your clients to start signing requests with AWS Signature Version 4. If you configure HTTP basic authentication with fine-grained access control, you must update your clients to provide appropriate basic authentication credentials in requests.
During the migration period, users who access the OpenSearch Dashboards endpoint for the domain will land directly on the Discover page rather than the login page. Administrators and master users can choose Login to log in with admin credentials and configure role mappings.
5. Choose Save changes.

